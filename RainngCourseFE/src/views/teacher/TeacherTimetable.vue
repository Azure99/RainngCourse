<template>
  <div class="timetable-wrap">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-fa fa-table"></i> 教师课表
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div class="container">
      <time-table ref="timeTable"></time-table>
    </div>
  </div>
</template>

<script>
import * as api from "../../api/teacher/timetable";
import TimeTable from "../../components/TimeTable";

export default {
  name: "TeacherTimetable",
  components: { TimeTable },
  created() {
    api.get().then(res => {
      this.$refs.timeTable.updateData(res);
    });
  }
};
</script>

<style scoped></style>
