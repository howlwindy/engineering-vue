<script setup lang="ts">
import { useGlobalStore } from '@/store'

const globalStore = useGlobalStore()
</script>
<template>
  <QCard class="flex flex-col items-center">
    <QCardSection class="flex flex-col items-center">
      <h1 class="text-2xl font-bold">store</h1>
      <div class="flex justify-center">
        <span data-unit-test="pow">pow = {{ globalStore.countPow2Getter }}</span>
        <span data-unit-test="log">log = {{ globalStore.countLog2Getter }}</span>
      </div>
    </QCardSection>
    <QCardActions>
      <QBtn flat @click="
        globalStore.$patch({
          countState: ++globalStore.countState,
        })
      ">globalStore.countState = {{ globalStore.countState }}</QBtn>
    </QCardActions>
  </QCard>
</template>
