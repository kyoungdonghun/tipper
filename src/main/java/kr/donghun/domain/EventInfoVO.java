package kr.donghun.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class EventInfoVO {
	private int id;
	private int viewcount;
	private int replycount;
	private String post_type;
	
    @JsonProperty("Title")
    private String title;

    @JsonProperty("Thumbnail")
    private String thumbnail;

    @JsonProperty("Link")
    private String link;

    @JsonProperty("StartDate")
    private Date startDate;

    @JsonProperty("EndDate")
    private Date endDate;

    @JsonProperty("RewardDate")
    private Date rewardDate;

}

