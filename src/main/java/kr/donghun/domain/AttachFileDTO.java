package kr.donghun.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private int fno; //pk
	private int postid; //unique
	private String post_type;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
