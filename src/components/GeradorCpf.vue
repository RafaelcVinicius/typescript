<template>
  <div id="cpf">
    <h4 class="titulo">Gerador de CNPJ</h4>
    <div class="div-btn">
      <button @click="gerarCPF">Gerar</button>
    </div>
    <div class="div-content">
      <span>{{ cpf }}</span>
    </div>
  </div>
</template>

<script lang="ts">

import { defineComponent, ref } from 'vue';

export default defineComponent({
  name: 'GeradorCpf',
  setup() {
    // const num = ref<number | string>(0)
  },
  data() {
    return {
      cpf: '' as string | number,
      gerandocfp: '' as object | string | number,
      numero: '' as number | string,
      dig1: '' as number | string,
      dig2: '' as number | string,
      dig3: '' as number | string,
      numdvpri: '' as number | string,
      numdvseg: '' as number | string,
    };
  },

  methods: {
    gerarCPF() {
      this.dig1 = String(this.numeroRandom());
      this.dig2 = String(this.numeroRandom());
      this.dig3 = String(this.numeroRandom());
      this.numdvpri = String(this.dvpri(this.dig1, this.dig2, this.dig3));
      this.numdvseg = String(this.dvseg(this.dig1, this.dig2, this.dig3, this.numdvpri));

      this.cpf = this.dig1 + this.dig2 + this.dig3 + this.numdvpri + this.numdvseg;
    },

    numeroRandom() {
      this.numero = String(Math.floor(Math.random() * 999));
      if (this.numero.length === 2) {
        this.numero = '0'.concat(this.numero);
      } else if (this.numero.length === 1) {
        this.numero = '00'.concat(this.numero);
      }
      return this.numero;
    },

    dvpri(dig1: string, dig2: string, dig3: string) {
      let x = 0;
      let ret = 0;
      let j = 0;
      const nums = dig1.split('').concat(dig2.split(''), dig3.split(''));
      for (let i = 10; i >= 2; i -= 1) {
        x += Number(nums[j]) * i;
        j += 1;
      }
      const y = x % 11;
      if (y < 2) {
        ret = 0;
      } else {
        ret = 11 - y;
      }
      return ret;
    },

    dvseg(dig1: string, dig2: string, dig3: string, numdvpri: string) {
      let x = 0;
      let ret = 0;
      let j = 0;
      const nums = dig1.split('').concat(dig2.split(''), dig3.split(''));
      nums[9] = numdvpri;
      for (let i = 11; i >= 2; i -= 1) {
        x += Number(nums[j]) * i;
        j += 1;
      }
      const y = x % 11;
      if (y < 2) {
        ret = 0;
      } else {
        ret = 11 - y;
      }
      return ret;
    },
  },

});
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300&display=swap');
  body{
    font-family: 'Poppins', sans-serif;
    letter-spacing: 1px;
  }
  #cpf{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 2rem;
    color: rgb(77, 76, 76);
  }
  .titulo{
    font-size: 25px;
  }
  .div-btn{
    max-width: 200px;
    width: 100%;
  }
  .div-btn button{
    width: 100%;
    height: 40px;
    border: none;
    background-color: rgb(122, 108, 190);
    color: #fff;
    border-radius: 8px;
    font-size: 16px;
    box-shadow: 3px 3px 10px rgb(156, 156, 156);
    letter-spacing: 2px;
  }
  .div-content{
    display: flex;
    justify-content: center;
    align-items: center;
    max-width: 450px;
    width: 100%;
    height: 150px;
    background-color: rgb(241, 241, 241);
    border: 1px solid rgb(145, 145, 145);
    font-size: 35px;
  }
</style>
