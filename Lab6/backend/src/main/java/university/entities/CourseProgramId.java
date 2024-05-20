package university.entities;
import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.IdClass;
import lombok.Data;

@Data
@Embeddable
@IdClass(CourseProgramId.class)
public class CourseProgramId implements Serializable {
    @Column(name = "course_id", nullable = false, length = 255)
    private String courseId;

    @Column(name = "program_id", nullable = false)
    private Integer programId;
}
