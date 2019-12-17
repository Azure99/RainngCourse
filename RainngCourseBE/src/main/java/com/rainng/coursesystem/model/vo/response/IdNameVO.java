package com.rainng.coursesystem.model.vo.response;

import lombok.Data;

@Data
public class IdNameVO {
    private Integer id;
    private String name;

    public IdNameVO(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}
