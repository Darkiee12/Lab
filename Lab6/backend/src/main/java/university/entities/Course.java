package university.entities;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import java.util.List;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;


@Entity
@Getter
@Setter
@Table(name = "course")
public class Course {
  @Id 
  @NotBlank
  @Size(min = 0, max = 255)
  @Column(name = "id", unique = true, nullable = false, length = 255)
  private String id;

  @NotBlank
  @Size(min = 0, max = 255)
  @Column(name = "name", nullable = false, length = 255)
  private String name;

  @NotBlank
  @Size(min = 0, max = 255)
  @Column(name = "name_vn", nullable = false, length = 255)
  private String nameVn;

  @Column(name = "course_level_id", nullable = false)
  private Integer courseLevelId;

  @NotBlank
  @Size(min = 0, max = 4)
  @Column(name = "credit_theory", nullable = false)
  private Integer creditTheory;

  @NotBlank
  @Size(min = 0, max = 4)
  @Column(name = "credit_lab", nullable = false)
  private Integer creditLab;

  @Column(name = "description", nullable = false, columnDefinition = "TEXT")
  private String description;

  @Setter(AccessLevel.NONE)
  @Getter(AccessLevel.NONE)
  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "course_id", referencedColumnName = "id")
  private List<CourseProgram> coursePrograms;
}
