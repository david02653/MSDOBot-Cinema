package Payment;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;


@Api(value = "PaymentController", tags = "與付錢相關的所有一切都在這裡")
@RestController
public class PaymentController {
	
	
	@ApiOperation(value = "測試此伺服器是否成功連線", notes = "成功連線就回傳success")
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() 
    {
		return "success";
    }
	
	@ApiOperation(value = "購買物品", notes = "成功購買就回傳success")
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "payment", method = RequestMethod.GET)
    public String payment(@ApiParam(required = true, name = "userID", value = "使用者ID")@RequestParam("userID") String userID, @ApiParam(required = true, name = "price", value = "付款金額")@RequestParam("price") String price)
    {
    	return "success";
    }
	
	
}



