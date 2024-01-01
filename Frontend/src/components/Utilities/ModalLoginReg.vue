<template>
  <div>
    <!-- <MDBBtn  size="lg" color="primary" aria-controls="ShowLogRegModal" @click="ShowLogRegModal = true">{{ regBtnName }}</MDBBtn> -->
    <MDBModal id="ShowLogRegModal" v-model="ShowLogRegModal">
      <MDBTabs v-model="form7ActiveTab">
        <MDBModalBody>
          <!-- Tabs navigation -->
          <MDBTabNav pills justify tabsClasses="mb-3">
            <MDBTabItem tabId="form7-login" href="form7-login">Login</MDBTabItem>
            <MDBTabItem tabId="form7-register" href="form7-register">Register</MDBTabItem>
          </MDBTabNav>
          <!-- Tabs navigation -->
          <!-- Tabs content -->
          <MDBTabContent  v-on:keyup.enter="lazyEnter">

            <MDBTabPane tabId="form7-login">
              <form> <!--login form-->
                <div class="text-center mb-3">
                  <p>Sign in with:</p>
                  <MDBBtn color="secondary" floating class="mx-1" v-on:click="working">
                    <MDBIcon iconStyle="fab" icon="facebook-f" />>
                  </MDBBtn>

                  <MDBBtn color="secondary" floating class="mx-1" v-on:click="working">
                    <MDBIcon iconStyle="fab" icon="google" />
                  </MDBBtn>

                  <MDBBtn color="secondary" floating class="mx-1" v-on:click="working">
                    <MDBIcon iconStyle="fab" icon="twitter" />
                  </MDBBtn>

                  <MDBBtn color="secondary" floating class="mx-1" v-on:click="working">
                    <MDBIcon iconStyle="fab" icon="github" />
                  </MDBBtn>
                </div>

                <p class="text-center">or:</p>
                <p v-show="form7LoginCheck" class="note note-danger">
                  <strong>Warning: </strong>Username or password are not correct, please try again!
                </p>
                <p v-show="form1LoginState" class="note note-danger">
                  <strong>Warning: </strong>Please Login First or <router-link :to="{ name: 'Home' }">Go back to Home Page</router-link>
                </p>
                <!-- Email input -->
                <MDBInput type="email" label="User Name" id="form7LoginEmail" v-model="form7LoginEmail"
                  wrapperClass="mb-4" />

                <!-- Password input -->
                <MDBInput type="password" label="Password" id="form7LoginPassword" v-model="form7LoginPassword"
                  wrapperClass="mb-4" />

                <!-- 2 column grid layout for inline styling -->
                <MDBRow class="mb-4 d-flex justify-content-between">
                  <MDBCol class="md-8 ">
                    <!-- Checkbox -->
                    <MDBCheckbox label="Remember me" id="form7LoginCheck" v-model="form7LoginCheck"
                      wrapperClass="mb-3 mb-md-0" />
                  </MDBCol>

                  <MDBCol class="md-8 ">
                    <!-- Simple link -->
                    <router-link :to="{ name: 'ForgotPass' }">Forgot Password ?</router-link>
                  </MDBCol>
                </MDBRow>

                <!-- Submit button -->
                <MDBBtn color="primary" block class="mb-4" @click="login">
                  Sign in
                </MDBBtn>

                <!-- Register buttons -->
                <div class="text-center">
                  <p>Not a member?<a style="cursor: pointer;" class="text-primary" @click="this.form7ActiveTab = 'form7-register'">Register</a>
                  </p>
                  
                </div>
              </form>
            </MDBTabPane>
            <MDBTabPane tabId="form7-register">
              <form novalidate @submit.prevent="checkForm" ><!--reg form-->
                <div class="text-center mb-3">
                  <p>Sign up with:</p>
                  <MDBBtn color="secondary" floating class="mx-1" v-on:click="working">
                    <MDBIcon iconStyle="fab" icon="facebook-f" />
                  </MDBBtn>

                  <MDBBtn color="secondary" floating class="mx-1" v-on:click="working">
                    <MDBIcon iconStyle="fab" icon="google" />
                  </MDBBtn>

                  <MDBBtn color="secondary" floating class="mx-1" v-on:click="working">
                    <MDBIcon iconStyle="fab" icon="twitter" />
                  </MDBBtn>

                  <MDBBtn color="secondary" floating class="mx-1" v-on:click="working">
                    <MDBIcon iconStyle="fab" icon="github" />
                  </MDBBtn>
                </div>

                <p class="text-center">or:</p>
                <p v-show="form7AllFilledCheck" class="note note-danger">
                  <strong>Warning: </strong>Please fill out all fields!
                </p>
                <p v-show="form7PasswordLengthCheck" class="note note-danger">
                  <strong>Warning: </strong>Password must be greater than 5 characters!
                </p>
                <p v-show="form7PasswordMatchCheck" class="note note-danger">
                  <strong>Warning: </strong>Passwords do not match!
                </p>
                <p v-show="form7EmailCheck" class="note note-danger">
                  <strong>Warning: </strong>Email is not valid!
                </p>
                <p v-show="form7SameUsername" class="note note-danger">
                  <strong>Warning: </strong>Username already existed!
                </p>
                <MDBRow >
                  <MDBCol col="7">
                    <!-- Family Name input -->
                    <MDBInput type="text" label="FamilyName" id="form7RegisterFamilyName"
                      v-model="form7RegisterFamilyName"
                      invalidFeedback="Please provide your first name" required
                      wrapperClass="mb-4" />
                  </MDBCol>
                  <MDBCol col="5">
                    <!-- First Name input -->
                    <MDBInput type="text" label="FirstName" id="form7RegisterFirstName" v-model="form7RegisterFirstName" 
                      invalidFeedback="Please provide your last name" required
                      wrapperClass="mb-4" />
                  </MDBCol>
                </MDBRow>
                <!-- Username input -->
                <MDBInput type="text" label="Username" id="form7RegisterUsername" v-model="form7RegisterUsername"
                      invalidFeedback="Please provide your username" validFeedback="Looks good!" required
                  wrapperClass="mb-4" />

                <!-- Email input -->
                <MDBInput type="email" label="Email" id="form7RegisterEmail" v-model="form7RegisterEmail"
                      :class="{ 'is-invalid': !validateEmail(form7RegisterEmail) && form7RegisterEmail !== '' }"
                      invalidFeedback="Please provide your email" required
                  wrapperClass="mb-4" />
                <!-- Password input -->
                <MDBInput type="password" label="Password" id="form7RegisterPassword" v-model="form7RegisterPassword"
                      invalidFeedback="Please provide your password" required
                  wrapperClass="mb-4" />
                <!-- <div v-if="form7RegisterPasswordError">{{ form7RegisterPasswordError }}</div> -->

                <!-- Repeat Password input -->
                <MDBInput type="password" label="Repeat password" id="form7RegisterPasswordRepeat"
                  v-model="form7RegisterPasswordRepeat"
                  invalidFeedback="Passwords do not match" required
                   wrapperClass="mb-4" />

                <!-- Checkbox -->
                <MDBCheckbox label="I have read and agree to the terms" id="form7RegsiterTermsCheck"
                  v-model="form7RegsiterTermsCheck" wrapperClass="d-flex justify-content-center mb-4" />

                <!-- Submit button -->
                <MDBBtn id="Register" color="primary" block class="mb-3" type="submit" @click="handleRegister">
                  Register
                </MDBBtn>
              </form>
            </MDBTabPane>
          </MDBTabContent>
          <!-- Tabs content -->
        </MDBModalBody>
      </MDBTabs>

    </MDBModal>
  </div>
</template>
<script>
import {
  MDBInput,
  MDBCheckbox,
  MDBBtn,
  MDBTabs,
  MDBTabNav,
  MDBTabContent,
  MDBTabItem,
  MDBTabPane,
  MDBIcon, MDBModal, MDBCol,
  // MDBModalHeader,
  MDBModalBody,
  MDBRow
} from "mdb-vue-ui-kit";
import {
  ref,
  watch
} from "vue";
import axios from 'axios';
import emitter from "../../eventBus";



export default {
  name: "ModalLoginRegister",
  components: {
    MDBInput,
    MDBCheckbox,
    MDBBtn,
    MDBTabs,
    MDBTabNav,
    MDBTabContent,
    MDBTabItem,
    MDBTabPane,
    MDBIcon,
    MDBModal,
    // MDBModalHeader,
    MDBModalBody, MDBCol, MDBRow
  },
  data() {
    return {
      isAdmin: false,
      ShowLogRegModal: false,
    };
  },
  props: {
    form1LoginState: {
      type: Boolean,
      default: false
    }
    ,
    regBtnName: {
      type: String,
      default: "Login"
    },
    emailInput: {
      type: String,
      default: ""
    },
  },
  setup(props) {

    const checkForm = e => {
        e.target.classList.add("was-validated");
      };
    const form7ActiveTab = ref("form7-login");
    const form7LoginEmail = ref(props.emailInput);
    const form7LoginPassword = ref("");
    const form7LoginCheck = ref(false);
    const form7AllFilledCheck = ref(false);
    const form7PasswordLengthCheck = ref(false);
    const form7PasswordMatchCheck = ref(false);
    const form7EmailCheck= ref(false);
    const form7SameUsername= ref(false);
    const form7RegisterFamilyName = ref("");
    const form7RegisterFirstName = ref("");
    const form7RegisterUsername = ref("");
    const form7RegisterEmail = ref(props.emailInput);
    const form7RegisterPassword = ref("");
    const form7RegisterPasswordError = ref("");
    const form7RegisterPasswordRepeat = ref("");
    const form7RegsiterTermsCheck = ref(true);
    watch(() => props.emailInput, (newVal) => {
      form7LoginEmail.value = newVal;
      form7RegisterUsername.value = newVal;
    });
    return {
      form7ActiveTab,
      form7LoginEmail,
      form7LoginPassword,
      form7LoginCheck,
      form7AllFilledCheck,
      form7PasswordLengthCheck,
      form7PasswordMatchCheck,
      form7EmailCheck,
      form7SameUsername,
      form7RegisterFamilyName,
      form7RegisterFirstName,
      form7RegisterUsername,
      form7RegisterEmail,
      form7RegisterPassword,
      form7RegisterPasswordError,
      form7RegisterPasswordRepeat,
      form7RegsiterTermsCheck,
      checkForm
    };
  }
  ,
  methods: {

    validateEmail(email) {
    // Regular expression to validate email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    // if(emailRegex.test(email)){
    //   this.form7EmailCheck = true;
    // }
    return emailRegex.test(email);
  },

    lazyEnter(){
      if(this.form7ActiveTab == "form7-login"){
        this.login();
      }
      if(this.form7ActiveTab == "form7-register"){
        this.handleRegister();
      }
    }
    ,
    checkState() {
      console.log(this.$store.state.loginState);
    },
    working() {
      this.$router.push("/working");
    },
    async handleRegister() {

      // Check if any of the input fields are null
      if (
        !this.form7RegisterFamilyName ||
        !this.form7RegisterFirstName ||
        !this.form7RegisterUsername ||
        !this.form7RegisterEmail ||
        !this.form7RegisterPassword ||
        !this.form7RegisterPasswordRepeat
      ) {
        this.form7AllFilledCheck = true;
        this.form7PasswordLengthCheck = false;
        this.form7PasswordMatchCheck = false;
        this.form7EmailCheck = false;
        return;
      }

      // Check if the password length is less than 5
      if (this.form7RegisterPassword.length < 5) {
        this.form7AllFilledCheck = false;
        this.form7PasswordLengthCheck = true;
        this.form7PasswordMatchCheck = false;
        this.form7EmailCheck = false;
        return;
      }

      
      // Check if the password and password repeat fields are identical
      if (this.form7RegisterPassword !== this.form7RegisterPasswordRepeat) {
        this.form7AllFilledCheck = false;
        this.form7PasswordLengthCheck = false;
        this.form7PasswordMatchCheck = true;
        this.form7EmailCheck = false;
        return;
      }

       // Check if email is valid
       if (!this.validateEmail(this.form7RegisterEmail)) {
        this.form7AllFilledCheck = false;
        this.form7PasswordLengthCheck = false;
        this.form7PasswordMatchCheck = false;
        this.form7EmailCheck = true;
        return;
      }  
      
        try {


          const response = await axios.post(this.$store.state.serverRoot + '/api/member/reg/',
            {
              username: this.form7RegisterUsername,
              password: this.form7RegisterPassword,
              first_name: this.form7RegisterFirstName,
              last_name: this.form7RegisterFamilyName,
              email: this.form7RegisterEmail
            }).catch(err => {
              console.log(err.response.status);
              if(err.response.status == 500){
                this.form7SameUsername = true;
              }
            });


          console.log(response)
          const token = response.data.token;
          localStorage.setItem('token', token);

          this.form7ActiveTab = "form7-login";
        } catch (error) {
          this.form7LoginCheck = true;
          localStorage.setItem("error", "1");
        }


    },

    async login() {
      try {
        const response = await axios.post(this.$store.state.serverRoot + '/api/member/auth/',
          {
            username: this.form7LoginEmail,
            password: this.form7LoginPassword
          });

        const token = response.data.token;

        if (token) {

          localStorage.setItem('token', token);

          await this.$store.dispatch("changeUsername", this.form7LoginEmail)
          console.log(this.$store.getters.getUserName);

          // this.form1LoginCheck = false;
          // this.showLoginModal = false;
          emitter.emit('loggedInSuccess');
          if (this.form7RegisterEmail == 'admin') {
            this.$store.state.loginState = "admin";
            this.$router.push({ name: 'Admin' });
          }
          else {
            this.$store.state.loginState = "user";
            // this.$router.push({ name: 'Service' });
            this.$router.push({path: '/service'})
          }
          this.ShowLogRegModal = false;
          this.form7LoginCheck = false;
          
          console.log("logged in");
        }
      } catch (error) {
        this.form7LoginCheck = true;
        localStorage.setItem("error", error);
      }
    },


  }
  ,
  updated() {
    this.$emit('modalClosed');
    console.log("Modal Login Reg updated");
  },
  
  mounted() {
  }

};
</script>
<!--add validation also-->

<style>
.modal-open{
  overflow-x:hidden  !important;
  overflow-y: auto !important;
  padding-right: 0 !important;
}
#textExample2{
  margin-top: 0px !important;
  
}
</style>