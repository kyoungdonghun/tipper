package kr.donghun.service;

import java.util.List;

import kr.donghun.domain.EventInfoVO;

public interface LostArkService {
	
	public List<EventInfoVO> eventList();

	boolean isEventExist(EventInfoVO eventInfo);
	
	public List<EventInfoVO> getEventList();
	
	public EventInfoVO get(int id);
}
