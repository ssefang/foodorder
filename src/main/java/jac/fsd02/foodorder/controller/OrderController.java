package jac.fsd02.foodorder.controller;

import jac.fsd02.foodorder.model.CartListForm;
import jac.fsd02.foodorder.model.Order;
import jac.fsd02.foodorder.model.Payment;
import jac.fsd02.foodorder.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @PostMapping("/checkout")
    public String createOrder(@ModelAttribute("cartListForm") CartListForm cartListForm, Model model){

        System.out.println(cartListForm.toString());
        Order order = orderService.createOrder(cartListForm);

        Payment payment = new Payment();
        payment.setOrderId(order.getId());

        model.addAttribute("payment", payment);
        model.addAttribute("orderTotalPrice", cartListForm.getOrderTotalPrice());
        return "payment";
    }

}
