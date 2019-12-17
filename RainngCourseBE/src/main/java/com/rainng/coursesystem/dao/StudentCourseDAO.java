package com.rainng.coursesystem.dao;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainng.coursesystem.dao.mapper.StudentCourseMapper;
import com.rainng.coursesystem.model.entity.StudentCourseEntity;
import com.rainng.coursesystem.model.vo.response.table.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentCourseDAO extends BaseDAO {
    public static final int PAGE_SIZE = 20;
    private final StudentCourseMapper mapper;

    public StudentCourseDAO(StudentCourseMapper mapper) {
        this.mapper = mapper;
    }


    public int insert(StudentCourseEntity entity) {
        return mapper.insert(entity);
    }

    public int delete(Integer id) {
        return mapper.deleteById(id);
    }

    public StudentCourseEntity get(Integer id) {
        return mapper.selectById(id);
    }

    public int update(StudentCourseEntity entity) {
        return mapper.updateById(entity);
    }

    public int count(String className, String courseName, String studentName) {
        return mapper.count(className, courseName, studentName);
    }

    public List<StudentCourseItemVO> getPage(Integer index, String className, String courseName, String studentName) {
        Page<StudentCourseItemVO> page = new Page<>(index, PAGE_SIZE);

        return mapper.getPage(page, className, courseName, studentName).getRecords();
    }

    public int countByCourseId(Integer courseId) {
        LambdaQueryWrapper<StudentCourseEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StudentCourseEntity::getCourseId, courseId);

        return mapper.selectCount(wrapper);
    }

    public int countByStudentId(Integer studentId) {
        LambdaQueryWrapper<StudentCourseEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StudentCourseEntity::getStudentId, studentId);

        return mapper.selectCount(wrapper);
    }

    public StudentCourseEntity getByCourseIdAndStudentId(Integer courseId, Integer studentId) {
        LambdaQueryWrapper<StudentCourseEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.select(StudentCourseEntity::getId)
                .eq(StudentCourseEntity::getCourseId, courseId)
                .eq(StudentCourseEntity::getStudentId, studentId);

        return mapper.selectOne(wrapper);
    }

    public List<StudentCourseSelectedItemVO> listStudentCourseSelected(Integer studentId) {
        return mapper.listStudentCourseSelected(studentId);
    }

    public List<StudentExamItemVO> listStudentExam(Integer studentId) {
        return mapper.listStudentExam(studentId);
    }

    public Integer countStudentCourseSelectedByTimePart(Integer studentId, String timePart) {
        return mapper.countStudentCourseSelectedByTimePart(studentId, timePart);
    }

    public List<TimetableItemVO> listStudentTimetable(Integer studentId) {
        return mapper.listStudentTimetable(studentId);
    }

    public Integer countTeacherGrade(Integer teacherId, String courseName, String studentName) {
        return mapper.countTeacherGrade(teacherId, courseName, studentName);
    }

    public List<TeacherGradeItemVO> getTeacherGradePage(Integer index, Integer teacherId, String courseName, String studentName) {
        Page<TeacherGradeItemVO> page = new Page<>(index, PAGE_SIZE);
        return mapper.getTeacherGradePage(page, teacherId, courseName, studentName).getRecords();
    }
}
