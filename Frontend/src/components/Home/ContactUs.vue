<template>
    <div class="text-center bg-image" style="
    background-image: url(https://images.pexels.com/photos/4050302/pexels-photo-4050302.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
    height: 100vh;
  ">
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
            <div id="section">
                <div class="d-flex justify-content-center align-items-center">
                    <div id="text-top" class=" text-center text-light">
                        <h2 class="text-uppercase display-3"><strong>Contact Us</strong></h2>
                        <h3 class="text-muted display-6"> We will reply you as soon as possible</h3>
                    </div>
                    

                </div>
                <MDBContainer fluid class="pl-1">
                    <!--input form-->
                    <MDBRow center>
                        <MDBCol col="5">
                            <MDBInput required class="mb-4 bg-light bg-opacity-75 pt-2"
                                label="Your Name*" type="text" />
                            <MDBInput required class="mb-4 bg-light bg-opacity-75 pt-2" label="Your Email*" type="email" />
                            <MDBInput class="mb-4 bg-light bg-opacity-75 pt-2" label="Your Phone Number" />
                        </MDBCol>
                        <MDBCol col="5">
                            <MDBTextarea class="bg-light bg-opacity-75 p-1"  label="Message" rows="6"
                                v-model="textareaValue" />
                        </MDBCol>
                    </MDBRow>

                    <MDBBtn center class="px-4 mb-4 mt-4" color="primary" size="lg">Send</MDBBtn>
                </MDBContainer>
            </div>

        </div>
    </div>
</template>

<script>
import { MDBBtn, MDBCol, MDBContainer, MDBInput, MDBRow, MDBTextarea } from 'mdb-vue-ui-kit';

export default {
    name: "ContactUs",
    components: {
        MDBBtn,
        MDBCol,
        MDBInput,
        MDBRow,
        MDBTextarea,
        MDBContainer
    }
}
</script>

<style scoped>
#section {
    padding: 50px;
    margin-top: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    display: block;
}

#text-top {
    margin-top: 10vh;
    margin-bottom: 50px;
    display: block !important;
}

/* .bg-success{
    --bs-bg-opacity: 1;
  background-color: rgba(var(--bs-success-rgb), var(--bs-bg-opacity)) !important;
} */</style>