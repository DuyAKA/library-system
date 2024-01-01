<template>

    <MainNav />
    <!--Top page with action button-->
    <div id="top">
    <ImgAndTitle   /> 
  </div>
    <!-- About Us - Our Vision - part-->
    <div id="About_Us">
    <AboutUs  />
    </div>
    <div id="Contact_Us">
    <ContactUs/>
  </div>
    <FooterMainPage/>
  </template>
  
  <script>
  import ImgAndTitle from '@/components/Home/ImgAndTitle.vue'
  import MainNav from "@/components/Utilities/MainNavBar.vue";
  import FooterMainPage from "@/components/Utilities/FooterMainPage.vue";
  import AboutUs from '@/components/Home/AboutUs.vue';
  import ContactUs from '@/components/Home/ContactUs.vue';
    // import ModalInform from '@/components/ModalInform.vue';
  // import ModalLoginForm from './components/ModalLoginForm.vue';
  export default {
    name: 'App',
    data() {
      return {
        
      }
    },
    components: {
    MainNav,
    ImgAndTitle,
    FooterMainPage,
    AboutUs,
    ContactUs
}
    
  }
  </script>
  
  <style>
  #app {
    font-family: Roboto, Helvetica, Arial, sans-serif;
  }
  </style>
  