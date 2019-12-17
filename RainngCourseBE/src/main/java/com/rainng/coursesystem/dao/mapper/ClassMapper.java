package com.rainng.coursesystem.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rainng.coursesystem.model.entity.ClassEntity;
import com.rainng.coursesystem.model.vo.response.table.MajorItemVO;
import org.springframework.stereotype.Repository;

@Repository
public interface ClassMapper extends BaseMapper<ClassEntity> {
    Integer count(String departmentName, String majorName, String name);

    IPage<MajorItemVO> getPage(IPage<MajorItemVO> page, String departmentName, String majorName, String name);
}
