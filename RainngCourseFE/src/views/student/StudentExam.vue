<template>
  <div class="exam-wrap">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-fa fa-eye"></i> 考试查询
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div class="container">
      <div class="table">
        <el-table :data="tableData" stripe>
          <el-table-column label="选课Id" prop="studentCourseId" />
          <el-table-column label="课程名" prop="courseName" />
          <el-table-column label="教师" prop="teacherName" />
          <el-table-column label="考试日期" prop="examDate" />
          <el-table-column label="考试地点" prop="examLocation" />
        </el-table>
      </div>
    </div>
  </div>
</template>

<script>
import * as api from "../../api/student/exam";

export default {
  name: "StudentExam",
  data() {
    return {
      tableData: []
    };
  },
  methods: {
    getList() {
      api.list().then(res => {
        this.tableData = res;
      });
    }
  },
  created() {
    this.getList();
  }
};
</script>

<style scoped></style>
