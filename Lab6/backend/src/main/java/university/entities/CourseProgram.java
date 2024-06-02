package university.entities;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "course_program")
@IdClass(CourseProgramId.class)
public class CourseProgram {
    @Id
    @Column(name = "course_id", nullable = false, length = 255)
    private String courseId;

    @Id
    @Column(name = "program_id", nullable = false)
    private Integer programId;

    @Column(name = "course_code", nullable = false, length = 255)
    private String courseCode;

    @Column(name = "course_type_id", nullable = false)
    private Integer courseTypeId;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @MapsId("courseId")
    @JoinColumn(name = "course_id", referencedColumnName = "id")
    @Setter(AccessLevel.NONE)
    @Getter(AccessLevel.NONE)
    private Course course;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @MapsId("programId")
    @JoinColumn(name = "program_id", referencedColumnName = "id")
    @Setter(AccessLevel.NONE)
    @Getter(AccessLevel.NONE)
    private Program program;
}
