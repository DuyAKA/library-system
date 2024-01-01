<template>
    <CheckIfLoginVue />
    <MainNavBar />
    <div class="p-5 text-center bg-image" style="
          background-image: url(https://images.unsplash.com/photo-1516979187457-637abb4f9353?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80);
          height: 50vh;
        ">
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="text-white">
                    <h1 class="display-4">Welcome {{ UserName }} back&#33;
                    </h1>
                </div>
            </div>
        </div>
    </div>
    <UserDashBoard id="table" />
    <FooterMainPage id="Footer" />
</template>
<script>
import MainNavBar from "@/components/Utilities/MainNavBar.vue";
import FooterMainPage from "@/components/Utilities/FooterMainPage.vue";
import CheckIfLoginVue from '@/components/Checker/CheckIfLogin.vue'
import UserDashBoard from '@/components/User/UserDashBoard.vue';
export default {
    name: 'UserDashBoardView',
    components: {
        MainNavBar,
        FooterMainPage,
        CheckIfLoginVue,
        UserDashBoard
    },
    computed: {
        UserName() {
            return this.$store.getters.getUserName;
        }
    }


}
</script>
<style scoped>
/* .navbar {
    position: static !important;
} */

#table {
    display: block !important;
}

#Footer {
    display: block !important;
    /* position: fixed; */
    left: 0;
    bottom: 0;
    width: 100%;
}
</style>