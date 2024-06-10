-- Table: course
CREATE TABLE IF NOT EXISTS course (
  id VARCHAR(255) NOT NULL,
  course_level_id INT NOT NULL,
  name VARCHAR(255) DEFAULT NULL,
  name_vn VARCHAR(255) NOT NULL,
  credit_theory INT DEFAULT NULL,
  credit_lab INT DEFAULT NULL,
  description TEXT NOT NULL,
  PRIMARY KEY (id)
);

-- Table: program
CREATE TABLE IF NOT EXISTS program (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) DEFAULT NULL,
  duration INT DEFAULT NULL,
  version VARCHAR(4) DEFAULT NULL,
  major_id INT DEFAULT NULL,
  program_type_id INT NOT NULL,
  valid_from VARCHAR(255) DEFAULT NULL
);

-- Table: course_program
CREATE TABLE IF NOT EXISTS course_program (
  course_id VARCHAR(255) NOT NULL,
  program_id INT NOT NULL,
  course_code VARCHAR(255) NOT NULL,
  course_type_id INT NOT NULL,
  UNIQUE (course_id, program_id),
  CONSTRAINT FK_CourseProgram_Course FOREIGN KEY (course_id) REFERENCES course (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_CourseProgram_Program FOREIGN KEY (program_id) REFERENCES program (id) ON DELETE CASCADE ON UPDATE CASCADE
);
