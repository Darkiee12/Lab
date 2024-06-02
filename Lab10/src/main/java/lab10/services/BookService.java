package lab10.services;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.List;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Unmarshaller;
import org.springframework.core.io.Resource;
import lab10.entities.Book;
import lab10.entities.Library;

@Service
public class BookService {

  public List<Book> getAllBooks() {
    try {
      Resource resource = new ClassPathResource("book.xml");
      InputStream inputStream = resource.getInputStream();

      JAXBContext jaxbContext = JAXBContext.newInstance(Library.class);
      Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
      Library library = (Library) jaxbUnmarshaller.unmarshal(inputStream);

      return library.getBooks();
    } catch (JAXBException | IOException e) {
      e.printStackTrace();
    }
    return Collections.emptyList();
  }
}
