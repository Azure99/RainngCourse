package com.rainng.coursesystem.model.vo.response.table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainng.coursesystem.model.bo.SdnuNewsBO;
import lombok.Data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
public class SdnuNewsItemVO {
    private String title;

    @JsonFormat(pattern = "yyyy/MM/dd")
    private Date date;

    private String url;

    private static SdnuNewsItemVO fromSdnuNewsBO(SdnuNewsBO bo) {
        SdnuNewsItemVO vo = new SdnuNewsItemVO();
        vo.setTitle(bo.getTitle());
        vo.setUrl(bo.getUrl());

        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
            vo.setDate(format.parse(bo.getDate()));
        } catch (ParseException ex) {
            ex.printStackTrace();
        }

        return vo;
    }

    public static List<SdnuNewsItemVO> fromSdnuNewsBOList(List<SdnuNewsBO> boList) {
        List<SdnuNewsItemVO> voList = new ArrayList<>();
        for (SdnuNewsBO bo : boList) {
            voList.add(SdnuNewsItemVO.fromSdnuNewsBO(bo));
        }

        return voList;
    }

}
