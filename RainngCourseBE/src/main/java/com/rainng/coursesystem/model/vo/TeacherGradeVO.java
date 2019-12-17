package com.rainng.coursesystem.model.vo;

import lombok.Data;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotNull;

@Data
public class TeacherGradeVO {
    @NotNull
    private Integer studentCourseId;

    @Range(min = 0, max = 100, message = "分数必须在0-100之间")
    private Integer dailyScore;

    @Range(min = 0, max = 100, message = "分数必须在0-100之间")
    private Integer examScore;

    @Range(min = 0, max = 100, message = "分数必须在0-100之间")
    private Integer score;
}
