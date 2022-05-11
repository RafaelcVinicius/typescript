<template>
  <div class="home">
    <PossoUm/>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import PossoUm from '@/components/possoUm.vue';

export default defineComponent({
  name: 'HomeView',
  components: {
    PossoUm,
  },
});
</script>
