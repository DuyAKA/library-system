<template>
    <MainNavBar id="navbar"/>
    <div class="NotFound">
        <div class="d-flex justify-content-center text-center align-items-center vh-100">
        <div class="row">
            <div class="col-md-12">
            <h1>404 Not Found</h1>
            <p>Sorry, an error has occured, Requested page not found!</p>
            <router-link to="/" class="btn btn-primary">Back to Home</router-link>
            </div>
        </div>
        </div>
    </div>
    <FooterMainPage id="Footer"/>

</template>
<script>
    
import MainNavBar from '@/components/Utilities/MainNavBar.vue';
import FooterMainPage from '@/components/Utilities/FooterMainPage.vue';
export default {
    name: 'NotFound',
    components: {
        MainNavBar,FooterMainPage
    }
}
</script>
<style scoped>
.navbar {
    position: static !important;
}
.Footer {
    position: static !important;
}
</style>