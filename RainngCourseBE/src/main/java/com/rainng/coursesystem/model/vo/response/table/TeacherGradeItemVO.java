package com.rainng.coursesystem.model.vo.response.table;

import lombok.Data;

@Data
public class TeacherGradeItemVO {
    private Integer studentCourseId;
    private String courseName;
    private String studentName;
    private Integer dailyScore;
    private Integer examScore;
    private Integer score;
}
