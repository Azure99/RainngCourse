package com.rainng.coursesystem.dao.redis;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OptionDAO {
    private static final String HASH_NAME = "rc_option";
    private static final String ALLOW_STUDENT_SELECT = "allow_student_select";
    private static final String ALLOW_TEACHER_GRADE = "allow_teacher_grade";

    private final RedisTemplate template;

    public OptionDAO(@Qualifier("redisTemplate") RedisTemplate template) {
        this.template = template;
    }

    public Boolean getAllowStudentSelect() {
        return (Boolean) get(ALLOW_STUDENT_SELECT);
    }

    public void setAllowStudentSelect(Boolean status) {
        set(ALLOW_STUDENT_SELECT, status);
    }

    public Boolean getAllowTeacherGrade() {
        return (Boolean) get(ALLOW_TEACHER_GRADE);
    }

    public void setAllowTeacherGrade(Boolean status) {
        set(ALLOW_TEACHER_GRADE, status);
    }

    private Object get(String key) {
        return template.opsForHash().get(HASH_NAME, key);
    }

    private void set(String key, Object value) {
        template.opsForHash().put(HASH_NAME, key, value);
    }
}
