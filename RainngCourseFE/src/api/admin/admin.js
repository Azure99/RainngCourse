import * as ajax from "../../common/ajax";

export const get = id => ajax.get("/admin/admin/" + id);

export const create = entity => ajax.post("/admin/admin", entity);

export const deleteItem = id => ajax.pureDelete("/admin/admin/" + id);

export const update = entity => ajax.put("/admin/admin", entity);

export const list = () => ajax.pureGet("/admin/admin");
