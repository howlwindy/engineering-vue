import {
  E_LOCALE,
  E_LOCALE_FAKER,
  E_LOCALE_ICON,
  E_LOCALE_NAME,
  E_LOCALE_TINYMCE,
} from '@/enums'

export const C_LOCALE = {
  [E_LOCALE['zh-CN']]: {
    label: E_LOCALE_NAME[E_LOCALE['zh-CN']],
    flag: E_LOCALE_ICON[E_LOCALE['zh-CN']],
    tinymce: E_LOCALE_TINYMCE[E_LOCALE['zh-CN']],
    faker: E_LOCALE_FAKER[E_LOCALE['zh-CN']],
  },
  [E_LOCALE['en-US']]: {
    label: E_LOCALE_NAME[E_LOCALE['en-US']],
    flag: E_LOCALE_ICON[E_LOCALE['en-US']],
    tinymce: 'en_US',
    faker: 'en_US',
  },
} as const
