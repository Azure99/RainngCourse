package com.rainng.coursesystem.dao;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainng.coursesystem.dao.mapper.CourseMapper;
import com.rainng.coursesystem.model.bo.CourseItemBO;
import com.rainng.coursesystem.model.bo.StudentCourseSelectItemBO;
import com.rainng.coursesystem.model.entity.CourseEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CourseDAO extends BaseDAO {
    public static final int PAGE_SIZE = 20;

    private final CourseMapper mapper;

    public CourseDAO(CourseMapper mapper) {
        this.mapper = mapper;
    }

    public int insert(CourseEntity entity) {
        return mapper.insert(entity);
    }

    public int delete(Integer id) {
        return mapper.deleteById(id);
    }

    public CourseEntity get(Integer id) {
        return mapper.selectById(id);
    }

    public int update(CourseEntity entity) {
        return mapper.updateById(entity);
    }

    public int count(String departmentName, String teacherName, String name) {
        return mapper.count(departmentName, teacherName, name);
    }

    public List<CourseItemBO> getPage(Integer index, String departmentName, String teacherName, String name) {
        Page<CourseItemBO> page = new Page<>(index, PAGE_SIZE);

        return mapper.getPage(page, departmentName, teacherName, name).getRecords();
    }

    public Integer countByTeacherId(Integer teacherId) {
        LambdaQueryWrapper<CourseEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(CourseEntity::getTeacherId, teacherId);

        return mapper.selectCount(wrapper);
    }

    public List<CourseEntity> listName() {
        LambdaQueryWrapper<CourseEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.select(CourseEntity::getId, CourseEntity::getName);

        return mapper.selectList(wrapper);
    }

    public int increaseSelectedCount(Integer courseId) {
        CourseEntity course = mapper.selectById(courseId);
        course.setSelectedCount(course.getSelectedCount() + 1);

        return mapper.updateById(course);
    }

    public int decreaseSelectedCount(Integer courseId) {
        CourseEntity course = mapper.selectById(courseId);
        course.setSelectedCount(course.getSelectedCount() - 1);

        return mapper.updateById(course);
    }

    public Integer countStudentCanSelect(Integer studentId, Integer departmentId, Integer grade, String courseName, String teacherName) {
        return mapper.countStudentCanSelect(studentId, departmentId, grade, courseName, teacherName);
    }

    public List<StudentCourseSelectItemBO> getStudentCanSelectPage(Integer index, Integer studentId, Integer departmentId, Integer grade, String courseName, String teacherName) {
        Page<StudentCourseSelectItemBO> page = new Page<>(index, PAGE_SIZE);

        return mapper.getStudentCanSelectPage(page, studentId, departmentId, grade, courseName, teacherName).getRecords();
    }

    public Integer getDepartmentIdById(Integer courseId) {
        return mapper.getDepartmentIdById(courseId);
    }
}
