import axios from "axios";
import Program from "../models/Program";
const baseURL = (endpoint: string) => `http://localhost:3000/api${endpoint}`;
const get = () => {
  return axios
    .get<Program[]>(baseURL("/programs"), {
      headers: {
        accept: "application/hal+json",
      },
    })
    .then((response) => {
      return response.data;
    })
    .catch((err) => Promise.reject(err));
};

export default { get };
