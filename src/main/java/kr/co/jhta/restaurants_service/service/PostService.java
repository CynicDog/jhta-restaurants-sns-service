package kr.co.jhta.restaurants_service.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import kr.co.jhta.restaurants_service.controller.command.PostDataCommand;

import kr.co.jhta.restaurants_service.dto.PostDto;
import kr.co.jhta.restaurants_service.projection.Projection;
import kr.co.jhta.restaurants_service.repository.PostRepository;
import org.jboss.logging.Logger;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;

import kr.co.jhta.restaurants_service.mapper.PostMapper;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.mapper.PostCommentMapper;
import kr.co.jhta.restaurants_service.mapper.PostDataMapper;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.post.PostComment;
import kr.co.jhta.restaurants_service.vo.post.PostData;
import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostService {

	private final Logger logger = Logger.getLogger(PostService.class);

	private final PostMapper postmapper;
	private final StoreMapper storeMapper;
	private final PostDataMapper postDataMapper;
	private final PostCommentMapper postCommentMapper;
	private final PostRepository postRepository;
	private final Storage storage;

	public List<Post> getAllPosts(){
		List<Post> posts = postmapper.getAllPosts();
		return posts;
	}

	public void insertPost(Post post, List<PostDataCommand> postDataCommands) throws IOException {

		postmapper.insertPost(post);
		
		BlobId id = BlobId.of("jhta-restaurant-service", "REPACE_WITH_FILE_NAME");
        BlobInfo blobInfo = BlobInfo.newBuilder(id).build();

		postDataCommands.stream()
				.map(postDataCommand -> {
					Store store = storeMapper.getStoreById(postDataCommand.getStoreId());
					
					File file = new File("REPACE_WITH_FILE_LOCATION");

			        byte[] bytes;
					try {
						bytes = Files.readAllBytes(Paths.get(file.toURI()));
						storage.create(blobInfo, bytes);
					} catch (IOException e) {
						e.printStackTrace();
					}

					return new PostData(post, store, postDataCommand.getContent(), postDataCommand.getChooseFile().getOriginalFilename());
				})
				.forEach(postData -> {
					postDataMapper.insertPostData(postData);
				});
    }

	public PostDto selectPost(int postId) {
		PostDto dto = new PostDto();

		Post post = postmapper.getPostById(postId);
		List<PostData> postDatas = postDataMapper.getPostDataByPostId(postId);
		List<PostComment> postComments = postCommentMapper.getCommentsByPostId(postId);

		dto.setPost(post);
		dto.setPostData(postDatas);
		dto.setPostComments(postComments);

		return dto;
	}

	public void updatePost(String title, String content, String pictureName) {

	}

	private String saveFile(MultipartFile multipartFile) throws IOException {
		String filename = null;
		String projectHome = System.getenv("PROJECT_HOME");
		String directory = projectHome + "/src/main/webapp/resources/image";
//		String directory = "C:\\Users\\GOTAEHWA\\Desktop\\중앙HTA\\파이널\\picture";
//		if (!multipartFile.isEmpty()) {
//			filename = multipartFile.getOriginalFilename();
//			FileOutputStream out = new FileOutputStream(new File(directory, filename));
//			FileCopyUtils.copy(multipartFile.getInputStream(), out);
//
//		}

		if (!multipartFile.isEmpty()) {
			try {
				filename = multipartFile.getOriginalFilename();
				FileOutputStream out = new FileOutputStream(new File(directory, filename));
				FileCopyUtils.copy(multipartFile.getInputStream(), out);
				out.close();
			} catch (IOException e) {
				// 파일 생성 또는 복사 작업에서 예외 처리
				throw new IOException("Failed to save file: " + filename, e);
			}
		}

		return filename;
	}

	public List<Post> getPostsByCustomerId(int id) {
		return postRepository.findPostsByCustomerId(id);
	}

    public Page<Projection.Post> getNonBlockedPostsByCustomerIdOrderByCreateDate(int id, Post.BLOCKED no, Integer page, Integer limit) {

		Page<Projection.Post> postsPaginated = postRepository.findPostsByCustomerIdAndBlockedOrderByCreateDate(id, no, PageRequest.of(page, limit));

		return postsPaginated;
    }
}
