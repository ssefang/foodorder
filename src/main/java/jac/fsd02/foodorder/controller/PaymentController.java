package jac.fsd02.foodorder.controller;

import jac.fsd02.foodorder.exception.RecordNotFoundException;
import jac.fsd02.foodorder.model.Payment;
import jac.fsd02.foodorder.service.OrderService;
import jac.fsd02.foodorder.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller

public class PaymentController {
    @Autowired
    PaymentService paymentService;
    @Autowired
    OrderService orderService;

    public PaymentController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }



    @PostMapping("/savePayment")
    public String savePayment
            (@Valid @ModelAttribute("payment") Payment paymentToSave, BindingResult result) {
        //This annotated method will allow access to the Student object in your View, since it gets automatically added to the Models by Spring.
        //
        //See "Using @ModelAttribute".

        //if I have validation issues
        if (result.hasErrors()) {
            //I need to stay in the current page !!!!
            return "payment";
        }

        Payment payment = paymentService.savePayment(paymentToSave);
        try{
            orderService.updatePaymentInfo(payment.getOrderId(), payment.getId());
        } catch (RecordNotFoundException e) {
            return "500";
        }


        return "paymentCompleted";
    }
}
