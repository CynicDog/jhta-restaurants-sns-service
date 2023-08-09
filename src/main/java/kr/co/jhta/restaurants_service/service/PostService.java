package kr.co.jhta.restaurants_service.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import kr.co.jhta.restaurants_service.controller.command.PostDataCommand;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.restaurants_service.form.AddPostForm;
import kr.co.jhta.restaurants_service.mapper.PostMapper;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.mapper.PostDataMapper;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.post.PostData;
import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostService {
	
	private final PostMapper postmapper;
	
	private final StoreMapper storeMapper;
	
	private final PostDataMapper postDataMapper;
	
	
	
	public List<Post> getAllPosts(){
		List<Post> posts = postmapper.getAllPosts();
		return posts;
	}
	
//	public void insertPost(String title, String content, String pictureName) {
//		Post post = new Post();
//		post.setTitle(title);
//		post.setContent(content);
//		
//		postmapper.insertPost(post);
//		
//		PostPicture postPicture = new PostPicture();
//		postPicture.setPictureName(pictureName);
//		postPicture.setPost(post);
//		
//		postPictureMapper.insertPostPicture(postPicture);
//	}
	
//	public void insertPosts(PostData postData) {
//	    List<Post> posts = new ArrayList<>();
//	    List<PostPicture> postPictures = new ArrayList<>();
//	    
//	    for (int i=0; i < posts.size() ; i++) {
//	        Post post = new Post();
//	        post.setStore(posts.get(i).getStore());
//	        post.setContent(posts.get(i).getContent());
//	        posts.add(post);
//
//	        PostPicture postPicture = new PostPicture();
//	        postPicture.setPictureName(posts.get(i).getPictureName());
//	        postPicture.setPost(post);
//	        postPictures.add(postPicture);
//	    }
//	    
//	    postmapper.insertPost(posts);
//	    postPictureMapper.insertPostPicture(postPictures);
//	}
	
	
    public void insertPost(Post post, List<PostDataCommand> postDataCommands) throws IOException {
		
		postmapper.insertPost(post);

		// TODO: each PostDataCommand converted to PostData then save it.
//		postData.stream()
//				.map(postDatum -> {
//					postDatum.setPost(post);
//					return postDatum;
//				}).map(postDatum -> {
//
//					Store store = storeMapper.getStoreById(postDatum.getStore().getId());
//					postDatum.setStore(store);
//				})

//		for (int i = 0; i < postData.size(); i++) {
//
//			postData.setPost(post);
//			postData.setContent(contents.get(i));
//
////			Store store = storeMapper.getStoreById(stores.get(i).getId());
////			postData.setStore(store);
//
//			Store store = storeMapper.getStoreById(storeid.get(i));
//			if (store != null) {
//			    postData.setStore(store);
//			} else {
//			    throw new RuntimeException("Store not found");
//			}
//
//			postData.setPictureFile(saveFile(chooseFiles.get(i)));
//
//			postDataMapper.insertPostData(postData);
//		}
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
	
}
