<template>
    <modalInform ref="modalInform" 
    header="Alert"
    content="You are not authorized to access this page."
    @modalInformClosed="goBackToHome"
    ></modalInform>
</template>
<script>
import router from '@/router';
import modalInform from './ModalInform.vue';
// import emitter from '@/eventBus';
// import { ref } from 'vue';
export default {
    components: {
        modalInform
    },
    data() {
        return {
            counter : 0,
        }
    },
    computed: {

        state() {
            return this.$store.getters.getLoginState;
        }
        //Note for Toan:
        //fix problematic LoginState.
        //Quang.

    },
    mounted() {

        if (this.state !== 'admin') {
            this.$refs.modalInform.showModalInform = true;
        }
    },
    methods: {
        goBackToHome() {
            
            if(this.counter > 0){
                router.push('/');    
            }
            this.counter++;
        }
    },

    // beforeUnmount() {
    //     emitter.off('modalInformClosed');
    //     console.log("beforeUnmount");
    //     console.log("beforeUnmount");
    // }
}
</script>