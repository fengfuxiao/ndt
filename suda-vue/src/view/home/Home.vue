<!-- @format -->

<template>
  <div class="home">
    <!-- <div class="top"></div> -->
    <el-skeleton :loading="skeletonLoading" animated>
      <template slot="template">
        <div style="margin-bottom: 20px; display: flex">
          <div
            style="
              display: flex;
              flex-direction: column;
              width: 280px;
              height: 100px;
              margin-right: 20px;
              padding: 20px 0 0 20px;
              background-color: #fff;
            "
          >
            <el-skeleton-item
              style="width: 50%; margin-bottom: 20px"
              variant="text"
            />
            <el-skeleton-item style="width: 80%" variant="text" />
          </div>
          <div
            style="
              display: flex;
              flex-direction: column;
              width: 280px;
              margin-right: 20px;
              padding: 20px 0 20px 20px;
              background-color: #fff;
            "
          >
            <el-skeleton-item
              style="width: 50%; margin-bottom: 20px"
              variant="text"
            />
            <el-skeleton-item style="width: 80%" variant="text" />
          </div>
          <div
            style="
              display: flex;
              flex-direction: column;
              width: 280px;
              margin-right: 20px;
              padding: 20px 0 20px 20px;
              background-color: #fff;
            "
          >
            <el-skeleton-item
              style="width: 50%; margin-bottom: 20px"
              variant="text"
            />
            <el-skeleton-item style="width: 80%" variant="text" />
          </div>
          <div
            style="
              display: flex;
              flex-direction: column;
              width: 280px;
              padding: 20px 0 20px 20px;
              background-color: #fff;
            "
          >
            <el-skeleton-item
              style="width: 50%; margin-bottom: 20px"
              variant="text"
            />
            <el-skeleton-item style="width: 80%" variant="text" />
          </div>
        </div>
        <div style="display: flex">
          <div
            style="
              display: flex;
              flex-direction: column;
              justify-content: space-around;
              width: 480px;
              height: 440px;
              margin-right: 20px;
              padding: 20px 0 20px 20px;
              background-color: #fff;
            "
          >
            <el-skeleton-item style="width: 40%" variant="text" />
            <el-skeleton-item style="width: 50%" variant="text" />
            <el-skeleton-item style="width: 60%" variant="text" />
            <el-skeleton-item style="width: 70%" variant="text" />
            <el-skeleton-item style="width: 80%" variant="text" />
            <el-skeleton-item style="width: 80%" variant="text" />
            <el-skeleton-item style="width: 80%" variant="text" />
          </div>
          <div
            style="
              display: flex;
              flex-direction: column;
              justify-content: space-around;
              width: 680px;
              height: 440px;
              margin-bottom: 20px;
              padding: 20px 0 20px 20px;
              background-color: #fff;
            "
          >
            <el-skeleton-item style="width: 40%" variant="text" />
            <el-skeleton-item style="width: 50%" variant="text" />
            <el-skeleton-item style="width: 60%" variant="text" />
            <el-skeleton-item style="width: 70%" variant="text" />
            <el-skeleton-item style="width: 80%" variant="text" />
            <el-skeleton-item style="width: 80%" variant="text" />
            <el-skeleton-item style="width: 80%" variant="text" />
          </div>
        </div>
        <div
          style="
            width: 100%;
            height: 440px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            background-color: #fff;
            padding: 20px 0 0 20px;
          "
        >
          <el-skeleton-item style="width: 30%" variant="text" />
          <el-skeleton-item style="width: 50%" variant="text" />
          <el-skeleton-item style="width: 60%" variant="text" />
          <el-skeleton-item style="width: 80%" variant="text" />
          <el-skeleton-item style="width: 80%" variant="text" />
        </div>
      </template>
      <template>
        <!-- top???????????? -->
        <el-row :gutter="20" class="card-top">
          <el-col :span="6" v-for="(card, index, l) in panelList" :key="index">
            <el-card shadow="hover">
              <div class="panel">
                <div :class="'card-left' + l">
                  <i :class="card.icon" class="panel-icon"></i>
                </div>
                <div class="card-right">
                  <span class="panel-title">{{ card.title }}</span>
                  <span class="panel-count">{{ card.count }}</span>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
        <!-- top???????????? -->

        <!-- middle???????????? -->
        <el-row :gutter="20" class="card-middle">
          <el-col :span="10" class="user-source">
            <el-card shadow="hover">
              <PieEchart />
            </el-card>
          </el-col>
          <el-col :span="14" class="user-active">
            <el-card shadow="hover">
              <BarEchart />
            </el-card>
          </el-col>
        </el-row>
        <!-- middle???????????? -->

        <!-- bottom?????? -->
        <el-row class="card-bottom">
          <el-col :span="24" class="ys-count">
            <el-card shadow="hover">
              <CategoryEchart />
            </el-card>
          </el-col>
        </el-row>
        <!-- bottom?????? -->
      </template>
    </el-skeleton>
  </div>
</template>

<script>
import PieEchart from "../../components/common/echarts/PieEchart.vue";
import BarEchart from "../../components/common/echarts/BarEchart.vue";
import CategoryEchart from "../../components/common/echarts/CategoryEchart.vue";
import { getAllUser, getAllWuLiu, getAllNetPoint } from "../../api/user.js";
import { getAllAnnouncement } from "../../api/announcement.js";

export default {
  name: "Home",
  components: { PieEchart, BarEchart, CategoryEchart },
  data() {
    return {
      announcementCount: 0, // ????????????
      wuliuCount: 0, // ????????????
      netpointCount: 0, // ????????????
      useraddressList: [],
      // ?????????
      skeletonLoading: true,
      // ??????????????????
      panelList: {
        user: {
          icon: "",
          title: "",
          count: 0,
        },
        announcement: {
          icon: "",
          title: "",
          count: 0,
        },
        wuliu: {
          icon: "",
          title: "",
          count: 0,
        },
        netpoint: {
          icon: "",
          title: "",
          count: 0,
        },
      },
    };
  },
  computed: {},
  async mounted() {
    // ??????????????????
    const userData = await getAllUser();
    if (userData.data.status === 0) {
      this.panelList.user.title = "????????????";
      this.panelList.user.count = userData.data.data.count;
      this.panelList.user.icon = "fa fa-users";
    }
    // ??????????????????
    const announcementData = await getAllAnnouncement();
    if (announcementData.data.status === 0) {
      this.panelList.announcement.title = "????????????";
      this.panelList.announcement.count = announcementData.data.data.count;
      this.panelList.announcement.icon = "fa fa-commenting";
    }
    // ??????????????????
    const wuliuData = await getAllWuLiu();
    if (wuliuData.data.status === 0) {
      this.panelList.wuliu.title = "????????????";
      this.panelList.wuliu.count = wuliuData.data.data.count;
      this.panelList.wuliu.icon = "fa fa-truck";
    }
    // ????????????????????????
    const netpointData = await getAllNetPoint();
    if (netpointData.data.status === 0) {
      this.panelList.netpoint.title = "????????????";
      this.panelList.netpoint.count = netpointData.data.data.count;
      this.panelList.netpoint.icon = "fa fa-map-marker";
    }
    setTimeout(() => {
      this.skeletonLoading = false;
    }, 1000);
  },
};
</script>

<style scoped lang="less">
.home {
  .card-top,
  .card-middle {
    margin-bottom: 20px;
  }
  // ??????panel??????????????????
  .panel {
    display: flex;
    justify-content: space-between;
    .card-left0,
    .card-left1,
    .card-left2,
    .card-left3 {
      // background-color: gray;
      height: 100%;
      .panel-icon {
        font-size: 40px;
        padding: 20px;
        border-radius: 6px;
        transition: all 0.2s;
      }
      .panel-icon:hover {
        transition: all 0.4s;
        transform: scale(1.1);
      }
    }
    .card-left0 .panel-icon {
      color: #41c8c6;
    }
    .card-left0 .panel-icon:hover {
      background-color: #41c8c6;
      color: #fff;
    }
    .card-left1 .panel-icon {
      color: #36a3f6;
    }
    .card-left1 .panel-icon:hover {
      background-color: #36a3f6;
      color: #fff;
    }
    .card-left2 .panel-icon {
      color: #f5516d;
    }
    .card-left2 .panel-icon:hover {
      background-color: #f5516d;
      color: #fff;
    }
    .card-left3 .panel-icon {
      color: #73c0dd;
    }
    .card-left3 .panel-icon:hover {
      background-color: #73c0dd;
      color: #fff;
    }
    .card-right {
      display: flex;
      flex-direction: column;
      justify-content: space-around;
      align-items: center;
      .panel-title {
        color: #6a7281;
        font-size: 16px;
      }
      .panel-count {
        font-size: 20px;
        font-weight: 700;
      }
    }
  }
  // ??????panel??????????????????

  // ??????????????????????????????
  .user-source {
    .chart {
      height: 400px;
    }
  }
  .user-active {
    .chart {
      height: 400px;
    }
  }
  // ??????????????????????????????

  // ??????????????????????????????????????????
  .ys-count {
    .chart {
      height: 400px;
    }
  }
  // ??????????????????????????????????????????
}
</style>
