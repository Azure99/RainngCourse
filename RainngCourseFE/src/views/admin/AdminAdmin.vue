<template>
  <div class="admin-wrap">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-fa fa-id-badge"></i> 管理员管理
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div class="container">
      <div class="query-form">
        <el-row :gutter="20">
          <el-col :span="2">
            <el-button @click="create" icon="el-icon-plus">创建</el-button>
          </el-col>
        </el-row>
      </div>

      <div class="table">
        <el-table :data="tableData" stripe>
          <el-table-column label="管理员Id" prop="id" />
          <el-table-column label="管理员用户名" prop="username" />
          <el-table-column label="权限个数" prop="permission" />
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
          <el-form-item label="用户名">
            <el-input v-model="entityForm.username"></el-input>
          </el-form-item>
          <el-form-item label="权限">
            <el-checkbox-group v-model="priGroup">
              <el-checkbox label="1" name="priGroup">系管理</el-checkbox>
              <el-checkbox label="2" name="priGroup">专业管理</el-checkbox>
              <el-checkbox label="4" name="priGroup">班级管理</el-checkbox>
              <el-checkbox label="8" name="priGroup">学生管理</el-checkbox>
              <el-checkbox label="16" name="priGroup">教师管理</el-checkbox>
              <el-checkbox label="32" name="priGroup">课程管理</el-checkbox>
              <el-checkbox label="64" name="priGroup">选课修改</el-checkbox>
              <el-checkbox label="128" name="priGroup">管理员管理</el-checkbox>
            </el-checkbox-group>
          </el-form-item>
          <el-form-item label="密码">
            <el-input type="password" v-model="entityForm.password"></el-input>
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
import * as api from "../../api/admin/admin";
import Permission from "../../common/permission";

export default {
  name: "AdminAdmin",
  data() {
    return {
      entityForm: {},
      priGroup: [],
      tableData: [],
      editing: false
    };
  },
  methods: {
    getList() {
      api.list().then(res => {
        res = this.addPermissionProp(res);
        this.tableData = res;
      });
    },
    addPermissionProp(data) {
      for (let i = 0; i < data.length; i++) {
        let count = 0;
        for (let bit = 0; bit < Permission.permissionCount; bit++) {
          if (((1 << bit) & data[i].privilege) === 1 << bit) {
            count++;
          }
        }
        data[i].permission = count;
      }

      return data;
    },
    create() {
      this.priGroup = [];
      this.entityForm = {
        id: -1,
        username: "",
        privilege: "",
        password: ""
      };

      this.editing = true;
    },
    edit(id) {
      api.get(id).then(res => {
        this.setPriGroup(res);
        this.entityForm = res;
        this.editing = true;
      });
    },
    setPriGroup(data) {
      let group = [];
      for (let bit = 0; bit < Permission.permissionCount; bit++) {
        if (((1 << bit) & data.privilege) === 1 << bit) {
          group.push((1 << bit).toString());
        }
      }

      this.priGroup = group;
    },
    readPrivilegeFromGroup() {
      let privilege = 0;
      for (let i = 0; i < this.priGroup.length; i++) {
        privilege += parseInt(this.priGroup[i]);
      }
      return privilege;
    },
    save() {
      this.entityForm.privilege = this.readPrivilegeFromGroup();
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
      this.getList();
      this.editing = false;
    },
    deleteItem(id) {
      api.deleteItem(id).then(() => {
        this.$message.success("删除成功");
        this.getList();
      });
    }
  },
  created() {
    this.getList();
  }
};
</script>

<style scoped></style>
