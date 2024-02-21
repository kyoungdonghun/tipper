package kr.donghun.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.donghun.domain.EventInfoVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LostArkServiceTest {

	@Setter(onMethod_ = @Autowired)
    private LostArkService lostArkService;

    @Test
    public void testShowInfo() {
    	  // 테스트 메서드에서 eventList 메서드 호출
        List<EventInfoVO> result = lostArkService.eventList();

        // 결과가 null이 아닌지 확인
        Assert.assertNotNull(result);

        // 결과의 사이즈가 0보다 큰지 확인 (데이터가 있어야 함)
        Assert.assertTrue(result.size() > 0);

        // 결과의 첫 번째 항목을 출력하여 확인
        EventInfoVO firstEvent = result.get(0);
        log.info("First Event Title: " + firstEvent.getTitle());
        log.info("First Event Thumbnail: " + firstEvent.getThumbnail());

        // 기타 원하는 검증 로직 추가 가능
    }
}

