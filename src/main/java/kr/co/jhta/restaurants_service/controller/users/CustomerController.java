package kr.co.jhta.restaurants_service.controller.users;

import kr.co.jhta.restaurants_service.controller.command.OtpCommand;
import kr.co.jhta.restaurants_service.controller.command.UserCommand;
import kr.co.jhta.restaurants_service.dto.FollowRequestDto;
import kr.co.jhta.restaurants_service.projection.Projection;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.security.service.UserService;
import kr.co.jhta.restaurants_service.service.OtpService;
import kr.co.jhta.restaurants_service.service.PostService;
import kr.co.jhta.restaurants_service.service.ReviewService;
import kr.co.jhta.restaurants_service.service.SocialService;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.post.PostData;
import kr.co.jhta.restaurants_service.vo.review.Review;
import kr.co.jhta.restaurants_service.vo.review.ReviewPicture;
import kr.co.jhta.restaurants_service.vo.socials.FollowRequest;
import kr.co.jhta.restaurants_service.vo.user.Otp;
import kr.co.jhta.restaurants_service.vo.user.User;
import org.jboss.logging.Logger;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    public static String[] PUBLIC_URLS = {
            "/customer/signup",
            "/customer/otp",
            "/customer/otp-check",
            "/customer/details"
    };
    private final UserService userService;
    private final OtpService otpService;
    private final PostService postService;
    private final SocialService socialService;
    private final ReviewService reviewService;
    Logger logger = Logger.getLogger(UserController.class);

    public CustomerController(UserService userService, OtpService otpService, PostService postService, SocialService socialService, ReviewService reviewService) {
        this.userService = userService;
        this.otpService = otpService;
        this.postService = postService;
        this.socialService = socialService;
        this.reviewService = reviewService;
    }

    @ResponseBody
    @PostMapping("/follow")
    public ResponseEntity follow(@RequestParam("recipientId") int recipientId,
                                 @AuthenticationPrincipal SecurityUser securityUser) {

        if (socialService.handleFollowRequest(securityUser.getUser().getId(), recipientId)) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.badRequest().build();
        }
    }

    @ResponseBody
    @GetMapping("/postData")
    public ResponseEntity<Page<PostData>> pictureData(@AuthenticationPrincipal SecurityUser securityUser,
                                                      @RequestParam("page") Optional<Integer> page,
                                                      @RequestParam("limit") Optional<Integer> limit,
                                                      @RequestParam("id") Optional<Integer> othersId) {

        Page<PostData> postData =
                postService.getPostDataByCustomerIdOrderByCreateDateDesc(
                        othersId.orElse(securityUser.getUser().getId()),
                        page.orElse(0),
                        limit.orElse(9)
                );

        return ResponseEntity.of(Optional.ofNullable(postData));
    }

    @ResponseBody
    @GetMapping("/reviewData")
    public ResponseEntity<Page<ReviewPicture>> reviewData(@AuthenticationPrincipal SecurityUser securityUser,
                                                          @RequestParam("page") Optional<Integer> page,
                                                          @RequestParam("limit") Optional<Integer> limit,
                                                          @RequestParam("id") Optional<Integer> othersId) {

        Page<ReviewPicture> reviewData =
                reviewService.getReviewPicturesByCustomerIdOrderByCreateDateDesc(
                        othersId.orElse(securityUser.getUser().getId()),
                        page.orElse(0),
                        limit.orElse(9)
                );

        return ResponseEntity.of(Optional.ofNullable(reviewData));
    }

    @ResponseBody
    @GetMapping("/reviews")
    public ResponseEntity<Page<Projection.Review>> reviews(@AuthenticationPrincipal SecurityUser securityUser,
                                                           @RequestParam("page") Optional<Integer> page,
                                                           @RequestParam("limit") Optional<Integer> limit,
                                                           @RequestParam("id") Optional<Integer> othersId) {
        Page<Projection.Review> reviews =
                reviewService.getNonBlockedReviewsByCustomerIdOrderByCreateDate(
                        othersId.orElse(securityUser.getUser().getId()),
                        Review.BLOCKED.NO,
                        page.orElse(0),
                        limit.orElse(10)
                );

        return ResponseEntity.of(Optional.ofNullable(reviews));
    }

    @ResponseBody
    @GetMapping("/posts")
    public ResponseEntity<Page<Projection.Post>> posts(@AuthenticationPrincipal SecurityUser securityUser,
                                                       @RequestParam("page") Optional<Integer> page,
                                                       @RequestParam("limit") Optional<Integer> limit,
                                                       @RequestParam("id") Optional<Integer> othersId) {
        Page<Projection.Post> posts =
                postService.getNonBlockedPostsByCustomerIdOrderByCreateDate(
                        othersId.orElse(securityUser.getUser().getId()),
                        Post.BLOCKED.NO,
                        page.orElse(0),
                        limit.orElse(10)
                );

        return ResponseEntity.of(Optional.ofNullable(posts));
    }

    @ResponseBody
    @GetMapping("/followings")
    public ResponseEntity<List<Projection.User>> followings(@AuthenticationPrincipal SecurityUser securityUser,
                                                            @RequestParam("page") Optional<Integer> page,
                                                            @RequestParam("limit") Optional<Integer> limit,
                                                            @RequestParam("id") Optional<Integer> othersId) {

        List<Projection.User> followers =
                socialService.getNonDisabledFollowingsByCustomerIdOrderByCreateDate(
                        othersId.orElse(securityUser.getUser().getId()),
                        User.DISABLED.NO,
                        page.orElse(0),
                        limit.orElse(10)
                );

        return ResponseEntity.of(Optional.ofNullable(followers));
    }

    @ResponseBody
    @GetMapping("/followers")
    public ResponseEntity<List<Projection.User>> followers(@AuthenticationPrincipal SecurityUser securityUser,
                                                           @RequestParam("page") Optional<Integer> page,
                                                           @RequestParam("limit") Optional<Integer> limit,
                                                           @RequestParam("id") Optional<Integer> othersId) {

        List<Projection.User> followers =
                socialService.getNonDisabledFollowersByCustomerIdOrderByCreateDate(
                        othersId.orElse(securityUser.getUser().getId()),
                        User.DISABLED.NO,
                        page.orElse(0),
                        limit.orElse(10)
                );

        return ResponseEntity.of(Optional.ofNullable(followers));
    }


    @ResponseBody
    @PostMapping(value = "/otp-check", consumes = "application/json")
    public ResponseEntity otpCheck(@RequestBody OtpCommand otpCommand, HttpSession session) {

        UserCommand userCommand = Optional.ofNullable((UserCommand) session.getAttribute("userCommand")).orElse(null);

        boolean isValid = otpService.validateOtp(otpCommand);

        if (isValid) {
            userService.insertCustomer(userCommand);
            session.setAttribute("userCommand", null);

            return ResponseEntity.ok("Valid otp!");
        } else {
            session.setAttribute("userCommand", null);
            return ResponseEntity.badRequest().body("Invalid otp!");
        }
    }

    @ResponseBody
    @GetMapping("/otp")
    public ResponseEntity otpIssue(@RequestParam("email") String email) {

        Otp otp = otpService.issueOtp(email);

        return ResponseEntity.ok().body("Otp got successfully issued");
    }

    @ResponseBody
    @PostMapping(value = "/signup", consumes = "application/json")
    public ResponseEntity signup(@RequestBody UserCommand userCommand, HttpSession session) {

        session.setAttribute("userCommand", userCommand);

        return null;
    }

    @GetMapping("/signup")
    public String signupForm(HttpSession httpSession) {

        return "user/customer/signup-form";
    }

    @GetMapping("/my-page")
    public String myPage(@AuthenticationPrincipal SecurityUser securityUser, Model model) {

        Integer customerId = securityUser.getUser().getId();

        long postsCount = postService.getPostsCountByCustomerId(customerId);
        long reviewsCount = reviewService.getReviewsCountByCustomerId(customerId);

        model.addAttribute("customer", securityUser.getUser());
        model.addAttribute("postsCount", postsCount);
        model.addAttribute("reviewsCount", reviewsCount);

        return "/user/customer/my-page";
    }

    @GetMapping("/user-details")
    public String userDetailsPage(@RequestParam("id") int userId, Model model) {

        long postsCount = postService.getPostsCountByCustomerId(userId);
        long reviewsCount = reviewService.getReviewsCountByCustomerId(userId);

        model.addAttribute("customer", userService.getUserById(userId));
        model.addAttribute("postsCount", postsCount);
        model.addAttribute("reviewsCount", reviewsCount);

        return "/user/customer/user-details";
    }

    @ResponseBody
    @GetMapping("/requests")
    public List<FollowRequestDto> followRequests(@AuthenticationPrincipal SecurityUser securityUser,
                                                 @RequestParam("option") String option,
                                                 @RequestParam("page") int page,
                                                 @RequestParam("limit") int limit) {

        Integer customerId = securityUser.getUser().getId();

        if (option.equals("pending")) {
            return socialService.getArrivedRequestsPendingByRecipientId(customerId, page, limit);
        } else if (option.equals("accepted")) {
            return socialService.getArrivedRequestsAcceptedByRecipientId(customerId, page, limit);
        } else if (option.equals("declined")) {
            return socialService.getArrivedRequestsDeniedByRecipientId(customerId, page, limit);
        } else { // ?option=sent
            return socialService.getSentRequestsBySenderId(customerId, page, limit);
        }
    }

    // authenticated
    @ResponseBody
    @PostMapping("/requests-modify")
    public String followRequestsModify(@RequestParam("requestId") int requestId, @AuthenticationPrincipal SecurityUser securityUser) {

        return socialService.updateRequestStatus(requestId, securityUser.getUser().getId());
    }

    @ResponseBody
    @GetMapping("/followers-count")
    public long followersCount(@AuthenticationPrincipal SecurityUser securityUser,
                               @RequestParam("id") Optional<Integer> othersId) {

        return socialService.getFollowersCountByCustomerId(
                othersId.orElse(securityUser.getUser().getId())
        );
    }

    @ResponseBody
    @GetMapping("/followings-count")
    public long followingsCount(@AuthenticationPrincipal SecurityUser securityUser,
                                @RequestParam("id") Optional<Integer> othersId) {

        return socialService.getFollowingsCountByCustomerId(
                othersId.orElse(securityUser.getUser().getId())
        );
    }
}
