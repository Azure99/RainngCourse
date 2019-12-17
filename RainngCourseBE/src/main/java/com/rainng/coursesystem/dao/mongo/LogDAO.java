package com.rainng.coursesystem.dao.mongo;

import com.rainng.coursesystem.model.entity.mongo.LogEntity;
import org.springframework.stereotype.Repository;

@Repository
public class LogDAO {
    private final LogRepository repository;

    public LogDAO(LogRepository repository) {
        this.repository = repository;
    }

    public void insert(LogEntity entity) {
        repository.insert(entity);
    }
}
