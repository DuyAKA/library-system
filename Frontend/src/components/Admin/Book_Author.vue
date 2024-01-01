<template>
  <h1 class="text-center"> Add Book_Author</h1>
  <div class="p-4 text-center justify-content-center">
  <MDBRow class="mb-4">
    <MDBCol>
      <MDBInput type="text" label="Book Id" id="form1BookId" v-model="book_author.book_id" required />
    </MDBCol>
    <MDBCol>
      <MDBInput type="text" label="Author Id" id="form1AuthorId" v-model="book_author.author_id" required />
    </MDBCol>
  </MDBRow>
  <MDBBtn rounded color="success" class="mb-4" @click="addBookAuthor">
    ADD
  </MDBBtn>
</div>


  <!-- FOR BOOK-AUTHOR -->
  <div class="justify-content-center p-4">
    <MDBRow>
    <div style="flex: 1;">
      <h4>Relationship List</h4>
      <ul class="list-group" style="height: 70vh; overflow-y: auto;">
        <li class="list-group-item" :class="{ active: index == currentBookAuthorIndex }"
          v-for="(book_author, index) in book_authors" :key="index" @click="setActiveBookAuthor(book_author, index)">
          Book's ID: {{ book_author.book_id }} , Author's ID: {{ book_author.author_id }}
        </li>
      </ul>
    </div>

    <div style="flex: 1;">

      <div v-if="currentBookAuthor">
        <h4>Relationship's Information:</h4>
        <div>
          <label><strong>Book's ID:</strong></label> {{ currentBookAuthor.book_id }}
        </div>
        <div>
          <label><strong>Author's ID:</strong></label> {{ currentBookAuthor.author_id }}
        </div>
        <button class="badge badge-danger mr-2" @click="deleteBookAuthor">Delete</button>
        <form>
          <br>
          <label><strong>Modify Relationship</strong></label>
          <div class="form-group">
            <label for="bookID">Book's ID</label>
            <input type="text" class="form-control" id="bookID" v-model="varBookAuthor.book_id" />
          </div>
          <div class="form-group">
            <label for="authorID">Author's ID</label>
            <input type="text" class="form-control" id="category" v-model="varBookAuthor.author_id" />
          </div>
        </form>
        <button type="submit" class="badge badge-success" @click="updateBookAuthor">Update</button>



      </div>

      <div v-else>
        <br />
        <p>Click on a Relationship...</p>
      </div>

    </div>
  </MDBRow>
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
      book_author: {
        book_id: '',
        author_id: '',
      },
      book_authors: [],
      currentBookAuthor: null,
      varBookAuthor: {},
      currentBookAuthorIndex: -1,
      bookAuthorMessage: '',
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

    addBookAuthor() {
      if (
        this.book_author.book_id &&
        this.book_author.author_id
      ) {
        var data = {
          book_id: this.book_author.book_id,
          author_id: this.book_author.author_id,
        };

        console.log(data)

        dataServices.createBookAuthor(data)
          .then(response => {
            this.book_author.id = response.data.id;
            console.log(response.data);
            alert('Relation successfully added');
            this.retrieveBookAuthors();
          })
          .catch(err => {
            console.log(err);
            if (err.response.status == 500) {
              alert('Error, check if the ID of the book and author is valid, or mayber the realtionship already exists')
            }
          });
      }
      else {
        alert('Please fill out all fields');
      }

    },
    // FOR BOOK-AUTHOR
    retrieveBookAuthors() {
      dataServices.getBookAuthors()
        .then(response => {
          this.book_authors = response.data;
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },

    setActiveBookAuthor(book_author, index) {
      this.currentBookAuthor = book_author;
      this.currentBookAuthorIndex = book_author ? index : -1;
    },

    updateBookAuthor() {
      if (!this.varBookAuthor.book_id || !this.varBookAuthor.author_id) {
        alert('Please fill out all fields');
      } else {
        var data = {
          book_id: this.varBookAuthor.book_id,
          author_id: this.varBookAuthor.author_id
        }
        dataServices.updateBookAuthor(this.currentBookAuthor.book_id, this.currentBookAuthor.author_id, data)
          .then(response => {
            console.log(response.data);
            this.bookAuthorMessage = 'The relationship was updated successfully!';
            alert(`Relationship has been updated!`);
            this.retrieveBookAuthors();
          })
          .catch(e => {
            console.log(e);
            if (e.response.status == 500) {
              alert('Error, check if the ID of the book and author is valid, or maybe the relationship already exists');
            }
          });
      }
    },

    deleteBookAuthor() {
      dataServices.deleteBookAuthor(this.currentBookAuthor.book_id, this.currentBookAuthor.author_id)
        .then(response => {
          console.log(response.data);
          this.bookAuthorMessage = 'The relationship was deleted successfully!';
        })
        .catch(e => {
          console.log(e);
        });


      alert(`Relationship has been deleted!`);
      this.retrieveBookAuthors();
    },

    reloadPage() {
      location.reload();
    }
  },
  mounted() {
    this.retrieveBookAuthors();
    this.bookAuthorMessage = '';
  },

};
</script>
    
<style></style>