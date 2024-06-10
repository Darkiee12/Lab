import axios from "axios";
import CourseProgram from "../models/CourseProgram";
const baseURL = (endpoint: string) => `http://localhost:8080/api${endpoint}`;
const post = (courseProgram: CourseProgram) => {
  return axios
    .post<CourseProgram>(baseURL("/courseprogram"), courseProgram, {
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