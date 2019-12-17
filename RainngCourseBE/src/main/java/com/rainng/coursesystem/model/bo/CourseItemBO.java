package com.rainng.coursesystem.model.bo;

import lombok.Data;

@Data
public class CourseItemBO {
    private Integer id;
    private String name;
    private String teacherName;
    private String departmentName;
    private Integer grade;
    private Integer credit;
    private String time;
    private Integer selectedCount;
    private Integer maxSize;
}
