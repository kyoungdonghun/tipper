package kr.donghun.domain;

import lombok.Data;

@Data
public class LostArkCharacter {
	
	private String serverName;
    private String characterName;
    private int characterLevel;
    private String characterClassName;
    private String itemAvgLevel;
    private String itemMaxLevel;
}
