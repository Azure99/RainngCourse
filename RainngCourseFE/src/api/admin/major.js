import * as ajax from "../../common/ajax";

export const get = id => ajax.get("/admin/major/" + id);

export const create = entity => ajax.post("/admin/major", entity);

export const deleteItem = id => ajax.pureDelete("/admin/major/" + id);

export const update = entity => ajax.put("/admin/major", entity);

export const getPageCount = (departmentName, name) =>
  ajax.get("/admin/major/page/count", {
    departmentName: departmentName,
    name: name
  });

export const getPage = (index, departmentName, name) =>
  ajax.get("/admin/major/page/" + index, {
    departmentName: departmentName,
    name: name
  });

export const listName = () => ajax.pureGet("/admin/major/names");

export const pageSize = 20;
