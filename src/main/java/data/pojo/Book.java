package data.pojo;

import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter @JacksonStdImpl
public class Book {
    int bookID;
    String name;
    String ISBN;
    float originalprice;
    float price;
    String category;
    String imageURL;
    String details;
    short state;
}