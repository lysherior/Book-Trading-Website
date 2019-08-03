package data.dao;

import data.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    int insertBook(Book book);

    List<Book> selectAllBooks();

    List<Book> selectBooksByKey(String key);

    void purchaseBook(int bookID);
}