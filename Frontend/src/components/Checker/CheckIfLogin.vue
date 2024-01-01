<template>
    <ModalLoginReg ref="ModalLoginReg" :form1LoginState="true" @modalClosed="reOpen" />
</template>
<script>
import ModalLoginReg from '../Utilities/ModalLoginReg.vue';
import emitter from '../../eventBus';
// import { ref } from 'vue';
export default {
    components: {
        ModalLoginReg
    },
    data() {
        return {
            preventClose: true,
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
        console.log("check if login is mounted");
        emitter.on('loggedInSuccess', this.loggedInSuccess);
                
        if(this.state === 'guest'){
            this.$refs.ModalLoginReg.ShowLogRegModal = true;
        }

    },
    watch:
    {
        state(newVal){
            if(newVal === 'user' | newVal === 'admin' ){
                this.preventClose = false;
            }
            else{
                this.preventClose = true;
            }
        }
    }
    ,
    methods: {
        reOpen(){
            if(this.preventClose)
            this.$refs.ModalLoginReg.ShowLogRegModal = true;
        },
        loggedInSuccess(){
            this.preventClose = false
        }
    }
    ,
    beforeUnmount() {
        emitter.off('loggedInSuccess');
    }
}
</script>