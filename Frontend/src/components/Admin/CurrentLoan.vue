<template>
  <h1 class="text-center">Current Loan</h1>
  <!-- REMOVE AND UPDATE -->
  <div class="p-4 justify-content-center">
    <MDBRow>
    <div style="flex: 1;">
      <ul class="list-group" style="height: 100vh; overflow-y: auto;">
        <li class="list-group-item" :class="{ active: index == currentLoanIndex }" v-for="(loan, index) in loans"
          :key="index" @click="setActiveLoan(loan, index)">
          Book's title: {{ loan.book.title }} , Username: {{ loan.member_username }} -- <strong>More info>></strong>
        </li>
      </ul>
    </div>

    <div style="flex: 1;">

      <div v-if="currentLoan">
        <h4>Loan's Information:</h4>
        <div>
          <label><strong> ID:</strong></label> {{ currentLoan.id }}
        </div>
        <div>
          <label><strong>Book ID:</strong></label> {{ currentLoan.book_id }}
        </div>
        <div>
          <label><strong>Book's Title:</strong></label> {{ currentLoan.book.title }}
        </div>
        <div>
          <label><strong>Username:</strong></label> {{ currentLoan.member_username }}
        </div>
        <div>
          <label><strong>Returned Date:</strong></label> {{ currentLoan.returned_date }}
        </div>
        <div>
          <label><strong>Loan Date:</strong></label> {{ currentLoan.loan_date }}
        </div>
        <div>
          <label><strong>Due Date:</strong></label> {{ currentLoan.due_date }}
        </div>
        <div>
          <label><strong>Fee:</strong></label> {{ currentLoan.fee }}
        </div>
        <button class="badge badge-danger mr-2" @click="deleteLoan">Delete</button>
        <button v-if="currentLoan.fee !== 0 " class="badge badge-success mr-2" @click="clearFee(currentLoan)">Clear Fee</button>
        <form>
          <br>
          <label><strong>Modify Loan</strong></label>
          <div class="form-group">
            <label for="BookID">Book ID</label>
            <input type="text" class="form-control" id="book_id" v-model="varLoan.book_id" />
          </div>
          <div class="form-group">
            <label for="member_username">Member Username</label>
            <input type="text" class="form-control" id="member_username" v-model="varLoan.member_username" />
          </div>
          <div class="form-group">
            <label for="returned_date">Returned Date</label>
            <input type="date" class="form-control" id="returned_date" v-model="varLoan.returned_date" />
          </div>
          <div class="form-group">
            <label for="loan_date">Loan Date</label>
            <input type="date" class="form-control" id="loan_date" v-model="varLoan.loan_date" />
          </div>
          <div class="form-group">
            <label for="due_date">Due Date</label>
            <input type="date" class="form-control" id="due_date" v-model="varLoan.due_date" />
          </div>
          <div class="form-group">
            <label for="fee">Fee</label>
            <input class="form-control" id="fee" v-model="varLoan.fee" />
          </div>
        </form>
        <button type="submit" class="badge badge-success" @click="updateLoan">Update</button>
      </div>

      <div v-else>
        <br />
        <p>Click on a loan...</p>
      </div>
    </div>
  </MDBRow>
  </div>
</template>

<script>
import { MDBRow } from 'mdb-vue-ui-kit';
import dataServices from '../../services/dataServices';
// import {
//     MDBTable
// } from 'mdb-vue-ui-kit';


export default {
  name: 'UserDashBoard',
  data() {
    return {
      loans: {},
      currentLoan: null,
      varLoan: {},
      currentLoanIndex: -1,
      loanMessage: '',

    }
  },
  computed: {

  }
  ,
  components: {
    MDBRow
},
  mounted() {
    this.retrieveCurrentLoan();
    this.loanMessage = '';
  },
  methods: {
    retrieveCurrentLoan() {
      dataServices.getAllCurrentLoaned().then(response => {
        console.log("Current Loan");
        console.log(response.data);
        this.loans = response.data;
      })
    },
    setActiveLoan(loan, index) {
      this.currentLoan = loan;
      this.currentLoanIndex = loan ? index : -1;
    },

    updateLoan() {
      var data = {
        book_id: this.varLoan.book_id,
        member_username: this.varLoan.member_username,
        returned_date: this.varLoan.returned_date,
        loan_date: this.varLoan.loan_date,
        due_date: this.varLoan.due_date,
        fee: this.varLoan.fee
      }

      dataServices.updateLoan(this.currentLoan.id, data)
        .then(response => {
          console.log(response.data);
          this.loanMessage = 'The loan was updated successfully!';
          alert(`Loan's info has been updated!`);
          this.retrieveCurrentLoan();
        })
        .catch(e => {
          console.log(e);
        });


    },

    deleteLoan() {
      dataServices.deleteLoan(this.currentLoan.id)
        .then(response => {
          console.log(response.data);
          this.loanMessage = 'The loan was deleted successfully!';
          alert(`The loan has been deleted!`);
          this.retrieveCurrentLoan();
        })
        .catch(e => {
          console.log(e);
        });
    },
    reloadPage() {
      location.reload();
    },
    clearFee(currentLoan){
      var data = {
        fee: 0
      }

      dataServices.updateLoan(currentLoan.id, data)
        .then(response => {
          console.log(response.data);
          this.loanMessage = 'The loan was updated successfully!';
          alert(`This Loan's fee, has been cleared`);
          this.retrieveCurrentLoan();
        })
        .catch(e => {
          console.log(e);
        });
    }



  }

}
</script>