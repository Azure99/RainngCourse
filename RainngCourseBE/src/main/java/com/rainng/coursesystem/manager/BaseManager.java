package com.rainng.coursesystem.manager;

public class BaseManager {
    protected int calcPageCount(int recordCount, int pageSize) {
        if (recordCount % pageSize == 0) {
            return recordCount / pageSize;
        }

        return (recordCount / pageSize) + 1;
    }
}
