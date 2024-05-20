CREATE TABLE IF NOT EXISTS `course` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_level_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name_vn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit_theory` int DEFAULT NULL,
  `credit_lab` int DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Course_CourseLevel` (`course_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `program` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `version` varchar(4) DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  `program_type_id` int NOT NULL,
  `valid_from` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `course_program` (
  `course_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `program_id` int NOT NULL,
  `course_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_type_id` int NOT NULL,
  UNIQUE KEY `Key` (`course_id`,`program_id`),
  KEY `FK_CourseProgram_CourseType` (`course_type_id`),
  KEY `FK_CourseProgram_Program` (`program_id`),
  CONSTRAINT `FK_CourseProgram_Course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CourseProgram_Program` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;