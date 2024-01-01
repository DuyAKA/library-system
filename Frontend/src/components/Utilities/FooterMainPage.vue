<template>
    <MDBFooter bg="dark" :text="['center', 'white'] ">
      <!-- Grid container -->
      <MDBContainer fluid>
        <!-- Section: Social media -->
        <section class="mb-0">
          <!-- Facebook -->
          <MDBBtn
            tag="a"
            color="primary"
            href="https://www.facebook.com/khoango1810"
            floating
            style="background-color: #3b5998"
            class="m-1"
          >
            <MDBIcon iconStyle="fab" icon="facebook-f"></MDBIcon>
          </MDBBtn>
          <!-- Github -->
          <MDBBtn
            tag="a"
            color="primary"
            href="https://gitlab.com/galvdat/vgu_tinyprojects/pe2023/vgupe2023_team12"
            floating
            style="background-color: #333333"
            class="m-1"
          >
            <MDBIcon iconStyle="fab" icon="gitlab"></MDBIcon>
          </MDBBtn>
        </section>
        <!-- Section: Social media -->
      </MDBContainer>
      <!-- Grid container -->
      <!-- Copyright -->
      <div
        class="text-center p-3"
        style="background-color: rgba(0, 0, 0, 0.2)"
      >
        © 2020 Copyright:
        <a class="text-white" href="https://vgu.edu.vn/"
          >Vietnamese-German University</a
        >
      </div>
      <!-- Copyright -->
    </MDBFooter>
</template>

<script>
import { MDBFooter, MDBContainer, MDBBtn,MDBIcon } from 'mdb-vue-ui-kit';

export default {
  name: 'FooterMainPage',
  components: {
    MDBFooter,
    MDBContainer,
    MDBBtn,MDBIcon
  },
};
</script>