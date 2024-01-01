<template>
    <h3 class="text-center p-5">Book(s) that you are not returned yet&#33;</h3>
    <div class="justify-content-center align-items-center px-5">
        <MDBTable responsive border striped hover class="MDBTable align-middle mb-3 bg-light">
            <thead class="bg-light" style="width: 100%;">
                <tr>
                    <th style="width: 25%;">Title - Author</th>
                    <th style="width: 10%;">Category</th>
                    <th style="width: 14%;">Rent Date</th>
                    <th style="width: 14%;">Due Date</th>
                    <th> Fee</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="book in loans " :key="book.id">
                    <!--title - author - image-->
                    <td>
                        <div class="d-flex align-items-center">
                            <!-- <img :src="book.book.image" alt="" style="width: 45px; height: 45px" class="rounded" /> -->
                            <div>
                                <p class="mb-0 fw-bold">{{ book.book.title }}</p>
                                <p v-for="author in book.book.authors" :key="author.id" class="text-muted mb-0">
                                    {{ author.first_name }} {{ author.last_name }}
                                </p>
                            </div>

                        </div>
                    </td>
                    <!--category-->
                    <td>
                        <p>{{ book.book.category }}</p>
                    </td>
                    <!--category-->
                    <td>
                        <p>{{ book.loan_date }}</p>
                    </td>
                    <!--due date-->
                    <td>
                        <p>{{ book.due_date }}</p>
                    </td>
                    <!--fee-->
                    <td>
                        <p>{{ book.fee / 1000 }}.000 VND</p>
                    </td>
                    <!--actions-->
                    <td>
                        <div class="d-flex align-item-center">
                            <div @click="RedueBook(book)">
                                <MDBBtn color="warning" size="sm">Re-due</MDBBtn>
                            </div>
                            <div @click="ReturnBook(book)">
                                <MDBBtn color="success" size="sm">Return</MDBBtn>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </MDBTable>
    </div>
    <p class="text-end d-block px-5">
        To see all the books that you have rented, click here: <router-link
            :to="{ name: 'LoanHistory', params: { username: this.$store.getters.getUserName } }">See Loan
            History</router-link>
    </p>
</template>

<script>
import dataService from '../../services/dataServices';
import {
    MDBTable,
    MDBBtn,

} from 'mdb-vue-ui-kit';


export default {
    name: 'UserDashBoard',
    data() {
        return {
            loans: null
        }
    },
    computed: {
        UserName() {
            return this.$store.getters.getUserName;
        }
    }
    ,
    components: {
        MDBTable,
        MDBBtn,

    },
    mounted() {
        this.getUser();
    },
    methods: {
        getUser() {
            dataService.getLoanByToken()
                .then(response => {
                    this.loans = response.data;
                    console.log(response.data);
                })
                .catch(e => {
                    console.log(e);
                });
        },
        ReturnBook(book) {
            // var data = {returned_date: new Date()}
            console.log(book.id);
            dataService.returnBookByToken(book.id).then((response) => {
                alert("You have successfully returned the book" + book.book.title);
                console.log(response);
                this.getUser();

            })
                .catch(error => {
                    console.log(error);
                    if (error.response.status == 402) {
                        alert("You have to pay the fee first");
                    }
                    else {
                        alert("Something went wrong, please contact the librarian");
                    }

                }
                )
        },
        RedueBook(book) {
            // var data ={id: this.loans.id}
            var data = { duration: 7 };
            dataService.extentDateByToken(book.id, data).then((response) => {
                alert("You have successfully re-due the book" + book.book.title);
                console.log(response);
                this.getUser();
            })
                .catch(error => {
                    alert("Something went wrong, please contact the librarian")
                    console.log(error)
                }
                )
        }
    },
}

</script>