import { createWebHistory, createRouter } from "vue-router";
import Home from "@/views/HomePage.vue";
import AdminPageVue from "@/views/AdminPage.vue";
import servicePage from "@/views/ServicePage.vue";
import ForgotPass from "@/views/ForgotPass.vue";
import testPage from "@/views/TestPage.vue";
import UserDashBoardVue from "@/views/User/UserDashBoardView.vue";
import MyAccount from "@/views/User/MyAccount.vue";
import store from "../store.js";
import LoanHistory from "@/views/User/LoanHistoryView.vue";
import NotFound from "@/views/NotFound.vue";
import WorkingVue from "@/views/WorkingView.vue";
const routes = [

  {
    path: "/",
    name: "Home",
    component: Home,
  },

  {
    path: "/admin",
    name: "Admin",
    component: AdminPageVue,
  },
  {
    path: "/service",
    name: "Service",
    component: servicePage,
  },
  {
    path: "/forgot-password",
    name: "ForgotPass",
    component: ForgotPass,
  },
  {
    path: "/test",
    name: "test",
    component: testPage,
  },
  {
    path: "/working",
    name: "Working",
    component: WorkingVue,
  },
  {
    path: "/user/:username/DashBoard",
    name: "UserDashBoard",
    component: UserDashBoardVue,
  },
  {
    path: "/user/:username/",
    name: "UserAccount",
    component: MyAccount,
  }
  ,
  {
    path: "/user/:username/loan-history",
    name: "LoanHistory",
    component: LoanHistory,
  }
  ,
  {
    path: '/:pathMatch(.*)*',
    name: 'NotFound',
    component: NotFound
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
  //eslint-disable-next-line
  scrollBehavior(to, from, savedPosition) {
    if (to.hash) {
      return {
        el: to.hash,
        top: 50,
      }
    }
  }
});

router.beforeEach(async (to, from, next) => {
  await store.dispatch('fetchLoginState');
  next();
});

export default router;

