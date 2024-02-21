package kr.donghun.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

    @GetMapping("/example")
    @CrossOrigin(origins = "http://localhost:8989")
    public ResponseEntity<String> getExampleData() {
        // API 로직을 수행하고 응답을 생성
        return ResponseEntity.ok("Example API Response");
    }
}