package lab10.entities;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Book {
  private String title;
  private String author;
  private int year;
  private String publisher;
  private String language;
  private int pages;
  private long isbn10;
  private long isbn13;
  private String description;
  private String category;
}