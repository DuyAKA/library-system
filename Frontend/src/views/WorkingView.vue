<template>
<MainNavBar/>
<div class="p-5 bg-image" style="
          background-image: url(https://images.unsplash.com/photo-1606056041654-f203e0351229?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80);
          height: 100vh;
        ">
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
<div class="d-flex justify-content-center align-items-center h-100">
    <div class="text-white">
    <h1 style="background-color: rgba(0, 0, 0, 0.121);">
        This function is currently under development, please comeback later!
    </h1>
</div>
</div>
</div>
</div>
<FooterMainPageVue/>
</template>

<script>
import MainNavBar from '@/components/Utilities/MainNavBar.vue';
import FooterMainPageVue from '@/components/Utilities/FooterMainPage.vue';
export default {
    name: "WorkingView",
    components: {
        MainNavBar,
        FooterMainPageVue
    }
}
</script>
