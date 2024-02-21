package kr.donghun.domain;

import java.util.Date;

import lombok.Data;
@Data
public class LikesVO {
    private int likeid;
    private int postid;
    private String email;
    private Date likedate; // Default: SYSDATE
    private String post_type; // Default: null (Nullable)

    // 생성자, getter, setter 등 필요한 메서드를 추가할 수 있습니다.
}