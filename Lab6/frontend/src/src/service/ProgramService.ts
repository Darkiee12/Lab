import axios from "axios";
import Program from "../models/Program";

const get = () => {
  return axios
    .get<Program[]>("http://localhost:8080/api/program/", {
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
