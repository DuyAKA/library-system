<template>
  <MDBRow>
  <h1 class=" text-center"> Add Book</h1>
</MDBRow>
<MDBRow>
  <div class="p-4 justify-content-center text-center">
    <form>
      <!-- FOR BOOKS -->
      <MDBRow class="mb-4">
        <MDBCol>
          <MDBInput type="text" label="Title" id="form1Title" v-model="book.title" required />
        </MDBCol>
        <MDBCol>
          <MDBInput type="text" label="Category" id="form1Category" v-model="book.category" required />
        </MDBCol>
      </MDBRow>

      <!-- Text input -->
      <MDBInput type="text" label="Copies Owned" id="form1Genre" v-model="book.copies_owned" required
        wrapperClass="mb-4" />


      <MDBInput type="text" label="Description" id="form1BookDescription" v-model="book.book_description" required
        wrapperClass="mb-4" />


      <MDBInput type="date" label="Publication Date" id="form1Date" v-model="book.publication_date" required
        wrapperClass="mb-4" />

      <MDBInput type="text" label="Image (URL)" id="form1Image" v-model="book.image" required wrapperClass="mb-4" />

        <!-- Submit button -->
        <MDBBtn rounded color="success" @click="addBook">
        ADD BOOK
      </MDBBtn>
    </form>
  </div>
</MDBRow>
  <!-- REMOVE AND UPDATE -->
  <div class="justify-content-center p-4">
    <div>
      <MDBRow>
      <MDBCol col="6" >
      <h4>Book List</h4>
      <ul class="list-group" style="height: 80vh; overflow-y: auto;">
        <li class="list-group-item" :class="{ active: index == currentBookIndex }" v-for="(book, index) in books"
          :key="index" @click="setActiveBook(book, index)">
          {{ book.title }}
        </li>
      </ul>
    </MDBCol>
      <MDBCol col="6" class="text-start">
      <div v-if="currentBook">
        <h4><strong>{{ currentBook.title }}</strong> Information:</h4>
        <div>
          <label><strong>Title:</strong></label> {{ currentBook.title }}
        </div>
        <div>
          <label><strong>Category:</strong></label> {{ currentBook.category }}
        </div>
        <div>
          <label><strong>Copies Owned:</strong></label> {{ currentBook.copies_owned }}
        </div>
        <div>
          <label><strong>Pulication Date:</strong></label> {{ currentBook.publication_date }}
        </div>
        <div>
          <label><strong>Description:</strong></label> {{ currentBook.description }}
        </div>
        <button class="badge badge-danger mr-2" @click="deleteBook">Delete</button>

        <form>
          <br>
          <label><strong>Modify Book</strong></label>
          <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" v-model="varBook.title" />
          </div>
          <div class="form-group">
            <label for="category">Category</label>
            <input type="text" class="form-control" id="category" v-model="varBook.category" />
          </div>
          <div class="form-group">
            <label for="copies_owned">Copies Owned</label>
            <input type="text" class="form-control" id="copies_owned" v-model="varBook.copies_owned" />
          </div>
          <div class="form-group">
            <label for="publication_date">Publication Date</label>
            <input type="date" class="form-control" id="publication_date" v-model="varBook.publication_date" />
          </div>
          <div class="form-group">
            <label for="description">Description</label>
            <input type="text" class="form-control" id="description" v-model="varBook.description" />
          </div>

          <div class="form-group">
            <label for="image">Image</label>
            <input type="text" class="form-control" id="image" v-model="varBook.image" />
          </div>
          <button type="submit" class="badge badge-success" @click="updateBook">Update</button>
        </form>

        <!-- <p>{{ bookMessage }}</p> -->


      </div>

      <div v-else>
        <br />
        <p>Click on a Book...</p>
      </div>
    </MDBCol>
  </MDBRow>
    </div>
  </div>
</template>

<script>
import {
  MDBBtn,
  MDBRow,
  MDBCol,
  MDBInput
} from 'mdb-vue-ui-kit';

import dataServices from '../../services/dataServices';
//  import axios from 'axios';
export default {
  name: 'App',
  data() {
    return {
      book: {
        title: '',
        category: '',
        copies_owned: '',
        publication_date: '',
        book_description: '',
        id: null,
        image: null,
      },
      books: [],
      currentBook: null,
      varBook: {},
      currentBookIndex: -1,
      bookMessage: '',
    }
  },
  components: {
    MDBBtn,
    MDBRow,
    MDBCol,
    MDBInput,

  },
  setup() {
  },
  methods: {

    addBook() {
      if (
        this.book.title &&
        this.book.category &&
        this.book.publication_date &&
        this.book.copies_owned &&
        this.book.book_description &&
        this.book.image
      ) {
        var data = {
          title: this.book.title,
          category: this.book.category,
          publication_date: this.book.publication_date,
          copies_owned: this.book.copies_owned,
          description: this.book.book_description,
          image: this.book.image
        };

        console.log(data)

        dataServices.createBook(data)
          .then(response => {
            this.book.id = response.data.id;
            console.log(response.data);
            this.submitted = true;
            alert('Book successfully added');
            this.retrieveBooks();
          })
          .catch(e => {
            console.log(e);
          });
      }
      else {
        alert('Please fill out all fields');
      }


    },

    retrieveBooks() {
      dataServices.getBooks()
        .then(response => {
          this.books = response.data;
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },

    setActiveBook(book, index) {
      this.currentBook = book;
      this.currentBookIndex = book ? index : -1;
    },

    updateBook() {
      // if (!this.varBook.title || ! this.varBook.category || 
      // !this.varBook.copies_owned || !this.varBook.publication_date || !this.varBook.description || !this.varBook.image) {
      //   alert('Please fill out all fields');
      if (this.varBook.copies_owned < 0) {
        alert('copies_owned must be >= 0');
      } else {
        var data = {
          title: this.varBook.title,
          category: this.varBook.category,
          copies_owned: this.varBook.copies_owned,
          publication_date: this.varBook.publication_date,
          description: this.varBook.description,
          imgae: this.varBook.image
        }
        // var formData = new FormData();
        // formData.append('title', this.currentBook.title);
        // formData.append('category', this.currentBook.category);
        // formData.append('copies_owned', this.currentBook.copies_owned);
        // formData.append('publication_date', this.currentBook.publication_date);
        // formData.append('description', this.currentBook.description);
        // formData.append('image', this.currentBook.image);

        dataServices.updateBook(this.currentBook.id, data)
          .then(response => {
            console.log(response.data);
            this.bookMessage = 'The book was updated successfully!';
            alert(`Book's info has been updated!`);
            this.retrieveBooks();
          })
          .catch(e => {
            console.log(e);
          });
      }
    },

    deleteBook() {
      dataServices.deleteBook(this.currentBook.id)
        .then(response => {
          console.log(response.data);
          this.bookMessage = 'The book was deleted successfully!';
          alert(`The book has been deleted!`);
          this.retrieveBooks();
        })
        .catch(e => {
          console.log(e);
        });
    },

    reloadPage() {
      location.reload();
    }
  },
  mounted() {
    this.retrieveBooks();
    this.bookMessage = '';
  },



};

</script>

<style></style>