import { C_LOCALE } from '@/consts'
import { E_LOCALE, E_LOCAL_STORAGE, E_SESSION_STORAGE, E_THEME } from '@/types'
import { RemovableRef, useStorage } from '@vueuse/core'
import { watch } from 'vue'

export const uLocaleLocalStorage: RemovableRef<E_LOCALE> = useStorage<E_LOCALE>(
  E_LOCAL_STORAGE.LOCALE,
  localStorage.getItem(E_LOCAL_STORAGE.LOCALE) as E_LOCALE,
  localStorage
)
watch(
  uLocaleLocalStorage,
  (v) => {
    if (!Object.keys(C_LOCALE).includes(v)) {
      localStorage.setItem(E_LOCAL_STORAGE.LOCALE, Object.keys(C_LOCALE)[0])
    }
  },
  { immediate: true }
)

export const uThemeLocalStorage: RemovableRef<E_THEME> = useStorage<E_THEME>(
  E_LOCAL_STORAGE.THEME,
  localStorage.getItem(E_LOCAL_STORAGE.THEME) as E_THEME,
  localStorage
)

watch(
  uThemeLocalStorage,
  (v) => {
    if (!Object.values(E_THEME).includes(v)) {
      localStorage.setItem(E_LOCAL_STORAGE.THEME, E_THEME.LIGHT)
    }
  },
  {
    immediate: true,
  }
)
