import axios from "axios";
import Course from "../models/Course";
import Pagination from "../models/Pagination";
const baseURL = (endpoint: string) => `http://localhost:3000/api${endpoint}`;
const post = (course: Course) => {
  return axios
    .post<Course>(baseURL("/courses"), course, {
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

const get = (page: number = 1, limit: number = 20) => {
  return axios
    .get<Pagination<Course>>(baseURL(`/courses?page=${page}&limit=${limit}`), {
      headers: {
        accept: "application/hal+json",
      },
    })
    .then((response) => {
      return response.data.items;
    })
    .catch((err) => 
      Promise.reject(err)
  )
};

const update = (course: Course) => {
  return axios
    .put(baseURL(`course/${course.id}`), course, {
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
    .delete(baseURL(`course/${id}`))
    .then((response) => {
      return response.data;
    })
    .catch((err) => Promise.reject(err));
};

export default { post, get, update, remove };
