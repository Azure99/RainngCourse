package com.rainng.coursesystem.model.vo.response;

import lombok.Data;

import java.io.Serializable;

@Data
public class ResultVO implements Serializable {
    public static final int NO_LOGIN = -1;
    public static final int SUCCESS = 0;
    public static final int FAIL = 1;
    public static final int ERROR_ROLE = 2;
    public static final int NO_PERMISSION = 3;
    public static final int INVALID_PARAMETER = 4;
    public static final int SERVER_ERROR = 10;
    private static final long serialVersionUID = 1L;
    private Integer code;
    private String message;
    private Object data;

    public ResultVO() {

    }

    public ResultVO(Integer code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }
}
