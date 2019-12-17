<template>
  <div class="home-wrap">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-fa fa-id-badge"></i> 首页-山师教务要闻
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="main-wrap">
      <el-container class="home-container">
        <el-aside class="home-aside" width="65%">
          <el-table :data="tableData" stripe>
            <el-table-column
              align="center"
              label="日期"
              prop="date"
              width="120px"
            ></el-table-column>
            <el-table-column
              align="center"
              label="标题"
              prop="title"
            ></el-table-column>
            <el-table-column align="center" label="操作" width="120px">
              <template slot-scope="scope">
                <el-button
                  @click="openNews(scope.row.url)"
                  size="mini"
                  type="primary"
                  >查看
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-aside>
        <el-aside class="home-aside" width="35%">
          <div class="aside-container">
            <el-card :body-style="{ padding: '0px' }">
              <img class="aside-img" src="../assets/home-aside-img.png" />
              <div style="padding: 20px">
                <a
                  href="http://www.sdnu.edu.cn/bwcxljsm.htm"
                  style="text-decoration:none"
                  target="_blank"
                >
                  <div class="aside-title">
                    <b>“不忘初心、牢记使命”主题教育专题</b>
                  </div>
                  <div class="aside-content">
                    开展“不忘初心、牢记使命”主题教育，是以习近平同志为核心的党中央统揽伟大斗争、伟大工程、伟大事业、伟大梦想作出的重大部署
                    。 按照党中央决策部署和省委工作要求， 学校为第二批开展
                    “不忘初心、牢记使命” 主题...
                  </div>
                </a>
              </div>
            </el-card>
          </div>
        </el-aside>
      </el-container>
    </div>
  </div>
</template>

<script>
import * as api from "../api/news";

export default {
  name: "Home",
  data() {
    return {
      tableData: []
    };
  },
  methods: {
    query() {
      api.get().then(res => {
        this.tableData = res;
      });
    },
    openNews(url) {
      window.open(url, "_blank");
    }
  },
  created() {
    this.query();
  }
};
</script>

<style scoped>
.home-wrap {
  height: 100%;
  width: 100%;
}

.main-wrap {
  margin-top: 10px;
  height: 100%;
  width: 100%;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.home-container {
  height: 100%;
  width: 90%;
  margin: auto;
}

.home-aside {
  height: 100%;
}

.aside-container {
  width: 90%;
  margin-left: auto;
  margin-right: auto;
  height: 200px;
  margin-top: 20px;
}

.aside-img {
  width: 100%;
}

.aside-title {
  color: #333;
  font-size: 18px;
}

.aside-content {
  font-size: 12px;
  color: #999;
}
</style>
