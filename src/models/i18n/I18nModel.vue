<script setup lang="ts">
import { C_LOCALE } from '@/consts'
import { useGlobalStore } from '@/store'
import { E_LOCALE } from '@/types'
import { uFaker, uLocaleLocalStorage } from '@/utils'
import { faker } from '@faker-js/faker'
import { Icon } from '@iconify/vue'
import { ref } from 'vue'
import { useI18n } from 'vue-i18n'

const globalStore = useGlobalStore()
const { locale } = useI18n()

const data = ref<E_LOCALE>(uLocaleLocalStorage.value as E_LOCALE)
const change = (val: E_LOCALE) => {
  data.value = val
  uLocaleLocalStorage.value = val
  locale.value = val
  faker.setLocale(C_LOCALE[val].faker)
  globalStore.$patch({
    faker: uFaker(),
  })
}
</script>
<template>
  <QBtn flat class="text-slate-900" no-caps>
    <Icon :icon="C_LOCALE[data].flag" width="25" height="25" />
    <span class="ml-2">{{ C_LOCALE[data].label }}</span>
    <QMenu>
      <QList>
        <QItem v-for="(v, k) of C_LOCALE" :key="k" v-close-popup dense clickable @click="change(k)">
          <QItemSection>
            <Icon :icon="v.flag" width="25" height="25" />
          </QItemSection>
          <QItemSection class="whitespace-nowrap">{{ v.label }}</QItemSection>
        </QItem>
      </QList>
    </QMenu>
  </QBtn>
</template>
