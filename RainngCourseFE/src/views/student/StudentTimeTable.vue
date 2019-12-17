<template>
  <div class="timetable-wrap">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-fa fa-table"></i> 课表查询
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div class="container">
      <time-table ref="timeTable"></time-table>
    </div>
  </div>
</template>

<script>
import * as api from "../../api/student/timetable";
import TimeTable from "../../components/TimeTable";

export default {
  name: "StudentTimeTable",
  components: { TimeTable },
  created() {
    api.get().then(res => {
      this.$refs.timeTable.updateData(res);
    });
  }
};
</script>

<style scoped></style>
