<template>
  <div class="home">
    <GeradorCpf/>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import GeradorCpf from '@/components/GeradorCpf.vue';

export default defineComponent({
  name: 'HomeView',
  components: {
    GeradorCpf,
  },
});
</script>
