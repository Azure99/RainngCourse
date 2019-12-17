<template>
  <div class="class-wrap">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-fa el-icon-fa fa-group"></i> 班级管理
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div class="container">
      <div class="query-form">
        <el-row :gutter="20">
          <el-col :span="2">
            <el-button @click="create" icon="el-icon-plus">创建</el-button>
          </el-col>
          <el-col :offset="10" :span="3">
            <el-input
              @keyup.enter.native="query"
              placeholder="班级名"
              v-model="queryForm.name"
            />
          </el-col>
          <el-col :span="3">
            <el-input
              @keyup.enter.native="query"
              placeholder="系名"
              v-model="queryForm.departmentName"
            />
          </el-col>
          <el-col :span="3">
            <el-input
              @keyup.enter.native="query"
              placeholder="专业名"
              v-model="queryForm.majorName"
            />
          </el-col>
          <el-col :span="3">
            <el-button @click="query" icon="el-icon-search" type="primary"
              >搜索
            </el-button>
          </el-col>
        </el-row>
      </div>

      <el-row justify="center" type="flex">
        <el-pagination
          :current-page.sync="pageIndex"
          :page-size="pageSize"
          :total="pageSize * pageCount"
          @current-change="getPage"
          background
          layout="prev, pager, next"
        >
        </el-pagination>
      </el-row>

      <div class="table">
        <el-table :data="tableData" stripe>
          <el-table-column label="班级Id" prop="id" />
          <el-table-column label="班级名" prop="name" />
          <el-table-column label="年级" prop="grade" />
          <el-table-column label="所属系" prop="departmentName" />
          <el-table-column label="所属专业" prop="majorName" />
          <el-table-column align="center" label="操作" width="200px">
            <template slot-scope="scope">
              <el-button @click="edit(scope.row.id)" size="mini" type="success"
                >编辑
              </el-button>
              <el-button
                @click="deleteItem(scope.row.id)"
                size="mini"
                type="danger"
                >删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

      <el-dialog :visible.sync="editing" title="编辑" width="30%">
        <el-form :model="entityForm" label-width="70px" ref="form">
          <el-form-item label="班级名">
            <el-input v-model="entityForm.name"></el-input>
          </el-form-item>
          <el-form-item label="年级">
            <el-input type="number" v-model="entityForm.grade"></el-input>
          </el-form-item>
          <el-form-item label="所属专业">
            <el-select placeholder="请选择专业" v-model="entityForm.majorId">
              <el-option
                :key="index"
                :label="item.name"
                :value="item.id"
                v-for="(item, index) in majors"
              />
            </el-select>
          </el-form-item>
        </el-form>
        <span class="dialog-footer" slot="footer">
          <el-button @click="save" type="primary">确 定</el-button>
          <el-button @click="editing = false">取 消</el-button>
        </span>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import * as api from "../../api/admin/class";
import * as majorApi from "../../api/admin/major";

export default {
  name: "AdminClass",
  data() {
    return {
      queryForm: {
        departmentName: "",
        majorName: "",
        name: ""
      },
      entityForm: {},
      tableData: [],
      pageSize: api.pageSize,
      pageCount: 1,
      pageIndex: 1,
      editing: false,
      majors: []
    };
  },
  methods: {
    query() {
      api
        .getPageCount(
          this.queryForm.departmentName,
          this.queryForm.majorName,
          this.queryForm.name
        )
        .then(res => {
          this.pageCount = res;
          this.pageIndex = 1;
          this.getPage(1);
        });
    },
    getPage(pageIndex) {
      api
        .getPage(
          pageIndex,
          this.queryForm.departmentName,
          this.queryForm.majorName,
          this.queryForm.name
        )
        .then(res => {
          this.tableData = res;
        });
    },
    create() {
      this.entityForm = {
        id: -1,
        name: "",
        grade: 2019,
        majorId: ""
      };
      this.editing = true;
    },
    edit(id) {
      api.get(id).then(res => {
        this.entityForm = res;
        this.editing = true;
      });
    },
    save() {
      if (this.entityForm.id === -1) {
        api.create(this.entityForm).then(() => {
          this.finishSave();
        });
      } else {
        api.update(this.entityForm).then(() => {
          this.finishSave();
        });
      }
    },
    finishSave() {
      this.$message.success("成功");
      this.getPage(this.pageIndex);
      this.editing = false;
    },
    deleteItem(id) {
      api.deleteItem(id).then(() => {
        this.$message.success("删除成功");
        this.getPage(this.pageIndex);
      });
    },
    getMajors() {
      majorApi.listName().then(res => {
        this.majors = res;
      });
    }
  },
  created() {
    this.query();
    this.getMajors();
  }
};
</script>

<style scoped></style>
