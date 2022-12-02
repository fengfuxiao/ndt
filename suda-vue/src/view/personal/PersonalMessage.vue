<!-- @format -->

<template>
  <div class="personal-message">
    <el-skeleton :loading="skeletonLoading" animated>
      <!-- 骨架屏开始 -->
      <template slot="template">
        <div
          style="
            width: 100%;
            height: 500px;
            background-color: #fff;
            padding: 100px 0 0 40px;
            display: flex;
            flex-direction: column;
          "
        >
          <el-skeleton-item
            style="width: 30%; margin-bottom: 40px"
            variant="text"
          />
          <el-skeleton-item
            style="width: 30%; margin-bottom: 40px"
            variant="text"
          />
          <el-skeleton-item
            style="width: 40%; margin-bottom: 40px"
            variant="text"
          />
          <el-skeleton-item
            style="width: 40%; margin-bottom: 40px"
            variant="text"
          />
          <el-skeleton-item
            style="width: 50%; margin-bottom: 40px"
            variant="text"
          />
          <el-skeleton-item
            style="width: 50%; margin-bottom: 40px"
            variant="text"
          />
          <el-skeleton-item
            style="width: 60%; margin-bottom: 40px"
            variant="text"
          />
          <el-skeleton-item style="width: 60%" variant="text" />
        </div>
      </template>
      <!-- 骨架屏结束 -->
      <template>
        <el-card>
          <!-- 展示用户信息开始 -->
          <div v-if="!isEditPersonal">
            <div class="avatar">
              <el-avatar
                src="https://s1.ax1x.com/2022/10/19/xstyHP.jpg"
                :size="100"
              ></el-avatar>
            </div>
            <el-form ref="userInfo" :model="userInfo" label-width="80px">
              <el-form-item label="用户名">
                <span>{{ userInfo.username }}</span>
              </el-form-item>
              <el-form-item label="昵称">
                <span>{{ userInfo.nickname }}</span>
              </el-form-item>
              <el-form-item label="年龄">
                <span>{{ userInfo.age }}</span>
              </el-form-item>
              <el-form-item label="性别">
                <span>{{ userInfo.gender }}</span>
                <!-- <el-input v-model="userInfo.gender"></el-input> -->
              </el-form-item>
              <el-form-item label="地址">
                <span>{{ userInfo.address }}</span>
              </el-form-item>
              <el-form-item label="角色">
                <span>{{
                  (userInfo.r_id = userInfo.r_id === 1 ? "普通用户" : "管理员")
                }}</span>
              </el-form-item>
            </el-form>
          </div>
          <!-- 展示用户信息结束 -->
          <!-- 编辑用户信息开始 -->
          <div v-else>
            <!-- <el-upload
              class="avatar-uploader"
              action
              :http-request="handleUpload"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload"
            >
              <img v-if="imageUrl" :src="imageUrl" class="upavatar" />
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload> -->
            <el-form ref="userInfo" :model="userInfo" label-width="80px">
              <el-form-item label="用户名">
                <el-input v-model="userInfo.username"></el-input>
              </el-form-item>
              <el-form-item label="昵称">
                <el-input v-model="userInfo.nickname"></el-input>
              </el-form-item>
              <el-form-item label="年龄">
                <el-input v-model="userInfo.age"></el-input>
              </el-form-item>
              <el-form-item label="性别">
                <el-input v-model="userInfo.gender"></el-input>
              </el-form-item>
              <el-form-item label="地址">
                <el-input v-model="userInfo.address"></el-input>
              </el-form-item>
              <el-form-item label="角色">
                <span>{{
                  (userInfo.r_id = userInfo.r_id === 1 ? "普通用户" : "管理员")
                }}</span>
              </el-form-item>
            </el-form>
          </div>
          <!-- 编辑用户信息结束 -->
          <el-button type="primary" @click="onSaveMessage(userInfo)">{{
            isEditPersonal ? "保存" : "编辑用户信息"
          }}</el-button>
        </el-card>
      </template>
    </el-skeleton>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import { put, signatureUrl, getFileNameUUID } from "@/utils/upload.js";
import { updateUserInfo } from "@/api/user.js";
import { setToken, removeToken } from "@/utils/token.js";

export default {
  name: "PersonalMessage",
  data() {
    return {
      userInfo: {},
      // 是否编辑用户信息
      isEditPersonal: false,
      imageUrl: "",
      // 骨架屏加载
      skeletonLoading: true,
    };
  },
  methods: {
    ...mapMutations("userModule", ["setUser"]),
    ...mapMutations("userModule", ["removeUser"]),
    // 保存用户信息
    async onSaveMessage(userInfo) {
      // console.log("user=", userInfo)
      // 当前为编辑用户信息状态
      if (this.isEditPersonal) {
        const { data } = await updateUserInfo(userInfo);
        // console.log("data=", data);
        if (data.status === 0) {
          // this.setUser(data.token)
          this.$confirm("请重新登录", "提示", {
            confirmButtonText: "确定",
          }).then(() => {
            // this.removeUser();
            // this.setUser(data.token)
            setToken("username", userInfo.username)
            setToken("token", data.token)
            this.$router.push({
              path: "/main"
            })
            this.$message({
              type: "success",
              message: "更新成功",
            });
          });
        }
      }
      this.isEditPersonal = !this.isEditPersonal;
    },
    /**
     * 自定义上传方法
     */
    handleUpload(option) {
      // 获取文件的后缀名
      let objName = getFileNameUUID();
      var obj = option.file.name;
      // console.log("fileName=", option)
      var index = obj.lastIndexOf(".");
      obj = obj.substring(index, obj.length);
      // console.log("obj=", obj)
      // 生成的文件名，保留文件后缀名，进行拼接
      objName = getFileNameUUID() + obj;
      // console.log("objName=", objName)
      // 调用 ali-oss 中的方法,flieName是存放的文件夹名称，可自己定义
      put(`flieName/${objName}`, option.file).then((res) => {
        console.log(res);
        // 上传成功之后，转换真实的地址
        signatureUrl(`flieName/${objName}`).then((res) => {
          console.log("success=", res);
        });
      });
    },
    // 上传成功调用函数
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
    },
    // 上传之前调用函数
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
  },
  computed: {
    ...mapState("userModule", ["user"]),
  },
  mounted() {
    this.userInfo = this.user;
    setTimeout(() => {
      this.skeletonLoading = false;
    }, 1000);
  },
};
</script>

<style lang="less">
.personal-message .el-card__body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.personal-message .avatar {
  display: inline-block;
}
// 编辑用户
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.upavatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
