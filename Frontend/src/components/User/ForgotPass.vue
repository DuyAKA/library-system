<template>
    <div class="p-5 bg-image" style="
          background-image: url(https://images.unsplash.com/photo-1606056041654-f203e0351229?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80);
          height: 100vh;
        ">
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
            <div class="d-flex  ">

                <div class="formholder align-items-center">
                    <!--information part-->
                    <div v-show="information">
                        <h1 class="text-center"> Forgot Password</h1>

                        <MDBInput type='email' label="Please input your email address" id="forgotEmail"
                            v-model="forgotEmail" @keyup.enter="sendEmail(forgotEmail)" wrapperClass="mb-4" />

                        <div class="text-center p-3">
                            <MDBBtn color="primary" @click="sendEmail(forgotEmail)">Edit Information</MDBBtn>
                        </div>

                    </div>
                    <!--edit form part-->
                    <div v-show="edit">
                        <div class="d-inline" style="cursor: pointer;" @click="goback">
                            <i class="fas fa-angle-left"></i>
                        </div>
                        <h1 class="text-center"> Reset Password</h1>
                        <p class="note note-warning">
                            <strong>Warning: </strong> An email has been sent to your email address with a special code
                            <br>
                            Please check your email and input the code below.
                        </p>
                        <p v-show="error1" class="note note-danger">
                            <strong>Warning: </strong> Your Secret Key has expired, get another one
                        </p>
                        <p v-show="error2" class="note note-danger">
                            <strong>Warning: </strong> User not found
                        </p>
                        <MDBInput type='text' label="Code" id="creCode" v-model="creCode" wrapperClass="mb-4"
                            @keyup.enter="requestNewPass()" />
                        <MDBInput type="password" label="New Password" id="newPass" v-model="newPass" wrapperClass="mb-4"
                            @keyup.enter="requestNewPass()" />
                        <div class="text-center p-3">
                            <MDBBtn color="primary" @click="requestNewPass()">Reset Password</MDBBtn>
                        </div>
                    </div>
                    <div v-show="success">
                        <h5 class="text-center">Your password has been changed successfully, please login again.</h5>
                        <div class="text-center p-3">
                            <MDBBtn color="primary" @click="$router.push('/')">Go back!</MDBBtn>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { MDBInput } from 'mdb-vue-ui-kit';
import { MDBBtn } from 'mdb-vue-ui-kit';
import dataServices from '@/services/dataServices';
export default {
    components: {

        MDBBtn,

        MDBInput
    },
    data() {
        return {
            information: true,
            edit: false,
            forgotEmail: '',
            creCode: null,
            newPass: null,
            success: false,
            error1: false,
            error2: false
        }
    },
    methods: {
        sendEmail(email) {
            var data = {
                email: email
            }
            dataServices.forgotPassword(data).then(res => {

                this.information = false;
                this.edit = true;
                console.log(res);
                console.log("password reset link sent")
            }).catch(err => {
                alert("Something went wrong, please check your information again or contact the librarian!");
                console.log(err);
            })
        },
        requestNewPass() {

            if (this.creCode == null || this.newPass == null) {
                alert("Please fill in all the information!");
            }
            else {
                var data = {
                    encryptedString: this.creCode,
                    new_password: this.newPass
                }
                dataServices.resetPassword(data).then(res => {
                    console.log(res);
                    this.edit = false;
                    this.success = true;
                }).catch(err => {
                    if (err.response.status == 402) {
                        this.error1 = true;
                    }
                    if (err.response.status == 401) {
                        this.error2 = true;
                    }
                    else {
                        alert("Something went wrong, please check your information again or contact the librarian!");
                    }
                    console.log(err);
                })
            }
        },
        goback() {
            this.forgotEmail = null;
            this.information = true;
            this.edit = false;
            this.error1 = false;
            this.error2 = false;
        }
    }
}
</script>