package university.entities;
import java.io.Serializable;
import jakarta.persistence.Column;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CourseProgramId implements Serializable {
    @Column(name = "course_id", nullable = false, length = 255)
    private String courseId;

    @Column(name = "program_id", nullable = false)
    private Integer programId;
}
