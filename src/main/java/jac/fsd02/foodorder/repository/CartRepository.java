package jac.fsd02.foodorder.repository;

import jac.fsd02.foodorder.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CartRepository extends JpaRepository<Cart,Long> {

    List<Cart> findCartsByUserId(Long userId);

    Optional<Cart> findByUserIdAndItemId(Long userId, Long itemId);

    void deleteById(Long cartId);

    void deleteByUserId(Long usrId);

}
