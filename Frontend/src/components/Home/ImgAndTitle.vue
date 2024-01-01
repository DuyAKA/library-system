<template>
  <!-- Background image -->
  <div class="p-5 text-center bg-image hover-zoom" style="
          background-image: url(https://www.usnews.com/cmsmedia/23/02/a1a88058409d8bc02755e6ae8bfa/200825-studyingbook-stock.jpg);
          height: 100vh;
        ">
    <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
      <div class="d-flex justify-content-center align-items-center h-100">
        <div class="text-white">
          <h1 class="mb-3 display-2"><strong>Welcome To Your Personal Library Of </strong><hr><strong>Endless Possibilities.</strong></h1>
          <h6 class="mb-3 ">Join a community of passionate readers.</h6>
          <div class="text-dark">
            
            <MDBBtn v-if="!state" size="lg" color="primary" aria-controls="ShowLogRegModal" @click="this.$refs.ModalLoginReg.ShowLogRegModal = true">Join Us Now&#33;</MDBBtn>
            <router-link v-else to="/service">
              <MDBBtn  to="/service" size="lg" color="primary">Explore Now!</MDBBtn>
            </router-link>
            <ModalLoginReg ref="ModalLoginReg"></ModalLoginReg>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Background image -->



</template>

<script>
import { MDBBtn } from "mdb-vue-ui-kit";
import ModalLoginReg from "../Utilities/ModalLoginReg.vue";
export
  default {
    name: "ImgAndTitle",
    components: {
    ModalLoginReg,MDBBtn
}, 
computed: {
  state(){
    return this.$store.getters.isLoggedIn;
  }}}


</script>

<style>

</style>