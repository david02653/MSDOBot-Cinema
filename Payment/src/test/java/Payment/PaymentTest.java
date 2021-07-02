package Payment;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
public class PaymentTest {

    @Test
    public void testDatabase()
    {
        //測試是否成功連線到DB
        //if(GroceryInventory.getGrocery(userID))System.out.println("答對了！");
        //else	System.out.println("正確答案應該是5");
    }

    @Autowired
    PaymentController paymentController;

    @Test
    public void testIndex()
    {
        assertEquals( paymentController.index(), "success");
        //assertEquals(paymentController.index(), "fail");
    }

    @Test
    public void testPayment()
    {
        assertEquals( paymentController.payment("1","250"), "success");
    }

}
