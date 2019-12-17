package com.rainng.coursesystem.controller;

import com.rainng.coursesystem.model.vo.response.ResultVO;
import com.rainng.coursesystem.service.SdnuNewsService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/sdnu/news")
@RestController
public class SdnuNewsController extends BaseController {
    private final SdnuNewsService service;

    public SdnuNewsController(SdnuNewsService service) {
        this.service = service;
    }

    @GetMapping
    public ResultVO get() {
        return service.getAllNews();
    }
}
