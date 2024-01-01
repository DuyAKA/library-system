<template>
    <!-- <MDBBtn color="primary" @click="showModalInform = true">Modal</MDBBtn> -->
    <MDBModal v-model="showModalInform">
        <MDBModalHeader>
            <MDBModalTitle> {{header}} </MDBModalTitle>
        </MDBModalHeader>
        <MDBModalBody>{{content}}</MDBModalBody>
        <MDBModalFooter>
            <MDBBtn color="secondary" @click="showModalInform = false">Close</MDBBtn>
        </MDBModalFooter>
    </MDBModal>
</template>
<script>
import {
    MDBModal,
    MDBModalHeader,
    MDBModalTitle,
    MDBModalBody,
    MDBModalFooter,
    MDBBtn
} from 'mdb-vue-ui-kit';
// import emitter from '@/eventBus';
//   import { ref } from 'vue';
export default {
    components: {
        MDBModal,
        MDBModalHeader,
        MDBModalTitle,
        MDBModalBody,
        MDBModalFooter,
        MDBBtn
    },
    data() {
        return {
            showModalInform: false
        };
    },
    props: {
        header: {
            type: String,
            default: 'Header'
        },
        content: {
            type: String,
            default: 'Content'
        }
    },
    
    mounted() {
        console.log('Modal Inform is mounted');
    },
    updated() {
        this.$emit('modalInformClosed');
    }
};
</script>