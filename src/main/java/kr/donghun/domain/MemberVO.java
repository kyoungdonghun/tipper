package kr.donghun.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class MemberVO {
    private String email;
    private String name;
    private String password;
    private String agegroup; // Default: '미공개'
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth; // Default: null (No specific default provided)
    
    private String phonenumber;
    
    private List<AuthDTO> authList;
    // 생성자, getter, setter 등 필요한 메서드를 추가할 수 있습니다.
}
