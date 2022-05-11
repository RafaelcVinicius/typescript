<template>
  <div>
    <h4>Gerador de CNPJ</h4>
    <button @click="gerarCPF">Gerar</button>
    <span>{{ dig1}} {{dig2}} {{dig3}}</span>
  </div>
</template>

<script lang="ts">

import { defineComponent, ref } from 'vue';

export default defineComponent({
  name: 'possoUm',
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
      // this.numdvseg = String(this.dvseg(this.dig1, this.dig2, this.dig3, this.numdvpri));

      // this.cpf = this.dig1 + this.dig2 + this.dig3 + this.numdvpri + this.numdvseg;
    },

    numeroRandom() {
      this.numero = String(Math.floor(Math.random() * 99));
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
      const j = 0;
      const i = 10;
      const nums = dig1.split('').concat(dig2.split(''), dig3.split(''));
      for (i; i >= 2; i - 1) {
        console.log(i);
        x += Number(nums[j + 1]) * i;
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
      const j = 0;
      const i = 11;
      const nums = dig1.split('').concat(dig2.split(''), dig3.split(''));
      nums[9] = numdvpri;
      for (i; i >= 2; i - 1) {
        x += Number(nums[j + 1]) * i;
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
