<template>
  <CheckIfLoginVue />
  <div>
    <MainNav ref="MainNav" />
    <div class="p-5 text-center bg-image" style="
          background-image: url(https://images.pexels.com/photos/448835/pexels-photo-448835.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
          height: 30vh;
        ">
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="text-white">
                <h1 class="display-4">Book Database.
            </h1>
            </div>
            </div>
        </div>
    </div>
    <div class="SearchElement">

      <MDBRow class="searchBar d-flex p-4" center>
        <MDBCol col="2">
          <!--on choosing the option By Author, change the value of searchByAuthor to true, on chosing by title change the value of seachByAuthor to false-->
          <select class="form-select" aria-label="Default select" v-model="searchByTitle">
            <option value="true" selected>By Title</option>
            <option value="false">By Author</option>
          </select>
        </MDBCol>
        <MDBCol col="5">
          <div style="padding-top: 2px;">
            <MDBInput id="input1" v-model="search1" inputGroup :formOutline="false" placeholder="Search"
              aria-label="Search" aria-describedby="button-addon2" v-on:keyup.enter="getBooks(search1)">
              <MDBBtn @click="getBooks(search1)" color="primary">
                <MDBIcon icon="search" />
              </MDBBtn>
            </MDBInput>
          </div>
        </MDBCol>
      </MDBRow>

    </div>

    <!--Data waiting-->

    <div v-show="!loadData">
      <div class="d-flex justify-content-center m-4">
        <div class="spinner-grow" role="status">
          <span class="sr-only  text-center">Loading... </span>
        </div>
        <div class="spinner-grow" role="status">
          <span class="sr-only  text-center">Loading...</span>
        </div>
        <div class="spinner-grow" role="status">
          <span class="sr-only  text-center">Loading...</span>
        </div>
      </div>
      <h1 class="text-center p-4">Waiting ...</h1>
    </div>
    <div class="justify-content-center align-items-center m-0 px-5">
    <div v-show="loadData">
      <!--search bar-->
      <MDBTable responsive hover border class="MDBTable align-middle bg-white" style="width:100%;">
        <thead class="bg-light">
          <tr>
            <th style="width: 25%;">Title-Author</th>
            <th style="width: 25%;">Description</th>
            <th>Category</th>
            <th>Status</th>
            <th>Option</th>
          </tr>
        </thead>

        <tbody>
          <tr v-for="book in displayedBooks" :key="book.id">
            <td>
              <div class="d-flex align-items-center">
                <img :src="book.image" alt="" style="width: 45px; height: 45px" class="rounded" />
                <div class="ms-3">
                  <p class="fw-bold mb-1">{{ book.title }}</p>
                  <p v-for="author in book.authors" :key="author.id" class="text-muted mb-0">
                    {{ author.first_name }} {{ author.last_name }}
                  </p>
                </div>
              </div>
            </td>
            <td>
              <p class="fw-normal mb-1">{{ book.description }}</p>
            </td>
            <td>
              <p class="fw-normal mb-1">{{ book.category }}</p>
              <p class="text-muted mb-0">{{ book.publication_date }}</p>
            </td>

            <td v-if="book.copies_owned">
              <MDBBadge badge="success" pill class="d-inline">Available</MDBBadge>
            </td>
            <td v-else>
              <MDBBadge badge="danger" pill class="d-inline">Out of Book</MDBBadge>
            </td>
            <td>
              <div v-if="book.copies_owned">
                <MDBBtn color="link" size="sm" rounded @click="rentBook(book)">
                  Rent Now!
                </MDBBtn>
              </div>
              <div v-else>
                <MDBBtn color="link" size="sm" rounded @click="noticeBook(book.copies_owned)">
                  Notice Me!
                </MDBBtn>
              </div>
            </td>
          </tr>
        </tbody>
      </MDBTable>
    </div>
  </div>
    <div class="pagination d-flex justify-content-center py-4" v-show="!loadData">
      <MDBBtn color="secondary" :disabled="currentPage === 1" @click="setPage(currentPage - 1)">
        Previous
      </MDBBtn>
      <span class="p-2">{{ currentPage }} / {{ totalPages }}</span>
      <MDBBtn color="secondary" :disabled="currentPage === totalPages" @click="setPage(currentPage + 1)">
        Next
      </MDBBtn>
    </div>
    <FooterMainPage class="Footer" />
  </div>
</template>

<script>
import MainNav from "@/components/Utilities/MainNavBar.vue";
import {ref} from 'vue';
import FooterMainPage from "@/components/Utilities/FooterMainPage.vue";
import dataService from '../services/dataServices.js';
import CheckIfLoginVue from '@/components/Checker/CheckIfLogin.vue';
import emitter from "@/eventBus";
import {
  MDBTable,
  MDBBtn,
  MDBBadge,
  MDBInput,
  MDBIcon,
  MDBCol,
  MDBRow
} from 'mdb-vue-ui-kit';
export default {
  name: 'App',
  data() {
    return {
      books: null,
      isactive: true,
      hasError: false,
      currentPage: 1,
      pageSize: 10,
      searchByTitle: "true",
      loadData: false,
    }
  },
  components: {
    MainNav, FooterMainPage,
    MDBTable,
    MDBBtn,
    MDBBadge,
    MDBInput,
    MDBIcon,
    MDBCol, MDBRow,
    CheckIfLoginVue

  },
  setup() {
    const search1 = ref('');
    return { search1 }
  },
  computed: {
    state() {
      return this.$store.getters.getLoginState;
    },
    displayedBooks() {
      if (!this.books) {
        return null;
      }
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.books.slice(start, end);
    },
    totalPages() {
      if (!this.books) {
        return 0;
      }
      return Math.ceil(this.books.length / this.pageSize);
    }
  },
  mounted() {
    this.receiveData();
    this.checkState();
  }
  ,
  methods: {
    rentBook(book) {
      // console.log("rented :" + book);
      //remember to change the user_id, this is actuallly loan :V
      var data = { book_id: book.id };
      dataService.createLoan(data)
        .then(response => {
          // this.book.id = response.data.id;
          console.log(response.data);
          dataService.updateBook(book.id, { copies_owned: book.copies_owned - 1 })
            .then(() => {
              
              alert('You have successfully rented the book ', book.title, ' please go to the counter to get your book');
              this.receiveData(); // Call this to refresh the book list
            })
            .catch(error => {
              console.log(error);
            });
        })
        .catch(error => {
          console.log(error);
        });
    }
    ,
    receiveData() {
      dataService.getBooks().then((response) => {
        this.books = response.data;
      }).catch((error) => {
        console.log(error);
      });
    },
    setPage(page) {
      if (page >= 1 && page <= this.totalPages) {
        this.currentPage = page;
      }
    },
    getBooks(data) {
      if (this.searchByTitle == "true") {
        this.getBooksByTitle(data);
        console.log("choose title");
        this.$router.replace({ path: '/service', query: { title: this.search1 } });
      }
      else {
        this.getBooksByAuthor(data);
        console.log("choose author");
        this.$router.replace({ path: '/service', query: { author: this.search1 } });
      }
    }
    ,
    getBooksByTitle(title) {
      dataService.getBooksByTitle(title).
        then(response => {
          this.books = response.data;
          console.log(response.data);
          this.currentPage = 1;
        })
        .catch(e => {
          console.log(e);
        })
    },
    getBooksByAuthor(author) {
      dataService.getBooksByAuthor(author).
        then(response => {
          this.books = response.data;
          console.log(response.data);
          this.currentPage = 1;
        })
        .catch(e => {
          console.log(e);
        })
    }
    ,
    checkState() {
      if (this.state !== 'guest') {
        this.loadData = true;
      }
      else {
        emitter.on("loggedInSuccess", () => {
          this.loadData = true;
        });
      }
    }

  },
  unmounted() {
    emitter.off("loggedInSuccess");
  },
  watch: {
    searchByAuthor(value) {
      if (value === 'true') {
        this.searchByTitle = true;
        console.log(this.searchByTitle);
      } else if (value === 'false') {
        this.searchByTitle = false;
        console.log(this.searchByTitle);
      }
    },
  },

}
</script>

<style scoped>
/* *{overflow-x: hidden;} */
.navbar {
  position: sticky !important;
}
/* 
.contentServ {
  margin-top: 10px;
  height: 990px;
  display: inline;
} */

.searchBar {
  margin-top: 50px;
  margin-bottom: 50px;

}

.SearchElement {
  overflow-x: hidden;
}

#input1 {
  padding-left: 0;
}
</style>

