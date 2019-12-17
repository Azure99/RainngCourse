package com.rainng.coursesystem.service.admin;

import com.rainng.coursesystem.manager.admin.DepartmentManager;
import com.rainng.coursesystem.model.entity.DepartmentEntity;
import com.rainng.coursesystem.model.vo.response.ResultVO;
import com.rainng.coursesystem.service.BaseService;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService extends BaseService {
    private final DepartmentManager manager;

    public DepartmentService(DepartmentManager manager) {
        this.manager = manager;
    }

    public ResultVO getPageCount(String name) {
        return result(manager.getPageCount(name));
    }

    public ResultVO getPage(Integer index, String name) {
        return result(manager.getPage(index, name));
    }

    public ResultVO get(Integer id) {
        DepartmentEntity entity = manager.get(id);
        if (entity == null) {
            return failedResult("系Id: " + id + "不存在!");
        }

        return result(entity);
    }

    public ResultVO update(DepartmentEntity entity) {
        if (manager.get(entity.getId()) == null) {
            return failedResult("系Id: " + entity.getId() + "不存在!");
        }

        manager.update(entity);
        return result("更新成功");
    }

    public ResultVO delete(Integer id) {
        if (manager.get(id) == null) {
            return failedResult("系Id: " + id + "不存在!");
        }
        if (manager.hasMajor(id)) {
            return failedResult("此系中还有专业未被删除");
        }
        if (manager.hasTeacher(id)) {
            return failedResult("此系中还有教师未被删除");
        }

        manager.delete(id);
        return result("删除成功");
    }

    public ResultVO create(DepartmentEntity entity) {
        if (manager.get(entity.getId()) != null) {
            return failedResult("系Id: " + entity.getId() + "已存在!");
        }

        manager.create(entity);
        return result("添加成功");
    }

    public ResultVO listName() {
        return result(manager.listName());
    }
}
