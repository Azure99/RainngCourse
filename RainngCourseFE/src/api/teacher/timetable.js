import * as ajax from "../../common/ajax";

export const get = () => ajax.pureGet("/teacher/timetable");
