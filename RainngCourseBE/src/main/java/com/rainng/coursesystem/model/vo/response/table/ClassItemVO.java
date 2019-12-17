package com.rainng.coursesystem.model.vo.response.table;

import lombok.Data;

@Data
public class ClassItemVO {
    private Integer id;
    private String name;
    private Integer grade;
    private String departmentName;
    private String majorName;
}
