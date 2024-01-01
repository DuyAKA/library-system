<template>
  <!-- ADDING AUTHOR -->
  <h1 class="text-center"> Add Author</h1>
  <div class="p-4 justify-content-center text-center">

  <MDBRow class="mb-4">
    <MDBCol>
      <MDBInput type="text" label="First Name" id="form1BookName" v-model="author.first_name" required />
    </MDBCol>
    <MDBCol>
      <MDBInput type="text" label="Last Name" id="form1AuthorName" v-model="author.last_name" required />
    </MDBCol>
  </MDBRow>

  <MDBInput type="text" label="Description" id="form1AuthorDescription" v-model="author.author_description" required
    wrapperClass="mb-4" />

  <MDBBtn rounded color="success" class="mb-4" @click="addAuthor">
    ADD AUTHOR
  </MDBBtn>
</div>
  <!-- REMOVE AND UPDATE -->
  <!-- FOR AUTHOR -->
  <div class="p-4 justify-content-center">
    <MDBRow>
    <div style="flex: 1; height: 70vh; overflow-y: auto;">
      <h4>Author List</h4>
      <ul class="list-group">
        <li class="list-group-item" :class="{ active: index == currentAuthorIndex }" v-for="(author, index) in authors"
          :key="index" @click="setActiveAuthor(author, index)">
          {{ author.first_name }} {{ author.last_name }}
        </li>
      </ul>
    </div>

    <div style="flex: 1;">

      <div v-if="currentAuthor">
        <h4><strong>{{ currentAuthor.first_name }} {{ currentAuthor.last_name }}</strong> information:</h4>
        <div>
          <label><strong>First Name:</strong></label> {{ currentAuthor.first_name }}
        </div>
        <div>
          <label><strong>Last Name:</strong></label> {{ currentAuthor.last_name }}
        </div>
        <div>
          <label><strong>Description:</strong></label> {{ currentAuthor.description }}
        </div>
        <button class="badge badge-danger mr-2" @click="deleteAuthor">Delete</button>
        <form>
          <br>
          <label><strong>Modify Author</strong></label>
          <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" class="form-control" id="title" v-model="varAuthor.first_name" />
          </div>
          <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" id="category" v-model="varAuthor.last_name" />
          </div>
          <div class="form-group">
            <label for="authorDescription">Description</label>
            <input type="text" class="form-control" id="description" v-model="varAuthor.description" />
          </div>
        </form>
        <button type="submit" class="badge badge-success" @click="updateAuthor">Update</button>



      </div>

      <div v-else>
        <br />
        <p>Click on an author...</p>
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
      author: {
        first_name: '',
        last_name: '',
        author_description: '',
      },
      authors: [],
      currentAuthor: null,
      varAuthor: {},
      currentAuthorIndex: -1,
      authorMessage: '',
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

    addAuthor() {
      if (
        this.author.first_name &&
        this.author.last_name &&
        this.author.author_description
      ) {
        var data = {
          first_name: this.author.first_name,
          last_name: this.author.last_name,
          description: this.author.author_description
        };

        console.log(data)

        dataServices.createAuthor(data)
          .then(response => {
            this.author.id = response.data.id;
            console.log(response.data);
            alert('Author successfully added');
            this.retrieveAuthors();
          })
          .catch(err => {
            console.log(err);
            if (err.response.status == 500) {
              alert('Error the ')
            }
          });
      } else {
        alert('Please fill out all fields');
      }

    },

    // FOR AUTHOR
    retrieveAuthors() {
      dataServices.getAuthors()
        .then(response => {
          this.authors = response.data;
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },

    setActiveAuthor(author, index) {
      this.currentAuthor = author;
      this.currentAuthorIndex = author ? index : -1;
    },

    updateAuthor() {
      if (!this.varAuthor.first_name || !this.varAuthor.last_name || !this.varAuthor.description) {
        alert('Please fill out all fields');
      } else {
        var data = {
          first_name: this.varAuthor.first_name,
          last_name: this.varAuthor.last_name,
          description: this.varAuthor.description
        }
        dataServices.updateAuthor(this.currentAuthor.id, data)
          .then(response => {
            console.log(response.data);
            this.authorMessage = 'The author was updated successfully!';
            alert(`Author's info has been updated!`);
            this.retrieveAuthors();
          })
          .catch(e => {
            console.log(e);
          });
      }
    },

    deleteAuthor() {
      dataServices.deleteAuthor(this.currentAuthor.id)
        .then(response => {
          console.log(response.data);
          this.authorMessage = 'The author was deleted successfully!';
          alert(`Author has been deleted!`);
          this.retrieveAuthors();
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
    this.retrieveAuthors();
    this.authorMessage = '';
  },

};
</script>
  
<style></style>