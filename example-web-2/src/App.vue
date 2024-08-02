<template>
  <div id="app">
    <main-section />
    <illustration-section />
  </div>
</template>

<script>
import MainSection from './components/MainSection.vue';

export default {
  name: 'App',
  components: {
    MainSection
  }
};
</script>

<style scoped>
#app {
  text-align: center;
  background-color: #0A0A0A;
  color: white;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}
</style>
