package data.dao;

import data.pojo.Book;
import data.pojo.User;
import java.util.List;

public interface UserMapper {
    int insertUser(User user);

    List<User> selectAllUsers();

    User selectUserByEmail(String email);

    List<Book> selectSellBooks(String email);

    List<Book> selectBuyBooks(String email);

    List<Book> selectNeedBooks(String email);

    int insertSell(String providerEmail, int bookID);

    int insertBuy(String consumerEmail, int bookID);
}