<template>
    <h3 class="text-center p-5 text-capitalize">All Books That you have rented&#33;</h3>
    <div class="justify-content-center align-items-center px-5">
        <MDBTable responsive border striped hover class="MDBTable align-middle mb-3 bg-light">
            <thead class="bg-light" style="width: 100%;">
                <tr>
                    <th style="width: 25%;">Title - Author</th>
                    <th style="width: 10%;">Category</th>
                    <th style="width: 18%;">Rent Date</th>
                    <th style="width: 18%;">Return Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <!--add styling for the row depend on the state of the return date-->
                <tr v-for="book in loans " :key="book.id"
                 :class="{'table-success': book.returned_date !== null, 'table-warning': book.returned_date === null}"
                 >
                    <!--title - Author-->
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
                    <!--Category-->
                    <td>
                        <p>{{ book.book.category }}</p>
                    </td>
                    <!--Rent Date-->
                    <td>
                        <p>{{ book.loan_date }}</p>
                    </td>
                    <td v-if="book.returned_date !== null">
                        <p>{{ book.returned_date }}</p>
                    </td>
                    <td v-else>
                        <p>Not Returned Yet</p>
                    </td>
                    <!--status-->
                    <td>
                        <MDBBadge v-if="book.returned_date === null" badge="danger" pill class="d-inline">
                            Not Returned
                        </MDBBadge>
                        <MDBBadge v-else badge="success" pill class="d-inline">
                            Returned
                        </MDBBadge>
                        <MDBBadge v-if="parseInt(book.fee) !== 0" badge="danger" pill class="d-inline">
                            Fee not payed.
                        </MDBBadge>
                    </td>
                    <!-- <td>
                        <div class="d-flex align-item-center">
                            <div @click="RedueBook(book)">
                                <MDBBtn color="warning" size="sm">Re-due</MDBBtn>
                            </div>
                            <div @click="ReturnBook(book)">
                                <MDBBtn color="success" size="sm">Return</MDBBtn>
                            </div>
                        </div>
                    </td> -->
                </tr>
            </tbody>
        </MDBTable>
    </div>

    </template>
    <script>
    import dataService from '../../services/dataServices';
    import {
        // MDBBtn, 
        MDBBadge,
        MDBTable} from 'mdb-vue-ui-kit';
    export default {
        name: "UserDashBoard",
        components: {
            MDBBadge,
            // MDBBtn,
            MDBTable
        },
        data() {
            return {
                loans: [],
            }
        },
        computed: {
            UserName() {
                return this.$store.getters.getUserName;
            },
            UserID() {
                return this.$store.getters.getUserID;
            }
        },
        methods: {
            async GetLoans() {
                await dataService.getLoanHistoryByToken()
                    .then(response => {
                        this.loans = response.data;
                    })
                    .catch(e => {
                        console.log(e);
                    });
            },
        },
        mounted() {
            this.GetLoans();
        }
    }
    </script>
    <style scoped>
    /* .navbar {
        position: static !important;
    } */

    #table {
        display: block !important;
    }

    #Footer {
        display: block !important;
        /* position: fixed; */
        left: 0;
        bottom: 0;
        width: 100%;
    }
    </style>
 