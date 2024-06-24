<script setup lang="ts">
import ChatBox from "../components/ChatBox.vue";
</script>

<template>
  <main>
    <div class="flex-grid">
      <div class="main-col">
        <ChatBox></ChatBox>
      </div>
    </div>
  </main>
</template>


<style scoped>
.flex-grid {
  display: flex;
  height: 100%;
}
.main-col {
  width: 75%;
}
.right-col {
  width: 25%;
}
</style>