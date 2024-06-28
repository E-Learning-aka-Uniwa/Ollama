<script setup lang="ts">
import { onMounted, ref, toRefs } from "vue";
import ollama from "ollama/browser";
import ChatMessage from "./ChatMessage.vue";
import { useModelStore } from "@/stores/model";

const modelStore = useModelStore();
const { currentModel } = toRefs(modelStore);

const chatInput = ref("");
const messages = ref([{ role: "", content: "" }]);
const isFetching = ref(true);

const currentOutputMessageContent = ref("");

onMounted(() => {
  initializeChat();
});
const submitChat = async () => {
  const content = chatInput.value;
  chatInput.value = "";
  const inputMessage = { role: "user", content };
  messages.value.push(inputMessage);
  const response = await ollama.chat({
    model: currentModel.value,
    messages: [inputMessage],
    stream: true,
  });
  for await (const part of response) {
    currentOutputMessageContent.value += part.message.content;
  }
  messages.value.push({
    role: "agent",
    content: currentOutputMessageContent.value,
  });
  currentOutputMessageContent.value = "";
};

async function initializeChat() {
  try {
    const response = await ollama.chat({
      model: "phi3:latest",
      messages: [
        {
          role: "user",
          content: `You're a personal AI teacher. You can't break character. You're going to provide information about topics the user asks about. Start by introduction yourself.`,
        },
      ],
    });
    messages.value[0] = { role: "agent", content: response.message.content };
    isFetching.value = false;
  } catch (error) {
    console.log("Error initializing chat. Retrying in 30 seconds.");
    setTimeout(initializeChat, 30000);
  }
}
</script>

<template>
  <div id="chatBox">
    <div id="chatContainer">
      <div id="chatArea" ref="chatArea"></div>
      <div
        v-if="!isFetching"
        v-for="message in messages"
        :key="message.content"
      >
        <ChatMessage :message="message" />
      </div>
      <div v-if="currentOutputMessageContent">
        <ChatMessage
          :message="{ role: 'agent', content: currentOutputMessageContent }"
        />
      </div>
    </div>
    <div id="inputArea">
      <Textarea
        v-model="chatInput"
        @keyup.enter="submitChat"
        id="chatInput"
        placeholder="Type a message..."
      ></Textarea>
      <Button @click="submitChat" id="submitButton">Submit</Button>
    </div>
  </div>
</template>

<methods>

</methods>

<style scoped>
#chatBox {
  display: flex;
  height: 100%;
  flex-direction: column;
}

#chatContainer {
  position: relative;
  width: 100%;
  height: calc(100% - 100px);
  border: 1px solid grey;
  border-radius: 8px;
  padding: 10px;
}

#chatArea {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  overflow-y: auto;
}

#inputArea {
  display: flex;
  height: 100px;
  width: 100%;
  padding: 10px;
  align-items: space-between;
}

#chatInput {
  width: calc(100% - 82px);
  height: 100%;
  padding: 10px;
  margin-right: 10px;
}
</style>
