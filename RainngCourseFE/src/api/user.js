import { post, pureGet } from "../common/ajax";

export const login = (username, password, userType) =>
  post("/user/login", {
    username: username,
    password: password,
    userType: userType
  });

export const getLoginStatus = () => pureGet("/user/login/status");

export const logout = () => pureGet("/user/logout");
