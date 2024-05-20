import axios from "axios";
import Course from "../models/Course";

const post = (course: Course) => {
  return axios
    .post<Course>("http://localhost:8080/api/course/", course, {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    })
    .then((response) => {
      return response.data;
    })
    .catch((err) => Promise.reject(err));
};

const get = () => {
  return axios
    .get<Course[]>("http://localhost:8080/api/course/", {
      headers: {
        accept: "application/hal+json",
      },
    })
    .then((response) => {
      return response.data;
    })
    .catch((err) => 
      Promise.reject(err)
  )
};

const update = (course: Course) => {
  return axios
    .put(`http://localhost:8080/api/course/${course.id}`, course, {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    })
    .then((response) => {
      return response.data;
    })
    .catch((err) => Promise.reject(err));
  };

const remove = (id: string) => {
  return axios
    .delete(`http://localhost:8080/api/course/${id}`)
    .then((response) => {
      return response.data;
    })
    .catch((err) => Promise.reject(err));
};

export default { post, get, update, remove };
