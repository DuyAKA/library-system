// import axios from "axios";

// export default axios.create({
//   baseURL: "http://localhost:1107/api",
//   headers: {
//     "Authorization" : `Bearer ${localStorage.getItem("token")}`,
//     "Content-type": "application/json"
//   }
// })
// ;

import axios from "axios";

const instance = axios.create({
  baseURL: "https://endlib-backend.fly.dev/api",
  headers: {
    "Content-type": "application/json"
  }
});

instance.interceptors.request.use(async config => {
  const token = await localStorage.getItem("token");
  if (token) {
    config.headers["Authorization"] = `Bearer ${token}`;
  }
  return config;
}, error => {
  return Promise.reject(error);
});

export default instance;
