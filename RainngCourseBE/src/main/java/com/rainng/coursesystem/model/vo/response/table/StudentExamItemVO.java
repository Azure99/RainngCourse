package com.rainng.coursesystem.model.vo.response.table;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class StudentExamItemVO {
    private Integer studentCourseId;
    private String courseName;
    private String teacherName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date examDate;
    private String examLocation;
}
