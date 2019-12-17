import * as ajax from "../../common/ajax";

export const get = id => ajax.pureGet("/teacher/grade/" + id);

export const update = entity => ajax.put("/teacher/grade", entity);

export const getPageCount = (courseName, studentName) =>
  ajax.get("/teacher/grade/page/count", {
    courseName: courseName,
    studentName: studentName
  });

export const getPage = (index, courseName, studentName) =>
  ajax.get("/teacher/grade/page/" + index, {
    courseName: courseName,
    studentName: studentName
  });

export const pageSize = 20;
