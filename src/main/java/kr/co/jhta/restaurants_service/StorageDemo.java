package kr.co.jhta.restaurants_service;

import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@RestController
@RequestMapping("/gcp")
public class StorageDemo {

    @Autowired
    private Storage storage;

    @GetMapping("/send-data")
    public String sendData() throws IOException {

        // TODO: 1. Abstraction to service layer
        // TODO: 2. HTML - Controller refactoring
        // TODO: 3. HTML event
        BlobId id = BlobId.of("jhta-restaurant-service", "REPACE_WITH_FILE_NAME");
        BlobInfo blobInfo = BlobInfo.newBuilder(id).build();
        File file = new File("REPACE_WITH_FILE_LOCATION");

        byte[] bytes = Files.readAllBytes(Paths.get(file.toURI()));

        storage.create(blobInfo, bytes);

        return "Success";
    }
}

