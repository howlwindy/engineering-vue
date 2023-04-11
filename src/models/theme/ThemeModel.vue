<script setup lang="ts">
import { C_THEME } from '@/consts'
import { E_THEME } from '@/types'
import { uThemeLocalStorage } from '@/utils'
import { Icon } from '@iconify/vue'
import { usePreferredDark } from '@vueuse/core'
import { onMounted, ref, watch } from 'vue'

const isDark = usePreferredDark()

const data = ref<E_THEME>(uThemeLocalStorage.value)
const change = (val: E_THEME) => {
  data.value = val
  uThemeLocalStorage.value = val
}
onMounted(() => {
  watch(
    [uThemeLocalStorage, isDark],
    (v) => {
      if (v[0] === E_THEME.SYSTEM) {
        document.documentElement.className = v[1] ? E_THEME.DARK : ''
      } else {
        document.documentElement.className =
          v[0] === E_THEME.DARK ? E_THEME.DARK : ''
      }
    },
    { immediate: true }
  )
})
</script>
<template>
  <QBtn flat no-caps>
    <Icon :icon="C_THEME[data].icon" width="25" height="25" />
    <span class="ml-2">{{ $t(`global.locale.theme.${data}`) }}</span>
    <QMenu>
      <QList>
        <QItem v-for="v of Object.values(E_THEME)" :key="v" dense clickable @click="change(v as E_THEME)">
          <QItemSection>
            <Icon :icon="C_THEME[v].icon" width="25" height="25" />
          </QItemSection>
          <QItemSection no-wrap class="mr-2">{{
            $t(`global.locale.theme.${v}`)
          }}</QItemSection>
        </QItem>
      </QList>
    </QMenu>
  </QBtn>
</template>
