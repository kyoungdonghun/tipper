package kr.donghun.domain;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ComunityVO {
    private int comunitynumber;
    private String title;
    private String writer;
    private String comunitytext;
    private Date createdate; // Default: SYSDATE
    private Date updatedate; // Default: SYSDATE
    private MultipartFile comunityfile; // 파일 업로드를 위한 필드 추가
    private int viewcount; // Default: 0
    private Integer likecount; // Default: 0, Nullable
    private String post_type; // Default: 'COMUNITY' (Nullable)
    private int replycount;
    
    private List<AttachFileDTO> attachList;

    // 생성자, getter, setter 등 필요한 메서드를 추가할 수 있습니다.
}