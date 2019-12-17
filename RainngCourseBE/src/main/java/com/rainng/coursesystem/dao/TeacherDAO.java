package com.rainng.coursesystem.dao;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainng.coursesystem.dao.mapper.TeacherMapper;
import com.rainng.coursesystem.model.entity.TeacherEntity;
import com.rainng.coursesystem.model.vo.response.table.TeacherCourseItemVO;
import com.rainng.coursesystem.model.vo.response.table.TeacherItemVO;
import com.rainng.coursesystem.model.vo.response.table.TimetableItemVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeacherDAO extends BaseDAO {
    public static final int PAGE_SIZE = 20;

    private final TeacherMapper mapper;

    public TeacherDAO(TeacherMapper mapper) {
        this.mapper = mapper;
    }

    public int insert(TeacherEntity entity) {
        return mapper.insert(entity);
    }

    public int delete(Integer id) {
        return mapper.deleteById(id);
    }

    public TeacherEntity get(Integer id) {
        return mapper.selectById(id);
    }

    public int update(TeacherEntity entity) {
        return mapper.updateById(entity);
    }

    public int count(String departmentName, String name) {
        return mapper.count(departmentName, name);
    }

    public List<TeacherItemVO> getPage(Integer index, String departmentName, String name) {
        Page<TeacherItemVO> page = new Page<>(index, PAGE_SIZE);

        return mapper.getPage(page, departmentName, name).getRecords();
    }

    public TeacherEntity getByNumber(String number) {
        LambdaQueryWrapper<TeacherEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(TeacherEntity::getNumber, number);

        return mapper.selectOne(wrapper);
    }

    public Integer countByDepartmentId(Integer departmentId) {
        LambdaQueryWrapper<TeacherEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(TeacherEntity::getDepartmentId, departmentId);

        return mapper.selectCount(wrapper);
    }

    public List<TeacherEntity> listName() {
        LambdaQueryWrapper<TeacherEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.select(TeacherEntity::getId, TeacherEntity::getName);

        return mapper.selectList(wrapper);
    }

    public List<TimetableItemVO> listTeacherTimetable(Integer teacherId) {
        return mapper.listTeacherTimetable(teacherId);
    }

    public List<TeacherCourseItemVO> listTeacherCourse(Integer teacherId) {
        return mapper.listTeacherCourse(teacherId);
    }
}
