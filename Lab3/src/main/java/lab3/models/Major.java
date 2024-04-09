package lab3.models;
import java.util.ArrayList;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class Major {
  private String description;
  private String code;
  private List<Course> courses;

  public List<String> getCourseList(){
    List<String> courseList = new ArrayList<>();
    for (int i = 0; i < courses.size(); i++) {
      courseList.add(courses.get(i).getName());
    }
    return courseList;
  }

  public Course getCourse(String course){
    for (int i = 0; i < courses.size(); i++) {
      if (courses.get(i).getName().equals(course)) {
        return courses.get(i);
      }
    }
    return null;
  }

  public Course getCourseFromCode(String code){
    for (int i = 0; i < courses.size(); i++) {
      if (courses.get(i).getCode().equals(code)) {
        return courses.get(i);
      }
    }
    return null;
  }
}