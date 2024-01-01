<template>
  <CheckIfAdmin/>
  <MainNavBar id ="navbar" />
 
  <MDBTabs v-model="activeTabId1" vertical style="padding-top: 50px;">
    <!-- Tabs navs -->

    <MDBTabNav pills tabsClasses="mb-3 text-center d-flex">
      <MDBTabItem tabId="addBook" href="addBook">Books</MDBTabItem>
      <MDBTabItem tabId="removeBook" href="removeBook">Authors</MDBTabItem>
      <MDBTabItem tabId="Book_Author" href="Book_Author">Book_Authors</MDBTabItem>
      <MDBTabItem tabId="CurrentLoan" href="CurrentLoan">Current Loan</MDBTabItem>
      <MDBTabItem tabId="ManageLoan" href="ManageLoan">Manage Loan</MDBTabItem>
      <MDBTabItem tabId="Reservation" href="Reservation">Reservations</MDBTabItem>
    </MDBTabNav>
    <!-- <div class="vr vr-blurry" style="height: 50vh; --mdb-gutter-x: 0.1rem"></div> -->
    
  
    <MDBTabContent>
      <MDBTabPane tabId="addBook">
        <ManageBooks/>
      </MDBTabPane>
      <MDBTabPane tabId="removeBook">
        <ManageAuthors/>
      </MDBTabPane>
      <MDBTabPane tabId="Book_Author">
        <Book_Author/>
      </MDBTabPane>

      <MDBTabPane tabId="CurrentLoan">
        <CurrentLoan/>
      </MDBTabPane>

      <MDBTabPane tabId="ManageLoan">
        <ManageLoan/>
      </MDBTabPane>

      <MDBTabPane tabId="Reservation">

      </MDBTabPane>
    </MDBTabContent>

  </MDBTabs>

</template>

<script>
import {
  MDBTabs,
  MDBTabNav,
  MDBTabContent,
  MDBTabItem,
  MDBTabPane,
  
} from 'mdb-vue-ui-kit';
import { ref } from 'vue';
import MainNavBar from "@/components/Utilities/MainNavBar.vue";
import ManageBooks from "@/components/Admin/ManageBooks.vue"
import ManageAuthors from "@/components/Admin/ManageAuthors.vue"
import Book_Author from '@/components/Admin/Book_Author.vue'
import CheckIfAdmin from '@/components/Checker/CheckIfAdmin.vue';
import ManageLoan from '@/components/Admin/ManageLoan.vue';
import CurrentLoan from '@/components/Admin/CurrentLoan.vue';
export default {
  data() {
    return {
      
    }
  },
  components: {
    MainNavBar,
    MDBTabs,
    MDBTabNav,
    MDBTabContent,
    MDBTabItem,
    MDBTabPane,
    CheckIfAdmin,
    CurrentLoan,
    Book_Author,
    ManageBooks,
    ManageAuthors,
    ManageLoan,
    
},
  setup() {
    const activeTabId1 = ref('addBook');
    return {
      activeTabId1,
    };
  },mounted() { 
      
    }
  ,
  methods: {
    

  },
};
</script>

<style scoped>
.navbar {
    position: static !important;
}
form{
padding-top: 50px
}
</style>