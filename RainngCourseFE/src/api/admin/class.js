import * as ajax from "../../common/ajax";

export const get = id => ajax.get("/admin/class/" + id);

export const create = entity => ajax.post("/admin/class", entity);

export const deleteItem = id => ajax.pureDelete("/admin/class/" + id);

export const update = entity => ajax.put("/admin/class", entity);

export const getPageCount = (departmentName, majorName, name) =>
  ajax.get("/admin/class/page/count", {
    departmentName: departmentName,
    majorName: majorName,
    name: name
  });

export const getPage = (index, departmentName, majorName, name) =>
  ajax.get("/admin/class/page/" + index, {
    departmentName: departmentName,
    majorName: majorName,
    name: name
  });

export const listName = () => ajax.pureGet("/admin/class/names");

export const pageSize = 20;
