import axios from "axios";
import CourseProgram from "../models/CourseProgram";

const post = (courseProgram: CourseProgram) => {
  return axios
    .post<CourseProgram>("http://localhost:8080/api/courseProgram/", courseProgram, {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    })
    .then((response) => {
      return response.data;
    })
    .catch((err) => Promise.reject(err));
}

export default { post}