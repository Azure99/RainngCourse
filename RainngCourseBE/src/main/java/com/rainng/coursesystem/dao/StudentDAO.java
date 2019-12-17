package com.rainng.coursesystem.dao;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainng.coursesystem.dao.mapper.StudentMapper;
import com.rainng.coursesystem.model.entity.StudentEntity;
import com.rainng.coursesystem.model.vo.response.StudentInfoVO;
import com.rainng.coursesystem.model.vo.response.table.StudentItemVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentDAO extends BaseDAO {
    public static final int PAGE_SIZE = 20;
    private final StudentMapper mapper;

    public StudentDAO(StudentMapper mapper) {
        this.mapper = mapper;
    }

    public StudentEntity getByNumber(String number) {
        LambdaQueryWrapper<StudentEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StudentEntity::getNumber, number);

        return mapper.selectOne(wrapper);
    }


    public int insert(StudentEntity entity) {
        return mapper.insert(entity);
    }

    public int delete(Integer id) {
        return mapper.deleteById(id);
    }

    public StudentEntity get(Integer id) {
        return mapper.selectById(id);
    }

    public int update(StudentEntity entity) {
        return mapper.updateById(entity);
    }

    public int count(String majorName, String className, String name) {
        return mapper.count(majorName, className, name);
    }

    public List<StudentItemVO> getPage(Integer index, String majorName, String className, String name) {
        Page<StudentItemVO> page = new Page<>(index, PAGE_SIZE);

        return mapper.getPage(page, majorName, className, name).getRecords();
    }

    public Integer countByClassId(Integer id) {
        LambdaQueryWrapper<StudentEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StudentEntity::getClassId, id);

        return mapper.selectCount(wrapper);
    }

    public List<StudentEntity> listName() {
        LambdaQueryWrapper<StudentEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.select(StudentEntity::getId, StudentEntity::getName);

        return mapper.selectList(wrapper);
    }

    public Integer getDepartmentIdById(Integer studentId) {
        return mapper.getDepartmentIdById(studentId);
    }

    public Integer getGradeById(Integer studentId) {
        return mapper.getGradeById(studentId);
    }

    public StudentInfoVO getStudentInfoById(Integer studentId) {
        return mapper.getStudentInfoById(studentId);
    }
}
