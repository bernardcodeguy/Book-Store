/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Blob;

/**
 *
 * @author Bern Ard
 */
public class Book {
    private int book_id;
    private String title;
    private String author;
    private String publisher;
    private String published_year;
    private double price;
    private String genre;
    private String book_desc;
    private String arrival_date;
    private Blob img;

    public String getArrival_date() {
        return arrival_date;
    }

    public void setArrival_date(String arrival_date) {
        this.arrival_date = arrival_date;
    }

    public Blob getImg() {
        return img;
    }

    public void setImg(Blob img) {
        this.img = img;
    }
    
    
    

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getPublished_year() {
        return published_year;
    }

    public void setPublished_year(String published_year) {
        this.published_year = published_year;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getBook_desc() {
        return book_desc;
    }

    public void setBook_desc(String book_desc) {
        this.book_desc = book_desc;
    }

    @Override
    public String toString() {
        return "Book{" + "book_id=" + book_id + ", title=" + title + ", author=" + author + ", publisher=" + publisher + ", published_year=" + published_year + ", price=" + price + ", genre=" + genre + ", book_desc=" + book_desc + '}';
    }
    
    
   
}
