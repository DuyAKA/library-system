<template>

    <!--About us-->
    <MDBContainer class="p-4" id="AboutUs">

        <!--Grid row-->
        <MDBRow>
            <!--Grid column-->
            <MDBCol lg="6" md="12" class="mb-4 mb-md-0">
                <img src="https://images.unsplash.com/photo-1549675584-91f19337af3d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80"
                    class="img-fluid rounded" style="max-height: fit-content;">
            </MDBCol>
            <!--Grid column-->

            <!--Grid column-->
            <MDBCol lg="6" md="12" class="mb-4 mb-md-0">
                <h5 class="text-uppercase">About Us</h5>
                <br>
                <p>
                    We are a team of six highly motivated and skilled computer science students from the Vietnamese German
                    University. Led by Ngo Dinh Anh Khoa, our team includes Tran Quang Minh, Phi Dinh Van Toan, Nguyen Vu
                    Doanh Khoa, Truong Van Quang, and Nguyen Truong Duy. With a passion for technology and a commitment to
                    excellence, we have come together to create innovative solutions that make a difference in people's
                    lives. Each member of our team brings unique skills and expertise, and we work collaboratively to
                    achieve our goals. Through our dedication, hard work, and creativity, we aim to push the boundaries of
                    what's possible and create meaningful impact in the world of technology.
                </p>
            </MDBCol>
            <!--Grid column-->
        </MDBRow>
        <!--Grid row-->
    </MDBContainer>
    <hr>
    <!-- Grid container -->
    <MDBContainer class="p-4 "> <!--Our Vision-->
        <!--Grid row-->
        <MDBRow>
            <!--Grid column-->
            <MDBCol lg="6" md="12" class="mb-4 mb-md-0">
                <h5 class="text-uppercase">Our Vision</h5>
                <br>
                <p>
                    At EndLib, our vision is to create a world where every individual has access to a vast collection of
                    books, regardless of their location, background, or financial status. We believe that reading is a
                    transformative experience that enriches our lives, expands our horizons, and connects us with people and
                    ideas across the globe. Our core values are accessibility, diversity, and innovation. We strive to
                    provide a seamless platform that empowers our users to discover, rent, and enjoy books easily and
                    affordably. Our extensive library features books from various genres, authors, and publishers, and our
                    personalized recommendation engine and advanced search filters ensure that users can find the books that
                    match their interests and preferences. With our flexible rental options and competitive pricing, we aim
                    to make reading accessible and affordable for everyone.
                </p>
            </MDBCol>
            <!--Grid column-->
            <!--Grid column-->
            <MDBCol lg="6" md="12" class="mb-4 mb-md-0">
                <img src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1856&q=80"
                    class="img-fluid" style=" object-fit: cover; height: 400px; width: 624px;" alt="">
            </MDBCol>
            <!--Grid column-->


        </MDBRow>
        <!--Grid row-->
    </MDBContainer>

</template>

<script >

import { MDBContainer, MDBRow, MDBCol } from "mdb-vue-ui-kit";
export default {
    name: "AboutUs",
    components: {
        MDBContainer,
        MDBRow,
        MDBCol,

    },
};
</script>
<!-- set local style -->
<style scoped>
.navbar {
    position: static !important;
}

/* #Footer {
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
} */
</style>