<template>
  <div id="cpf">
    <div class="div-titulo">
      <h4 class="titulo">Gerador de CNPJ</h4>
    </div>
    <div class="div-acoes">
      <span></span>
      <button class="div-btn" @click="gerarCPF">Gerar</button>
    </div>
    <div class="div-content">
      <span>{{ cpf }}{{ filter }}</span>
    </div>
  </div>
</template>

<script lang="ts">

import { defineComponent, ref, computed } from 'vue';

export default defineComponent({
  name: 'GeradorCpf',
  data() {
    return {
      cpf: '' as string,
      gerandocfp: '' as object | string | number,
      numero: '' as number | string,
      dig1: '' as number | string,
      dig2: '' as number | string,
      dig3: '' as number | string,
      numdvpri: '' as number | string,
      numdvseg: '' as number | string,
    };
  },

  computed: {
    filter(): string | any {
      const arr = this.cpf.split('');
      arr.splice(3, 0, '.');
      arr.splice(7, 0, '.');
      arr.splice(11, 0, '-');
      arr.join('');
      return arr;
    },
  },

  methods: {
    gerarCPF() {
      this.dig1 = String(this.numeroRandom());
      this.dig2 = String(this.numeroRandom());
      this.dig3 = String(this.numeroRandom());
      this.numdvpri = String(this.dvpri(this.dig1, this.dig2, this.dig3));
      this.numdvseg = String(this.dvseg(this.dig1, this.dig2, this.dig3, this.numdvpri));

      this.cpf = String(this.dig1 + this.dig2 + this.dig3 + this.numdvpri + this.numdvseg);
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
#cpf{
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 3rem;
  color: rgb(77, 76, 76);
}
</style>
