<script setup lang="ts">
import { uFaker, uLocaleLocalStorage } from '@/utils'
import { faker } from '@faker-js/faker'
import { Icon } from '@iconify/vue'
import { QBtn } from 'quasar'
import { ref } from 'vue'

import { useGlobalStore } from '@/store/global.store'

const globalStore = useGlobalStore()
</script>
<template>
  <QBtn
    flat
    class="text-slate-900"
    no-caps
    @click="
      globalStore.$patch({
        faker: uFaker(),
      })
    "
  >
    <Icon
      icon="line-md:coffee-half-empty-twotone-loop"
      width="25"
      height="25"
    />
  </QBtn>
</template>
