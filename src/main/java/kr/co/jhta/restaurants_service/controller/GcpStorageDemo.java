package kr.co.jhta.restaurants_service.controller;

import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.Storage;
import kr.co.jhta.restaurants_service.service.PostService;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.post.PostData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/images")
public class GcpStorageDemo {

    @Value("${gcp.bucket.name}")
    private String bucketName;

    @Autowired
    Storage storage;

    @Autowired
    PostService postService;

    @GetMapping("/png/{imageName}")
    @ResponseBody
    public ResponseEntity<byte[]> servePngImage(@PathVariable String imageName) throws IOException {

        BlobId blobId = BlobId.of(bucketName,"post/" + imageName);

        Blob blob = storage.get(blobId);

        if (blob != null) {
            byte[] imageBytes = blob.getContent();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_PNG);

            return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
        }
        else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/jpeg/{imageName}")
    @ResponseBody
    public ResponseEntity<byte[]> serveJpegImage(@PathVariable String imageName) throws IOException {

        BlobId blobId = BlobId.of(bucketName,"post/" + imageName);

        Blob blob = storage.get(blobId);

        if (blob != null) {
            byte[] imageBytes = blob.getContent();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_JPEG);

            return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
        }
        else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/demo")
    public String demo() {

        return "demo";
    }
}
