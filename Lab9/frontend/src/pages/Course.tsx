import { useEffect, useState } from "react";
import Course from "../models/Course";
import CourseProgram from "../models/CourseProgram";
import Program from "../models/Program";
import CourseService from "../service/CourseService";
import ProgramService from "../service/ProgramService";
import CourseProgramService from "../service/CourseProgramService";

const CoursePage: React.FC = () => {
  const [courses, setCourses] = useState<Course[]>([]);
  const [isAdvanceToggled, setisAdvanceToggled] = useState(false);
  const [error, setError] = useState<boolean>(false);
  const [page, setPage] = useState<number>(1);

  useEffect(() => {
    const handleKeyDown = (event: any) => {
      if (event.key === "Tab") {
        setisAdvanceToggled((prevState) => !prevState);
      }
    };
    document.addEventListener("keydown", handleKeyDown);
    return () => {
      document.removeEventListener("keydown", handleKeyDown);
    };
  }, []);

  useEffect(() => {
    CourseService.get()
      .then((c) => {
        setCourses(c);
      })
      .catch((err) => {
        console.error(err);
        setError(true);
      });
  }, []);
  const loadMoreCourse = () => {
    setPage(page + 1)
    CourseService
      .get(page, 20)
      .then((c) => {
        setCourses([...courses, ...c]);
      })
      .catch((err) => {
        console.error(err);
        setError(true);
      });
  }
  const LoadMoreCourseComponent: React.FC = () => {
    return(
      <button
          className="w-full bg-blue-500 text-white font-bold p-2 rounded-md shadow-md hover:bg-blue-600 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-white"
          onClick={() => loadMoreCourse()}
        >
          Load more courses!
        </button>
    )
  }
  const CourseElement: React.FC<{ course: Course }> = ({ course }) => {
    const [translate, setTranslate] = useState<boolean>(false);
    return (
      <div className="basis-[49%] mb-3">
        <p className="font-bold">
          {translate ? course.nameVn : course.name}
          <button
            className="text-sm pl-2 material-symbols-outlined"
            style={{ color: translate ? "#3b82f6" : "#808080" }}
            onClick={() => setTranslate(!translate)}
          >
            translate
          </button>
        </p>
        <div className="flex justify-between">
          <div className="w-1/4">
            <p>ID</p>
            <p>{course.id}</p>
          </div>
          <div className="w-1/4">
            <p>Level</p>
            <p>{course.courseLevelId}</p>
          </div>
          <div className="w-1/4">
            <div className="material-symbols-outlined">menu_book</div>
            <div>{course.creditTheory}</div>
          </div>
          <div className="w-1/4">
            <div className="material-symbols-outlined">computer</div>
            <div>{course.creditTheory}</div>
          </div>
        </div>
        {course.description.length > 0 ? (
          <div
            className={
              isAdvanceToggled
                ? "text-left line-clamp-none"
                : "text-left line-clamp-3"
            }
          >
            {course.description}
          </div>
        ) : (
          <div className="italic">No description for this course :(</div>
        )}
        {isAdvanceToggled ? (
          <div className="w-full flex justify-around">
            <EditCourseButton course={course} />
            <DeleteCourseButton course={course} />
          </div>
        ) : (
          <></>
        )}
      </div>
    );
  };
  return (
    <>
      <h1 className="w-full text-2xl font-bold text-center">Courses</h1>
      <p className="text-sm italic text-center mb-5">
        Press tab to toggle between simple and advanced mode for each course.
      </p>
      {!error ? (
        <div className="w-full flex flex-wrap gap-5 justify-center">
          {courses.map((course) => (
            <CourseElement key={course.id} course={course} />
          ))}
          <div className="w-full">
            <LoadMoreCourseComponent />
          </div>
          <div className="w-full">
            <AddCourseButton />
          </div>
        </div>
      ) : (
        <div className="w-full h-[80vh] flex justify-center items-center">
          Something wrong happens! Cannot retrieve courses from the database!
        </div>
      )}
    </>
  );
};
const EditCourseButton: React.FC<{ course: Course }> = ({ course }) => {
  const [newCourse, setNewCourse] = useState<Course>(course);
  const [showModal, setShowModal] = useState(false);
  const editCourse = () => {
    alert("Updating course...");
    CourseService.update(newCourse)
      .then(() => {
        alert("Course updated successfully!");
        window.location.reload();
      })
      .catch((err) => {
        alert("Failed to update course!");
        console.error(err);
      });
  };

  useEffect(() => {
    const handleKeyPress = (event: KeyboardEvent) => {
      if (event.key === "Escape" || event.key === "Esc") {
        setShowModal(false);
      }
    };
    window.addEventListener("keydown", handleKeyPress);
    return () => {
      window.removeEventListener("keydown", handleKeyPress);
    };
  }, []);

  return (
    <div>
      <button
        className="bg-yellow-300 p-2 rounded-md shadow-md hover:bg-yellow-400 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-yellow-500"
        onClick={() => setShowModal(true)}
      >
        Edit course
      </button>
      {showModal && (
        <div className="justify-around bg-black bg-opacity-60 items-center flex overflow-x-hidden overflow-y-auto fixed inset-0 z-50 outline-none focus:outline-none">
          <form className="p-3 relative w-[90%] my-6 mx-auto max-w-3xl text-left bg-white border-solid border-black border-1 rounded-xl">
            <h1 className="text-center font-bold text-2xl p-3">
              {" "}
              Update the course {course.id}
            </h1>
            <table className="table-auto w-full">
              <thead>
                <tr className="p-2 mb-3">
                  <th>Attribute</th>
                  <th>Value</th>
                </tr>
              </thead>
              <tbody>
                <tr className="even:bg-gray-50 odd:bg-white mb-3">
                  <td>Name</td>
                  <td>
                    <input
                      type="text"
                      className="w-full"
                      value={newCourse.name}
                      onChange={(e) =>
                        setNewCourse({ ...newCourse, name: e.target.value })
                      }
                    />
                  </td>
                </tr>
                <tr className="even:bg-gray-50 odd:bg-white mb-3">
                  <td>Vietnamese name</td>
                  <td>
                    <input
                      type="text"
                      className="w-full"
                      value={newCourse.nameVn}
                      onChange={(e) =>
                        setNewCourse({ ...newCourse, nameVn: e.target.value })
                      }
                    />
                  </td>
                </tr>
                <tr className="even:bg-gray-50 odd:bg-white mb-3">
                  <td>Course Level</td>
                  <td>
                    <input
                      type="number"
                      min="0"
                      max="4"
                      className="w-full"
                      value={newCourse.courseLevelId}
                      onChange={(e) =>
                        setNewCourse({
                          ...newCourse,
                          courseLevelId: parseInt(e.target.value),
                        })
                      }
                    />
                  </td>
                </tr>
                <tr className="even:bg-gray-50 odd:bg-white mb-3">
                  <td>Credit Theory</td>
                  <td>
                    <input
                      type="number"
                      min="0"
                      max="4"
                      className="w-full"
                      value={newCourse.creditTheory}
                      onChange={(e) =>
                        setNewCourse({
                          ...newCourse,
                          creditTheory: parseInt(e.target.value),
                        })
                      }
                    />
                  </td>
                </tr>
                <tr className="even:bg-gray-50 odd:bg-white mb-3">
                  <td>Credit Laboratory</td>
                  <td>
                    <input
                      type="text"
                      min="0"
                      max="4"
                      className="w-full"
                      value={newCourse.creditLab}
                      onChange={(e) =>
                        setNewCourse({
                          ...newCourse,
                          creditLab: parseInt(e.target.value),
                        })
                      }
                    />
                  </td>
                </tr>
                <tr className="even:bg-gray-50 odd:bg-white">
                  <td>Description</td>
                  <td>
                    <textarea
                      className="w-full min-h-52 p-2"
                      value={newCourse.description}
                      onChange={(e) =>
                        setNewCourse({
                          ...newCourse,
                          description: e.target.value,
                        })
                      }
                    />
                  </td>
                </tr>
              </tbody>
            </table>
            <div className="w-full flex justify-around p-2">
              <button
                className="bg-green-300 px-5 py-2 rounded-md shadow-md hover:bg-green-400 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-green-500"
                onClick={() => {
                  editCourse();
                }}
              >
                Save
              </button>
              <button
                className="bg-yellow-300 px-5 py-2 rounded-md shadow-md hover:bg-yellow-400 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-yellow-500"
                onClick={() => {
                  setNewCourse(course);
                }}
              >
                Reset
              </button>
              <button
                className="bg-red-300 px-5 py-2 rounded-md shadow-md hover:bg-red-400 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-red-500"
                onClick={() => setShowModal(false)}
              >
                Cancel
              </button>
            </div>
          </form>
        </div>
      )}
    </div>
  );
};
const DeleteCourseButton: React.FC<{ course: Course }> = ({ course }) => {
  const deleteCourse = () => {
    CourseService.remove(course.id)
      .then(() => {
        alert("Course deleted successfully!");
        window.location.reload();
      })
      .catch((err) => {
        alert("Failed to delete course!");
        console.error(err);
      });
  };
  return (
    <button
      className="bg-red-500 text-white p-2 rounded-md shadow-md hover:bg-red-600 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-red-500"
      onClick={() => {
        deleteCourse();
      }}
    >
      Delete course
    </button>
  );
};

const AddCourseButton: React.FC = () => {
  const [course, setCourse] = useState<Course>({
    id: "",
    name: "",
    nameVn: "",
    courseLevelId: 0,
    creditTheory: 0,
    creditLab: 0,
    description: "",
  });
  const [programs, setPrograms] = useState<Program[]>([]);
  const [courseProgram, setCourseProgram] = useState<CourseProgram>({
    id: {
      programId: 0,
      courseId: "",
    },
    courseCode: "",
    courseTypeId: 0,
  });
  const [showModal, setShowModal] = useState(false);
  const addCourse = () => {
    CourseService.post(course!)
      .then(() => {
        alert("Course added successfully!");
      })
      .catch((err) => {
        alert("Failed to add new course!");
        console.error(err);
      });
    CourseProgramService.post(courseProgram)
      .then(() => {
        alert("Course program added successfully!");
      })
      .catch((err) => {
        alert("Failed to add new course program!");
        console.error(err);
      });
    window.location.reload();
  };
  useEffect(() => {
    ProgramService.get()
      .then((p) => {
        setPrograms(p);
      })
      .catch((err) => {
        console.error(err);
      });
  }, []);
  return (
    <div>
      <button
        className="w-full bg-blue-500 text-white font-bold p-2 rounded-md shadow-md hover:bg-blue-600 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-white"
        onClick={() => setShowModal(true)}
      >
        Add new course
      </button>
      {showModal && (
        <div className="justify-around bg-black bg-opacity-60 items-center flex overflow-x-hidden fixed inset-0 z-50 outline-none focus:outline-none">
          <form className="p-3 relative w-[90%] overflow-y-scroll h-[90%] my-6 mx-auto max-w-3xl text-left bg-white border-solid border-black border-1 rounded-xl">
            <h1 className="text-center font-bold text-2xl p-3">
              Create a new course!
            </h1>
            <div className="">
              <table className="table-auto w-full">
                <thead>
                  <tr className="p-2 mb-3">
                    <th className="text-center">Attribute</th>
                    <th className="text-center">Value</th>
                  </tr>
                </thead>
                <tbody>
                  <tr className="even:bg-gray-50 odd:bg-white mb-3">
                    <td>Program</td>
                    <td>
                      <select
                        className="w-full p-2"
                        onChange={(e) =>
                          setCourseProgram({
                            ...courseProgram,
                            id: {
                              ...courseProgram.id,
                              programId: parseInt(e.target.value),
                            },
                          })
                        }
                      >
                        <option value="">Select a program</option>
                        {programs.map((program) => (
                          <option key={program.id} value={program.id}>
                            {program.name}
                          </option>
                        ))}
                      </select>
                    </td>
                  </tr>
                  <tr className="even:bg-gray-50 odd:bg-white mb-3">
                    <td>Course ID</td>
                    <td>
                      <input
                        type="text"
                        className="w-full"
                        value={course.id}
                        onChange={(e) => {
                          setCourse({ ...course, id: e.target.value });
                          setCourseProgram({
                            ...courseProgram,
                            id: {
                              ...courseProgram.id,
                              courseId: e.target.value,
                            },
                          });
                        }}
                      />
                    </td>
                  </tr>
                  <tr className="even:bg-gray-50 odd:bg-white mb-3">
                    <td>Course code</td>
                    <td>
                      <input
                        type="number"
                        min={0}
                        className="w-full"
                        value={courseProgram.courseCode}
                        onChange={(e) =>
                          setCourseProgram({
                            ...courseProgram,
                            courseCode: e.target.value,
                          })
                        }
                      />
                    </td>
                  </tr>
                  <tr className="even:bg-gray-50 odd:bg-white mb-3">
                    <td>Course type id</td>
                    <td>
                      <input
                        type="number"
                        min={0}
                        className="w-full"
                        value={courseProgram.courseTypeId}
                        onChange={(e) =>
                          setCourseProgram({
                            ...courseProgram,
                            courseTypeId: parseInt(e.target.value),
                          })
                        }
                      />
                    </td>
                  </tr>
                  <tr className="even:bg-gray-50 odd:bg-white mb-3">
                    <td>Name</td>
                    <td>
                      <input
                        type="text"
                        className="w-full"
                        value={course.name}
                        onChange={(e) =>
                          setCourse({ ...course, name: e.target.value })
                        }
                      />
                    </td>
                  </tr>
                  <tr className="even:bg-gray-50 odd:bg-white mb-3">
                    <td>Vietnamese name</td>
                    <td>
                      <input
                        type="text"
                        className="w-full"
                        value={course.nameVn}
                        onChange={(e) =>
                          setCourse({ ...course, nameVn: e.target.value })
                        }
                      />
                    </td>
                  </tr>
                  <tr className="even:bg-gray-50 odd:bg-white mb-3">
                    <td>Course Level</td>
                    <td>
                      <input
                        type="number"
                        min="0"
                        max="4"
                        className="w-full"
                        value={course.courseLevelId}
                        onChange={(e) =>
                          setCourse({
                            ...course,
                            courseLevelId: parseInt(e.target.value),
                          })
                        }
                      />
                    </td>
                  </tr>
                  <tr className="even:bg-gray-50 odd:bg-white mb-3">
                    <td>Credit Theory</td>
                    <td>
                      <input
                        type="number"
                        min="0"
                        className="w-full"
                        value={course.creditTheory}
                        onChange={(e) =>
                          setCourse({
                            ...course,
                            creditTheory: parseInt(e.target.value),
                          })
                        }
                      />
                    </td>
                  </tr>
                  <tr className="even:bg-gray-50 odd:bg-white mb-3">
                    <td>Credit Laboratory</td>
                    <td>
                      <input
                        type="text"
                        min="0"
                        className="w-full"
                        value={course.creditLab}
                        onChange={(e) =>
                          setCourse({
                            ...course,
                            creditLab: parseInt(e.target.value),
                          })
                        }
                      />
                    </td>
                  </tr>
                  <tr className="even:bg-gray-50 odd:bg-white">
                    <td>Description</td>
                    <td>
                      <textarea
                        className="w-full min-h-52 p-2"
                        value={course.description}
                        onChange={(e) =>
                          setCourse({
                            ...course,
                            description: e.target.value,
                          })
                        }
                      />
                    </td>
                  </tr>
                </tbody>
              </table>
              <div>
                <div className="w-full flex justify-around p-2">
                  <button
                    className="bg-green-300 px-5 py-2 rounded-md shadow-md hover:bg-green-400 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-green-500"
                    onClick={() => {
                      addCourse();
                    }}
                  >
                    Save
                  </button>
                  <button
                    className="bg-red-300 px-5 py-2 rounded-md shadow-md hover:bg-red-400 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-red-500"
                    onClick={() => setShowModal(false)}
                  >
                    Cancel
                  </button>
                </div>
              </div>
            </div>


          </form>
        </div>
      )}
    </div>
  );
};


export default CoursePage;
