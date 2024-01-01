<template>
  <MDBNavbar center
  expand="lg" light bg="light" position="top" 
  style="--mdb-bg-opacity: 0.7;" container>
    <MDBNavbarBrand link :to="{name: 'Home',hash:'#top'}">EndLib </MDBNavbarBrand>
    <!-- <MDBNavbarBrand class="pe-auto" @click="this.$router.push('/')">EndLib </MDBNavbarBrand> -->
    <MDBNavbarToggler @click="collapse1 = !collapse1" target="#navbarSupportedContent"></MDBNavbarToggler>
    <MDBCollapse v-model="collapse1" id="navbarSupportedContent">
      <MDBNavbarNav class="mb-2 mb-lg-0">
        <MDBNavbarItem :to="{name: 'Home',hash:'#top'}">Home</MDBNavbarItem>
        <!-- <MDBNavbarItem to="/">Home</MDBNavbarItem> -->
        <!--on click, run a method to push link to the AboutUs.vue-->
        <MDBNavbarItem :to="{name: 'Home', hash: '#About_Us'}">About Us</MDBNavbarItem>

        <MDBNavbarItem>
          <!-- Navbar dropdown -->
          <MDBDropdown class="nav-item" v-model="dropdown1">
            <MDBDropdownToggle tag="a" class="nav-link" @click="dropdown1 = !dropdown1">Services</MDBDropdownToggle>
            <MDBDropdownMenu aria-labelledby="dropdownMenuButton">
              <MDBDropdownItem to="/service">Search Book</MDBDropdownItem>
              <MDBDropdownItem to="/service">Rent Book</MDBDropdownItem>
              <MDBDropdownItem to="/working">Donate Book</MDBDropdownItem>
            </MDBDropdownMenu>
          </MDBDropdown>
        </MDBNavbarItem>


          <MDBNavbarItem :to="{name: 'Home', hash: '#Contact_Us'}">
            Contact Us
          </MDBNavbarItem>
      </MDBNavbarNav>


      <!--if the user is not logged in, use this-->
      <div v-if="!isLoggedIn">
        <MDBInput class="bg-white text-dark" inputGroup cd="4" type="search" placeholder="Username" aria-label="Search"
          v-model="emailInput" @keyup.enter="this.$refs.ModalLoginReg.ShowLogRegModal = true">
          <MDBBtn size="lg" color="primary" aria-controls="ShowLogRegModal"
            @click="this.$refs.ModalLoginReg.ShowLogRegModal = true">Login</MDBBtn>
        </MDBInput>
        <ModalLoginReg ref="ModalLoginReg" :emailInput="emailInput"/>
      </div>
      <!--if the user is logged in, use this-->
      <div v-else>
        <MDBNavbarNav class="mb-2 mb-lg-0 text-center">
          <MDBNavbarItem 
          :to="statePage" 
          >
         Welcome {{ this.$store.getters.getUserName }} back&#33;
        </MDBNavbarItem>
          <MDBDropdown v-model="dropdown3">
            <MDBDropdownToggle tag="a" class="nav-link" @click="dropdown3 = !dropdown3">
              <MDBIcon icon="user" />
            </MDBDropdownToggle>
            <MDBDropdownMenu>
              <MDBDropdownItem :to="{ name: 'UserDashBoard',params:{username: this.$store.getters.getUserName} }">My Book</MDBDropdownItem>
              <MDBDropdownItem :to="{name: 'UserAccount',params:{username: this.$store.getters.getUserName} }">My Account</MDBDropdownItem>
              <MDBDropdownItem divider />
              <MDBDropdownItem @click="logout" to="/">Log Out</MDBDropdownItem>
            </MDBDropdownMenu>
          </MDBDropdown>
        </MDBNavbarNav>
      </div>

    </MDBCollapse>
  </MDBNavbar>
</template>
<script>
import {
  MDBNavbar,
  MDBNavbarToggler,
  MDBNavbarBrand,
  MDBNavbarNav,
  MDBNavbarItem,
  MDBCollapse,
  MDBDropdown,
  MDBDropdownToggle,
  MDBDropdownMenu,
  MDBDropdownItem,
  MDBIcon,
  MDBBtn, MDBInput
} from 'mdb-vue-ui-kit';
import { ref} from 'vue';
import { mapState } from 'vuex'
//import ModalLoginForm from './ModalLoginForm.vue';
import ModalLoginReg from './ModalLoginReg.vue';
import emitter from '../../eventBus';
export default {
  components: {
    MDBNavbar,
    MDBNavbarToggler,
    MDBNavbarBrand,
    MDBNavbarNav,
    MDBNavbarItem,
    MDBCollapse,
    MDBDropdown,
    MDBDropdownToggle,
    MDBDropdownMenu,
    MDBDropdownItem,
    // ModalLoginForm,
    ModalLoginReg,
    MDBIcon,
    MDBBtn,
    MDBInput
  },
  computed: {
    ...mapState(['loginState']),
    statePage() {
      if (this.$store.state.loginState === 'admin') {
        return { name: 'Admin' };
      } else{
        // console.log(this.userName);
        return { name: 'UserDashBoard',params:{username: this.$store.getters.getUserName} };
      }
    }
  },
  data() {
    return {
      isLoggedIn: null,
    }
  },
  
  setup() {
    const collapse1 = ref(false);
    const dropdown1 = ref(false);
    const dropdown3 = ref(false);
    const emailInput = ref();
    
    // const isLoggedIn = computed(() => mapState(['loginState']) !== 'guest'); 
    return {
      collapse1,
      dropdown1,
      emailInput, // làm cái này nữa :V,
      dropdown3,
      // isLoggedIn
    }
  }
  
  ,
  methods: {
    checkState() {
      console.log(this.$store.state.loginState);
    },
    logout(){
      localStorage.clear();
      this.$store.dispatch("changeUsername", null);
      this.$router.push({ path: '/' });
      this.isLoggedIn = false;
    },
    loggedInSuccess() {
      console.log("NavBar hear that Logged in success");
      this.isLoggedIn = true;
      this.$forceUpdate();
    }
    
  },
  mounted() {
    this.isLoggedIn = this.loginState !== 'guest';
    //console.log(store.getters.getLoginState);
    // this.isLoggedIn = this.$store.getters.isLoggedIn;
    emitter.on('loggedInSuccess', this.loggedInSuccess);

    //Note for TOAN: Use getter, it's better. Quang.
    
  },
  beforeUnmount() {
    emitter.off('loggedInSuccess');
  }
};
</script>

<style>

</style>