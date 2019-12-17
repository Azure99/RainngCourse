import * as ajax from "../../common/ajax";

export const list = () => ajax.pureGet("/student/course/list");

export const deleteItem = studentCourseId =>
  ajax.pureDelete("/student/course/" + studentCourseId);
