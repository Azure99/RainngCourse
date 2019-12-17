import * as ajax from "../../common/ajax";

export const get = id => ajax.get("/admin/student/" + id);

export const create = entity => ajax.post("/admin/student", entity);

export const deleteItem = id => ajax.pureDelete("/admin/student/" + id);

export const update = entity => ajax.put("/admin/student", entity);

export const getPageCount = (majorName, className, name) =>
  ajax.get("/admin/student/page/count", {
    majorName: majorName,
    className: className,
    name: name
  });

export const getPage = (index, majorName, className, name) =>
  ajax.get("/admin/student/page/" + index, {
    majorName: majorName,
    className: className,
    name: name
  });

export const listName = () => ajax.pureGet("/admin/student/names");

export const pageSize = 20;
