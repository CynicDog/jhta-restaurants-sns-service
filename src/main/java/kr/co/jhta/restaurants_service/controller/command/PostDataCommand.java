package kr.co.jhta.restaurants_service.controller.command;

import lombok.Getter;
import org.springframework.web.multipart.MultipartFile;

@Getter
public class PostDataCommand {

    MultipartFile chooseFile;
    int storeId;
    String content;

    public PostDataCommand(MultipartFile chooseFile, int storeId, String content) {
        this.chooseFile = chooseFile;
        this.storeId = storeId;
        this.content = content;
    }
}
