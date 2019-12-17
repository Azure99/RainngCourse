package com.rainng.coursesystem.model.bo;

import lombok.Data;

@Data
public class SdnuNewsBO {
    private String title;
    private String url;
    private String date;

    public SdnuNewsBO(String title, String date, String url) {
        this.title = title;
        this.date = date;
        this.url = url;
    }
}
