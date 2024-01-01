<template>
    <CheckIfLogin />
    <MainNavBar style="position: sticky;"/>
    <div class="p-5 bg-image" style="
          background-image: url(https://images.unsplash.com/photo-1606056041654-f203e0351229?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80);
          height: 100vh;
        ">
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
            <div class="d-flex justify-content-center align-items-center h-100 w-auto ">

                <div class="bg-white p-5 w-auto">
                    <!--information part-->
                    <div v-show="information" >
                        <h1 class="text-center"> User Information</h1>
                        
                        <MDBListGroup light style="padding-top: 20px;">
                            <p v-show="checkSuccess" class="note note-success">
                            <strong>Success: </strong> Your Information has been updated successfully! <br>
                        </p>
                            <MDBListGroupItem color="light" noBorder spacing class="my-1  rounded-3">
                                <p class="m-0 p-1 "><strong>Username:</strong> {{ user?.username }}</p>
                            </MDBListGroupItem>
                            <MDBListGroupItem color="light" noBorder spacing class="my-1  rounded-3">
                                <p class="m-0 p-1 "><strong>First Name:</strong> {{ user?.first_name }}</p>
                            </MDBListGroupItem>
                            <MDBListGroupItem color="light" noBorder spacing class="my-1  rounded-3">
                                <p class="m-0 p-1"><strong>Last Name:</strong> {{ user?.last_name }}</p>
                            </MDBListGroupItem>
                            <MDBListGroupItem color="light" noBorder spacing class="my-1  rounded-3">
                                <p class="m-0 p-1"><strong>Email:</strong> {{ user?.email }}</p>
                            </MDBListGroupItem>
                        </MDBListGroup>

                        <div class="text-center p-3">
                            <MDBBtn color="primary" @click="editFormShow">Edit Information</MDBBtn>
                        </div>
                        <p class="text-center">We are currently not support changing Password <br>
                            Use <router-link :to="{name:'ForgotPass'}">Forgot Password </router-link>Instead!
                        </p>
                    </div>
                    <!--edit form part-->
                    <div v-show="edit">
                        <h1 class="text-center"> Edit Information</h1>
                        <p v-show="checkError" class="note note-danger">
                            <strong>Warning: </strong> Some Error Occur! <br>
                            Please check your input and try again or contact the librarian for more information.
                        </p>
                        <form style="padding-top: 50px;" @submit.prevent="editUser()">
                            <MDBInput label="User Name" id="formUserEmail" v-model="formUserName" wrapperClass="mb-4" />
                            <!-- 2 column grid layout with text inputs for the first and last names -->
                            <MDBRow class="mb-4">
                                <MDBCol>
                                    <MDBInput type="text" label="First name" id="formUserFirstName"
                                        v-model="formUserFirstName" />
                                </MDBCol>
                                <MDBCol>
                                    <MDBInput type="text" label="Last name" id="formUserLastName"
                                        v-model="formUserLastName" />
                                </MDBCol>
                            </MDBRow>
                            <!-- Email input -->
                            <MDBInput type="email" label="Email address" id="formUserEmail" v-model="formUserEmail"
                                wrapperClass="mb-4" />
                            <!-- Password input -->
                            <div class="text-center">
                                <MDBBtn color="primary" type="submit">Save</MDBBtn>
                                <MDBBtn color="danger" @click="editFormShow">Cancel</MDBBtn>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <FooterMainPage/>
</template>

<script>
import FooterMainPage from '@/components/Utilities/FooterMainPage.vue';
import MainNavBar from '@/components/Utilities/MainNavBar.vue';
import { MDBBtn, MDBListGroup, MDBListGroupItem, MDBInput, MDBRow, MDBCol } from 'mdb-vue-ui-kit';
import { ref } from 'vue';
import dataServices from '@/services/dataServices';
import CheckIfLogin from '@/components/Checker/CheckIfLogin.vue';
export default {
    name: 'UserAccountView',
    components: {
    MainNavBar,
    FooterMainPage,
    MDBListGroup,
    MDBListGroupItem,
    MDBBtn,
    MDBInput,
    MDBRow,
    MDBCol,
    CheckIfLogin
},
    data() {
        return {
            user: null,
            edit: false,
            information: true,
            checkError: false,
            checkSuccess: false,
        }
    },
    setup() {
        const formUserName = ref('');
        const formUserFirstName = ref('');
        const formUserLastName = ref('');
        const formUserEmail = ref('');
        return {
            formUserName,
            formUserFirstName,
            formUserLastName,
            formUserEmail,

        }
    }
    ,
    computed: {
        UserName() {
            return this.$store.getters.getUserName;
        }
    },
    mounted() {
        this.getUserInfo();
    },
    methods: {
        getUserInfo() {
            dataServices.getUserByUserName()
                .then(response => {
                    this.user = response.data;
                })
                .catch(e => {
                    console.log(e);
                });
        },
        editFormShow() {
            this.edit = !this.edit;
            this.information = !this.information;
        },
        editUser() {
            const data = {
                username: this.formUserName,
                first_name: this.formUserFirstName,
                last_name: this.formUserLastName,
                email: this.formUserEmail,
            };
            dataServices.updateUserInfo(data)
                .then(response => {
                    console.log(response.data);
                    this.getUserInfo();
                    this.editFormShow();
                    this.checkSuccess = true;
                })
                .catch(e => {
                    this.checkError = true;
                    console.log(e);
                });
        }
    },
    watch: {
        user: {
            handler: function (val) {
                if (val) {
                    this.formUserName = val.username;
                    this.formUserFirstName = val.first_name;
                    this.formUserLastName = val.last_name;
                    this.formUserEmail = val.email;
                }
            },
            deep: true,
        },
    },
}
</script>

<style>
.formholder {
    width: 50%;
    max-width: 500px;
    margin: 0 auto;
    /* place in the middle of the page (vertically) */
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20PX 20px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}
</style>