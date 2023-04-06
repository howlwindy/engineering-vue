import { E_LOCALE, E_THEME } from '@/types'

export const C_LOCALE = {
  [E_LOCALE['zh-CN']]: {
    label: '简体中文',
    flag: 'flag:cn-4x3',
    tinymce: 'zh_CN',
    faker: 'zh_CN',
  },
  [E_LOCALE['en-US']]: {
    label: 'English',
    flag: 'flag:um-4x3',
    tinymce: 'en_US',
    faker: 'en_US',
  },
} as const

export const C_THEME = {
  [E_THEME.LIGHT]: {
    icon: 'line-md:moon-alt-to-sunny-outline-loop-transition',
  },
  [E_THEME.DARK]: {
    icon: 'line-md:moon-alt-loop',
  },
  [E_THEME.SYSTEM]: {
    icon: 'line-md:laptop',
  },
} as const
