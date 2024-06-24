<script setup lang="ts">
import { ref } from 'vue';
import ollama from 'ollama';
const initialize = async () => {
    const response = await ollama.chat({
        model: 'phi3',
        messages: [{ role: 'user', content: `You're going to act as a teacher. You can't break character in any case. You're going to answer questions as if you're a teacher, remember that.`
         }]
    });
    console.log('Initialized');
    console.log(response.message.content)
}
initialize()
const chatInput = ref('Why is the sky blue?')
const messages = ref([{ role: 'agent', content: 'Hello, I am kand7dev. How can I help you today?'}]);
const currentOutputMessageContent = ref('')
const submitChat = async () => {
    const content = chatInput.value;
    chatInput.value = '';
    const inputMessage = { role: 'user', content };
    messages.value.push(inputMessage);
    const response = await ollama.chat({
        model: 'phi3',
        messages: [inputMessage],
        stream: true
    });
    for await (const part of response){
        currentOutputMessageContent.value += part.message.content
    }
    messages.value.push({ role: 'agent', content: currentOutputMessageContent.value })
    currentOutputMessageContent.value = ''
    }
</script>

<template>
    <div id ="chatBox">
        <div id="chatContainer">
            <div id="chatArea" ref="chatArea"></div>
            <div v-for="message in messages" :key="message.content">
                {{ message.content }}
            </div>
            <div v-if="currentOutputMessageContent">
                {{  currentOutputMessageContent }}
            </div>
        </div>
        <div id="inputArea">
            <Textarea v-model="chatInput" @keyup.enter="submitChat" id="chatInput" placeholder="Type a message..."></Textarea>
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