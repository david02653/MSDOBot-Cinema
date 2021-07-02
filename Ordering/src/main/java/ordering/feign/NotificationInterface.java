package ordering.feign;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(name = "notification")
public interface NotificationInterface {

	@RequestMapping(value = "/newNotification", method = RequestMethod.GET)
    String newNotification(@RequestParam("userID") String userID, @RequestParam("content") String content);

}
