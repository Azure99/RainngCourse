package com.rainng.coursesystem.manager;

import com.rainng.coursesystem.dao.redis.OptionDAO;
import org.springframework.stereotype.Component;

@Component
public class OptionManager extends BaseManager {
    private static final Boolean DEFAULT_ALLOW_STUDENT_SELECT = true;
    private static final Boolean DEFAULT_ALLOW_TEACHER_GRADE = true;
    private final OptionDAO optionDAO;

    public OptionManager(OptionDAO optionDAO) {
        this.optionDAO = optionDAO;
    }

    public Boolean getAllowStudentSelect() {
        Boolean res = optionDAO.getAllowStudentSelect();
        if (res == null) {
            optionDAO.setAllowStudentSelect(DEFAULT_ALLOW_STUDENT_SELECT);
            res = true;
        }
        return res;
    }

    public void setAllowStudentSelect(Boolean status) {
        optionDAO.setAllowStudentSelect(status);
    }

    public Boolean getAllowTeacherGrade() {
        Boolean res = optionDAO.getAllowTeacherGrade();
        if (res == null) {
            optionDAO.setAllowTeacherGrade(DEFAULT_ALLOW_TEACHER_GRADE);
            res = true;
        }
        return res;
    }

    public void setAllowTeacherGrade(Boolean status) {
        optionDAO.setAllowTeacherGrade(status);
    }
}
