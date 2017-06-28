package com.example.store.service;

import com.example.store.factory.BookFactory;
import com.example.store.entity.Book;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private BookFactory bookFactory;

    public void setBookFactory(BookFactory bookFactory) {
        this.bookFactory = bookFactory;
    }

    @Override
    @Transactional
    public void addBook(Book book) {
        this.bookFactory.addBook(book);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        this.bookFactory.updateBook(book);
    }

    @Override
    @Transactional
    public void removeBook(int id) {
        this.bookFactory.removeBook(id);
    }

    @Override
    @Transactional
    public Book getBookById(int id) {
        return this.bookFactory.getBookById(id);
    }

    @Override
    @Transactional
    public List<Book> listBooks() {
        return this.bookFactory.listBooks();
    }
}
