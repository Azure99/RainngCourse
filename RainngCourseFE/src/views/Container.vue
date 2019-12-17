<template>
  <div class="home">
    <head-bar />
    <side-bar />

    <div class="content-box">
      <div class="content" v-loading="this.$store.state.loading">
        <router-view />
        <el-backtop target=".content"></el-backtop>
      </div>
    </div>
  </div>
</template>

<script>
import { getLoginStatus } from "../api/user";
import SideBar from "../components/SideBar";
import HeadBar from "../components/HeadBar";
import UserType from "../common/userType";

export default {
  name: "Container",
  components: {
    HeadBar,
    SideBar
  },
  methods: {
    redirectHome(userType) {
      if (userType === UserType.student) {
        this.$router.push({ name: "student-home" });
      } else if (userType === UserType.teacher) {
        this.$router.push({ name: "teacher-home" });
      } else if (userType === UserType.admin) {
        this.$router.push({ name: "admin-home" });
      }
    }
  },
  created() {
    getLoginStatus().then(res => {
      this.$store.commit("login", res);
      if (!res.loggedIn) {
        this.$router.push({ name: "login" });
      } else if (this.$route.path === "/") {
        this.redirectHome(res.userType);
      }
    });
  }
};
</script>

<style scoped>
.content-box {
  position: absolute;
  left: 200px;
  right: 0;
  top: 70px;
  bottom: 0;
  background: #f0f0f0;
}

.content {
  width: auto;
  height: 100%;
  padding: 10px;
  overflow-y: scroll;
  box-sizing: border-box;
}
</style>
