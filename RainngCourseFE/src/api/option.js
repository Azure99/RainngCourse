import { pureGet, put } from "../common/ajax";

export const getAllowStudentSelect = () =>
  pureGet("/option/allowStudentSelect");

export const setAllowStudentSelect = option =>
  put("/option/allowStudentSelect", {
    option: option
  });

export const getAllowTeacherGrade = () => pureGet("/option/allowTeacherGrade");

export const setAllowTeacherGrade = option =>
  put("/option/allowTeacherGrade", {
    option: option
  });
