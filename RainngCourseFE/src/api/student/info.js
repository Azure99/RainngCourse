import * as ajax from "../../common/ajax";

export const get = () => ajax.pureGet("/student/info");

export const update = entity => ajax.put("/student/info", entity);
