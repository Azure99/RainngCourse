import * as ajax from "../../common/ajax";

export const get = id => ajax.get("/admin/department/" + id);

export const create = entity => ajax.post("/admin/department", entity);

export const deleteItem = id => ajax.pureDelete("/admin/department/" + id);

export const update = entity => ajax.put("/admin/department", entity);

export const getPageCount = name =>
  ajax.get("/admin/department/page/count", {
    name: name
  });

export const getPage = (index, name) =>
  ajax.get("/admin/department/page/" + index, {
    name: name
  });

export const listName = () => ajax.pureGet("/admin/department/names");

export const pageSize = 20;
