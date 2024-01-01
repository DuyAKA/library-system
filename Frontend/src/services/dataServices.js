import http from '../http-common';
//import axios from 'axios';

class dataServices{
    //get all book
    getBooks(){
        return http.get("/book");
    }
    // get book by id
    getBook(id) {
        return http.get(`/book/${id}`);
      }
    //create a book with data
    createBook(data) {
        return http.post('/book', data);
      }
    //delete a book by id
    deleteBook(id) {
        return http.delete(`/book/${id}`);
      }
    //update a book by id
    updateBook(id,data){
        return http.put(`/book/${id}`,data);
    }
    //get all author
    getAuthors(){
        return http.get("/author");
    }
    //create author
    createAuthor(data) {
        return http.post('/author', data);
      }

    //delete author by id
    deleteAuthor(id) {
        return http.delete(`/author/${id}`);
      }
    //update author by id
    updateAuthor(id,data){
        return http.put(`/author/${id}`,data);
    } 
    //create link book and author
    createBookAuthor(data) {
        return http.post('/book_author', data);
      }
    //get all link book and author
    getBookAuthors(){
        return http.get("/book_author");
    }
    //delete link bw book and author
    deleteBookAuthor(book_id, author_id) {
        return http.delete(`/book_author/${book_id}/${author_id}`);
      }
    //update link bw book and author
    updateBookAuthor(book_id, author_id,data){
        return http.put(`/book_author/${book_id}/${author_id}`,data);
    } 
    //create a loan
    createLoan(data){
        return http.post(
            'loan/make_loan',data
        );
    }
    //search book by title
    getBooksByTitle(title){
        return http.get(`/search/byBookTitle?title=${title}`);
    }
    //search book by author
    getBooksByAuthor(author){
        return http.get(`/search/byAuthorName?authorName=${author}`);
    }
    getUserByUserName(){
        return http.get(`/member/member_info`);
    }
    getAllCurrentLoaned(){
      return http.get(`/loan/loaned`);
    }

    deleteLoan(id) {
      return http.delete(`/loan/${id}`);
    }
    
    updateLoan(id,data){
      return http.put(`/loan/${id}`,data);
  } 
    getAllLoan(){
      return http.get(`/loan`);
    }
    getLoanByToken(){
      return http.get(`/member/loan`);
    }
    getLoanHistoryByToken(){
      return http.get(`/member/loan_history`);
    }
    returnBookByToken(loan_id){
      return http.put(`/loan/finish/${loan_id}`);
    }
    extentDateByToken(loan_id,data){
      return http.put(`/loan/expand/${loan_id}`, data);
    }
    updateUserInfo(data){
      return http.put(`/member/member_info`, data);
    }
    forgotPassword(email){
      return http.post('/reset/forgot-password',email);
    }
    resetPassword(data){
      return http.post('/reset/reset-password',data);
    }

}
export default new dataServices();