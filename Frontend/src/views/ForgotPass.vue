<!-- chua co gi ca  -->
<template>
<MainNavBar/>
<ForgotPassComponent/>
<FooterMainPage class="Footer"/>
</template>

<script>
import MainNavBar from "@/components/Utilities/MainNavBar.vue";
import FooterMainPage from "@/components/Utilities/FooterMainPage.vue";
import ForgotPassComponent from "@/components/User/ForgotPass.vue";
export default{
    name: 'ForgotPass',
    components: {
        MainNavBar,
        FooterMainPage,ForgotPassComponent
    },
    setup() {
    }
}
</script>

<style scoped>
    /* .navbar {
    position: static !important;
} */
.working{
    text-align: center;
    margin-top: 100px; 
}
.Footer {
    display: block !important;
    /* position: fixed; */
    left: 0;
    bottom: 0;
    width: 100%;
}
</style>