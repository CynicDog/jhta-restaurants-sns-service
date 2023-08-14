package kr.co.jhta.restaurants_service.controller.command;

import lombok.Getter;
import lombok.ToString;

import org.springframework.web.multipart.MultipartFile;

@Getter
@ToString
public class PostDataCommand {

    MultipartFile chooseFile;
    int storeId;
    String content;
    int dataId; 

    public PostDataCommand(MultipartFile chooseFile, int storeId, String content) {
        this.chooseFile = chooseFile;
        this.storeId = storeId;
        this.content = content;
    }
}
