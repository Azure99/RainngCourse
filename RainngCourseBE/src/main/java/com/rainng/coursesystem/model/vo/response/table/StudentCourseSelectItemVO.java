package com.rainng.coursesystem.model.vo.response.table;

import lombok.Data;

@Data
public class StudentCourseSelectItemVO {
    private Integer courseId;
    private String courseName;
    private String teacherName;
    private Integer credit;
    private String time;
    private Integer selectedCount;
    private Integer maxSize;
}
