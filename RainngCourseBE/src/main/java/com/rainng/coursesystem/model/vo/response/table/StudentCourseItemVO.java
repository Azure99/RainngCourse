package com.rainng.coursesystem.model.vo.response.table;

import lombok.Data;

@Data
public class StudentCourseItemVO {
    private Integer id;
    private String courseName;
    private String studentName;
    private String className;
    private Integer dailyScore;
    private Integer examScore;
    private Integer score;
}
