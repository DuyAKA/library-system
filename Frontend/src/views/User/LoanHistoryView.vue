<template>
    <CheckIfLoginVue />
    <MainNavBarVue />
    <div class="p-5 text-center bg-image" style="
          background-image: url(https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=773&q=80);
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
    <LoanHistoryVue id="table" />
    <FooterMainPage id="Footer" />
</template>

<script>
import LoanHistoryVue from '@/components/User/LoanHistory.vue';
import CheckIfLoginVue from '@/components/Checker/CheckIfLogin.vue';
import MainNavBarVue from '@/components/Utilities/MainNavBar.vue';
import FooterMainPage from '@/components/Utilities/FooterMainPage.vue';
export default {
    name: 'UserDashBoardView',
    components: {
        LoanHistoryVue,
        CheckIfLoginVue,
        MainNavBarVue,
        FooterMainPage        
    },
    computed: {
        UserName() {
            return this.$store.getters.getUserName;
        }
    }
}
</script>