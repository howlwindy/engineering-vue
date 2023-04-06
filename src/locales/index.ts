import { C_LOCALE } from '@/consts'
import { E_LOCALE } from '@/types'
import { uLocaleLocalStorage } from '@/utils'
import { createI18n } from 'vue-i18n'

import enUS from './en-US'
import zhCN from './zh-CN'

export default createI18n({
  legacy: false,
  globalInjection: true,
  locale: uLocaleLocalStorage.value,
  fallbackLocale: C_LOCALE,
  messages: {
    [E_LOCALE['zh-CN']]: zhCN,
    [E_LOCALE['en-US']]: enUS,
  },
})
