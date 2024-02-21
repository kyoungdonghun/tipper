package kr.donghun.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.donghun.domain.EventInfoVO;
import kr.donghun.mapper.EventInfoMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class LostArkServiceImpl implements LostArkService {
	
	@Setter(onMethod_= @Autowired)
	private EventInfoMapper eventInfoMapper;
	
	private  String LostarkApiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyIsImtpZCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyJ9.eyJpc3MiOiJodHRwczovL2x1ZHkuZ2FtZS5vbnN0b3ZlLmNvbSIsImF1ZCI6Imh0dHBzOi8vbHVkeS5nYW1lLm9uc3RvdmUuY29tL3Jlc291cmNlcyIsImNsaWVudF9pZCI6IjEwMDAwMDAwMDA0NTcyMTIifQ.dlxyeU7IrsW_opQ9VzhphLtE6JIvG9yoF-8Fa21Zjkzl--L7uE7FP1SYZhNaT8EbPl8Ye8aoRZL8XbIUPHbRz35LQqFGFTFlFSMHKES0Bq42eW9VhJ_Kfxiq-nq9UKGSJhr-bxI-59K_zDsLLdqP3J-LQZF0MsGU256Tjz-2wlFMpsBmcSLdPBsGVqHveK2OKUR4jklSFtThPIWgG3cS18Ccy5ULCgvfCqst89t81nzSsxoQPPwEpHn4nm7wh8VYAObkaNyhtHbM_8XIYrr8seg8AzaDa23wO-Aeborotj2Yk7iCxMrpt9zSNLZ4x8SHcqketoC-gnN8nGv3W3mZPw.eyJpc3MiOiJodHRwczovL2x1ZHkuZ2FtZS5vbnN0b3ZlLmNvbSIsImF1ZCI6Imh0dHBzOi8vbHVkeS5nYW1lLm9uc3RvdmUuY29tL3Jlc291cmNlcyIsImNsaWVudF9pZCI6IjEwMDAwMDAwMDA0NTcyMTIifQ.dlxyeU7IrsW_opQ9VzhphLtE6JIvG9yoF-8Fa21Zjkzl--L7uE7FP1SYZhNaT8EbPl8Ye8aoRZL8XbIUPHbRz35LQqFGFTFlFSMHKES0Bq42eW9VhJ_Kfxiq-nq9UKGSJhr-bxI-59K_zDsLLdqP3J-LQZF0MsGU256Tjz-2wlFMpsBmcSLdPBsGVqHveK2OKUR4jklSFtThPIWgG3cS18Ccy5ULCgvfCqst89t81nzSsxoQPPwEpHn4nm7wh8VYAObkaNyhtHbM_8XIYrr8seg8AzaDa23wO-Aeborotj2Yk7iCxMrpt9zSNLZ4x8SHcqketoC-gnN8nGv3W3mZPw";
	
	@Override
	public boolean isEventExist(EventInfoVO eventInfo) {
	    String title = eventInfo.getTitle();

	    int count = eventInfoMapper.countEventsByTitle(title);

	    return count > 0;
	}

	@Override
	@Scheduled(cron = "0 0 10 * * WED")
	//쿼츠 
	public List<EventInfoVO> eventList() {
		log.info("이벤트 게시물 업데이트 메서드가 실행되었으며, 스케줄러 혹은 직접 호출이 있었음.");
	    List<EventInfoVO> tmp = new ArrayList<>();

	    try {
	        // API에서 데이터 가져오기
            URL url = new URL("https://developer-lostark.game.onstove.com/news/events");
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestMethod("GET");
            httpURLConnection.setRequestProperty("authorization", "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyIsImtpZCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyJ9.eyJpc3MiOiJodHRwczovL2x1ZHkuZ2FtZS5vbnN0b3ZlLmNvbSIsImF1ZCI6Imh0dHBzOi8vbHVkeS5nYW1lLm9uc3RvdmUuY29tL3Jlc291cmNlcyIsImNsaWVudF9pZCI6IjEwMDAwMDAwMDA0NTcyMTIifQ.dlxyeU7IrsW_opQ9VzhphLtE6JIvG9yoF-8Fa21Zjkzl--L7uE7FP1SYZhNaT8EbPl8Ye8aoRZL8XbIUPHbRz35LQqFGFTFlFSMHKES0Bq42eW9VhJ_Kfxiq-nq9UKGSJhr-bxI-59K_zDsLLdqP3J-LQZF0MsGU256Tjz-2wlFMpsBmcSLdPBsGVqHveK2OKUR4jklSFtThPIWgG3cS18Ccy5ULCgvfCqst89t81nzSsxoQPPwEpHn4nm7wh8VYAObkaNyhtHbM_8XIYrr8seg8AzaDa23wO-Aeborotj2Yk7iCxMrpt9zSNLZ4x8SHcqketoC-gnN8nGv3W3mZPw");  // API 토큰 설정 등
            // 응답 코드 확인
            int responseCode = httpURLConnection.getResponseCode();

	        // 응답 데이터 읽기
	        if (responseCode == HttpURLConnection.HTTP_OK) {
	            InputStream inputStream = httpURLConnection.getInputStream();
	            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));

	            StringBuilder response = new StringBuilder();
	            String line;

	            while ((line = reader.readLine()) != null) {
	                response.append(line);
	            }
	            reader.close();

	            // Jackson ObjectMapper를 사용하여 JSON 응답 파싱
	            ObjectMapper objectMapper = new ObjectMapper();
	            EventInfoVO[] tmpList = objectMapper.readValue(response.toString(), EventInfoVO[].class);
	            // 배열을 목록으로 변환
	            tmp = Arrays.asList(tmpList);

	            for (EventInfoVO eventInfo : tmp) {
	                if (!isEventExist(eventInfo)) {
	                    eventInfoMapper.saveEventInfo(eventInfo);
	                    System.out.println("---------------------------");
	                    System.out.println("Title: " + eventInfo.getTitle());
	                    System.out.println("Thumbnail: " + eventInfo.getThumbnail());
	                    System.out.println("Link: " + eventInfo.getLink());
	                    System.out.println("StartDate: " + eventInfo.getStartDate());
	                    System.out.println("EndDate: " + eventInfo.getEndDate());
	                    System.out.println("RewardDate: " + eventInfo.getRewardDate());
	                    System.out.println("---------------------------");
	                } else {
	                    System.out.println("이벤트가 이미 존재합니다: " + eventInfo.getTitle());
	                }
	            }
	        } else {
	            log.error("HTTP request failed with response code: " + responseCode);
	        }
	        httpURLConnection.disconnect();
	    } catch (IOException e) {
	        log.error("이벤트 정보 추출 중 예외 발생: " + e.getMessage());
	    }
	    return tmp;
	}

	@Override
	public List<EventInfoVO> getEventList() {
		log.info("==== 이벤트 정보도 들고 오기 ====");
		return eventInfoMapper.readEventInfo(); 
	}

	@Override
	public EventInfoVO get(int id) {
		log.info("==== id에 해당하는 이벤트 글 보여주기 ====");
		return eventInfoMapper.read(id);
	}
	
}
