package com.example.store.factory;

import com.example.store.entity.Book;

import java.util.List;

public interface BookFactory {
     void addBook(Book book);

     void updateBook(Book book);

    void removeBook(int id);

     Book getBookById(int id);

     List<Book> listBooks();
}
