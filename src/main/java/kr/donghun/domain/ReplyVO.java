package kr.donghun.domain;

import java.util.Date;

import lombok.Data;

@Data

public class ReplyVO {
    private int replyid;
    private int postid;
    private String email;
    private String replytext;
    private Date createdate; // Default: SYSDATE
    private Date updatedate; // Default: SYSDATE
    private Integer likecount; // Default: 0, Nullable
    private String post_type;
    // 생성자, getter, setter 등 필요한 메서드를 추가할 수 있습니다.
    
    // 대댓글 재건축
    private int depth;// 프런트에서 한칸 들여쓰기위함
    private int rereplyid;// 대댓글이 몇번째의 댓글에 다는지 표기하기 위함
    private String isdelete;
}
