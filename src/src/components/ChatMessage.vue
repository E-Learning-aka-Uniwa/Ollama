<script setup lang="ts">
import type { Message } from "ollama/browser";
import { computed } from "vue";

interface Props {
  message: Message;
}

const props = defineProps<Props>();

const messageClass = computed(() => {
  return props.message.role === "user"
    ? "message userMessage"
    : "message agentMessage";
});

const avatarClass = computed(() => {
  return props.message.role === "user" ? "userAvatar" : "agentAvatar";
});

const avatarIconClass = computed(() => {
  return props.message.role === "user" ? "pi pi-user" : "pi pi-desktop";
});
</script>

<template>
  <div :class="messageClass">
    <Avatar :class="avatarClass"
      ><i :class="avatarIconClass" style="font-size: 1rem"></i
    ></Avatar>
    <div class="messageContent">{{ props.message.content }}</div>
  </div>
</template>

<style scoped>
.message {
  display: flex;
  justify-content: flex-start;
  padding: 10px;
  margin: 10px;
  border-radius: 10px;
}

.messageContent {
  margin: 0 1rem;
  padding: 15px;
}

.userMessage {
  background-color: grey;
}

.userAvatar {
  min-width: 2rem;
  background-color: rgba(19, 199, 19, 0.63);
}

.agentMessage {
  background-color: rgba(53, 48, 48, 0.911);
}

.agentAvatar {
  min-width: 2rem;
  background-color: rgb(80, 80, 226);
}
</style>
