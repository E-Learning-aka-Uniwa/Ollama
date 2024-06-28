<script setup lang="ts">
import { onMounted, ref, toRefs } from "vue";
import ollama, { type ListResponse } from "ollama/browser";
import { useModelStore } from "@/stores/model";

const modelStore = useModelStore();
const { currentModel } = toRefs(modelStore);

const getModels = async () => {
  const response = await ollama.list();
  const mostRecentModel = response.models.reduce((a, b) =>
    a.modified_at > b.modified_at ? a : b,
  );
  modelStore.setCurrentModel(mostRecentModel.name);
  return response;
};

const data = ref<ListResponse | null>(null);

async function fetchData() {
  try {
    const response = await getModels();
    data.value = response;
  } catch (error) {
    console.log("Error fetching models. Retrying in 10 seconds.");
    setTimeout(fetchData, 10000);
  }
}

onMounted(() => {
  fetchData();
});
</script>

<template>
  <div id="modelSelectorContainer">
    <div id="modelSelector" class="flex flex-column h-10rem">
      <span class="text-lg font-bold">Model</span>
      <div v-if="!data">
        <Dropdown
          placeholder="Loading model..."
          loading
          class="w-full md:w-14rem"
        ></Dropdown>
      </div>
      <div v-else-if="data" class="flex">
        <Dropdown
          v-model="currentModel"
          :options="data.models"
          optionLabel="name"
          optionValue="model"
          placeholder="Select a model"
          class="w-full md:w-14rem"
        />
      </div>
    </div>
  </div>
</template>

<style scoped>
#modelSelectorContainer {
  display: flex;
}

#modelSelector {
  width: 100%;
  margin: 1rem;
}
</style>
