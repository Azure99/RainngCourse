package com.rainng.coursesystem.config.themis.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Admin {
    // 无权限
    int NO = 0;
    // 系管理
    int DEPARTMENT_MANAGE = 1;
    // 专业管理
    int MAJOR_MANAGE = 2;
    // 班级管理
    int CLASS_MANAGE = 4;
    // 学生管理
    int STUDENT_MANAGE = 8;
    // 教师管理
    int TEACHER_MANAGE = 16;
    // 课程管理
    int COURSE_MANAGE = 32;
    // 学生选课管理
    int STUDENT_COURSE_MANAGE = 64;
    // 管理员管理
    int ADMIN_MANAGE = 128;
    // 所有权限
    int ALL = 255;

    int value() default 0;
}
