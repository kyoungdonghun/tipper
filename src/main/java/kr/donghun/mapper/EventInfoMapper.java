package kr.donghun.mapper;

import java.util.List;

import kr.donghun.domain.EventInfoVO;

public interface EventInfoMapper {
	public void saveEventInfo(EventInfoVO eventInfo);
	public int countEventsByTitle(String title);
	public List<EventInfoVO> readEventInfo();
	public EventInfoVO read(int id);
}
