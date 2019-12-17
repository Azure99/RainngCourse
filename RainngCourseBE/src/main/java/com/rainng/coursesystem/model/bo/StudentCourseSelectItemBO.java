package com.rainng.coursesystem.model.bo;

import lombok.Data;

@Data
public class StudentCourseSelectItemBO {
    private Integer courseId;
    private String courseName;
    private String teacherName;
    private Integer credit;
    private String time;
    private Integer selectedCount;
    private Integer maxSize;
}
