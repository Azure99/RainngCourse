import * as ajax from "../../common/ajax";

export const get = id => ajax.get("/admin/student/course/" + id);

export const create = entity => ajax.post("/admin/student/course", entity);

export const deleteItem = id => ajax.pureDelete("/admin/student/course/" + id);

export const update = entity => ajax.put("/admin/student/course", entity);

export const getPageCount = (className, courseName, studentName) =>
  ajax.get("/admin/student/course/page/count", {
    className: className,
    courseName: courseName,
    studentName: studentName
  });

export const getPage = (index, className, courseName, studentName) =>
  ajax.get("/admin/student/course/page/" + index, {
    className: className,
    courseName: courseName,
    studentName: studentName
  });

export const pageSize = 20;
