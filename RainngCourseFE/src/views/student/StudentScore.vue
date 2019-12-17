<template>
  <div class="score-wrap">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-fa fa-newspaper-o"></i> 成绩查询
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div class="container">
      <div class="table">
        <el-table :data="tableData" stripe>
          <el-table-column label="选课Id" prop="studentCourseId" />
          <el-table-column label="课程名" prop="courseName" />
          <el-table-column label="教师" prop="teacherName" />
          <el-table-column label="学分" prop="credit" />
          <el-table-column label="日常成绩" prop="dailyScore" />
          <el-table-column label="考试成绩" prop="examScore" />
          <el-table-column label="总成绩" prop="score" />
        </el-table>
      </div>
    </div>
  </div>
</template>

<script>
import * as api from "../../api/student/course";

export default {
  name: "StudentScore",
  data() {
    return {
      tableData: []
    };
  },
  methods: {
    getList() {
      api.list().then(res => {
        this.tableData = this.scoreFilter(res);
      });
    },
    scoreFilter(data) {
      let filtered = [];
      for (let i = 0; i < data.length; i++) {
        let item = data[i];
        if (
          item.dailyScore != null ||
          item.examScore != null ||
          item.score != null
        ) {
          filtered.push(item);
        }
      }
      return filtered;
    }
  },
  created() {
    this.getList();
  }
};
</script>

<style scoped></style>
