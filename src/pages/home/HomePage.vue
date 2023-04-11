<script setup lang="ts">
import StoreModel from '@/models/store/StoreModel.vue'
</script>
<template>
  <div class="flex flex-col items-center">
    <h1 class="home text-center text-3xl text-sky-500">
      这些都是i18n和pinia的例子
    </h1>
    <QCard flat>
      <QCardActions>
        <QBtn flat target="_blank" href="/reports/unit/index.html">unit报告</QBtn>
        <QBtn flat target="_blank" href="/reports/e2e/index.html">e2e报告</QBtn>
      </QCardActions>
    </QCard>
    <StoreModel />
  </div>
</template>
