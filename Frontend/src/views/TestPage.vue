<template>
  <div>
    <select v-model="searchByAuthor" class="form-select" aria-label="Default select example">
      <option value="true">By Author</option>
      <option value="false">By Title</option>
    </select>
    <p>Search by author? {{ searchByAuthor }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchByAuthor: true,
    };
  },
  watch: {
    searchByAuthor(value) {
      if (value === 'true') {
        this.searchByAuthor = true;
        console.log("choose title");
      } else if (value === 'false') {
        this.searchByAuthor = false;
        console.log("choose author");
      }
    },
  },
};
</script>
