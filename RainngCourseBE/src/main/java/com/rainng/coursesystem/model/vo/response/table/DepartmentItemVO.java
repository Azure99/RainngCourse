package com.rainng.coursesystem.model.vo.response.table;

import lombok.Data;

@Data
public class DepartmentItemVO {
    private Integer id;
    private String name;
    private Integer majorCount;
    private Integer teacherCount;

    public DepartmentItemVO(Integer id, String name, Integer majorCount, Integer teacherCount) {
        this.id = id;
        this.name = name;
        this.majorCount = majorCount;
        this.teacherCount = teacherCount;
    }
}
