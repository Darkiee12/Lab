package lab3.models;
import java.util.Map;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Programme {
  private Map<String, Major> majors;

  public String[] getMajors(){
    return majors.keySet().toArray(new String[0]);
  }

  public Major getMajor(String major){
    return majors.get(major);
  }

  public Major getMajorFromCode(String code){
    for (Major major : majors.values()) {
      if (major.getCode().equals(code)) {
        return major;
      }
    }
    return null;
  }
}
