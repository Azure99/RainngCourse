package com.rainng.coursesystem.service.admin;

import com.rainng.coursesystem.manager.admin.StudentCourseManager;
import com.rainng.coursesystem.model.entity.CourseEntity;
import com.rainng.coursesystem.model.entity.StudentCourseEntity;
import com.rainng.coursesystem.model.vo.response.ResultVO;
import com.rainng.coursesystem.service.BaseService;
import org.springframework.stereotype.Service;

@Service
public class StudentCourseService extends BaseService {
    private final StudentCourseManager manager;

    public StudentCourseService(StudentCourseManager manager) {
        this.manager = manager;
    }

    public ResultVO getPageCount(String className, String courseName, String studentName) {
        return result(manager.getPageCount(className, courseName, studentName));
    }

    public ResultVO getPage(Integer index, String className, String courseName, String studentName) {
        return result(manager.getPage(index, className, courseName, studentName));
    }

    public ResultVO get(Integer id) {
        StudentCourseEntity entity = manager.get(id);
        if (entity == null) {
            return failedResult("学生选课Id: " + id + "不存在!");
        }

        return result(entity);
    }

    public ResultVO update(StudentCourseEntity entity) {
        StudentCourseEntity originEntity = manager.get(entity.getId());
        if (originEntity == null) {
            return failedResult("学生选课Id: " + entity.getId() + "不存在!");
        }
        if (!originEntity.getCourseId().equals(entity.getCourseId())) {
            return failedResult("课程Id被篡改");
        }
        if (!originEntity.getStudentId().equals(entity.getStudentId())) {
            return failedResult("学生Id被篡改");
        }

        manager.update(entity);
        return result("更新成功");
    }

    public ResultVO delete(Integer id) {
        StudentCourseEntity entity = manager.get(id);
        if (entity == null) {
            return failedResult("学生选课Id: " + id + "不存在!");
        }

        manager.delete(entity);
        return result("删除成功");
    }

    public ResultVO create(StudentCourseEntity entity) {
        if (manager.get(entity.getId()) != null) {
            return failedResult("学生选课Id: " + entity.getId() + "已存在!");
        }
        if (manager.getStudentById(entity.getStudentId()) == null) {
            return failedResult("所属学生Id: " + entity.getStudentId() + "不存在!");
        }
        if (manager.getByCourseIdAndStudentId(entity.getCourseId(), entity.getStudentId()) != null) {
            return failedResult("学生已经选修此课程");
        }
        CourseEntity course = manager.getCourseById(entity.getCourseId());
        if (course == null) {
            return failedResult("所属课程Id: " + entity.getCourseId() + "不存在!");
        }
        if (course.getSelectedCount() >= course.getMaxSize()) {
            return failedResult("课容量已满");
        }
        if (!manager.inSameDepartment(entity.getCourseId(), entity.getStudentId())) {
            return failedResult("课程与学生不在同一教学系");
        }
        if (!course.getGrade().equals(manager.getStudentGradeById(entity.getStudentId()))) {
            return failedResult("课程与学生不在同一年级");
        }

        manager.create(entity);
        return result("添加成功");
    }
}
