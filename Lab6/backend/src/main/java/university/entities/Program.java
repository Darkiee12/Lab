package university.entities;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "program")
public class Program {
  @Id
  @Column(name = "id", unique = true, nullable = false)
  private Integer id;

  @Column(name = "name", nullable = false, length = 255)
  private String name;

  @Column(name = "duration", nullable = false)
  private Integer duration;

  @Column(name = "major_id", nullable = true)
  private Integer majorId;

  @Column(name = "program_type_id", nullable = false)
  private Integer programTypeId;

  @Column(name = "valid_from", nullable = true, length = 255)
  private String validFrom;

  @Column(name = "version", nullable = false, length = 4)
  private String version;

  @Setter(AccessLevel.NONE)
  @Getter(AccessLevel.NONE)
  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "program_id", referencedColumnName = "id")
  private List<CourseProgram> coursePrograms;
}
