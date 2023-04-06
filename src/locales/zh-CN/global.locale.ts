import { E_THEME } from '@/types'

export default {
  locale: {
    label: '简体中文',
    tinymce: 'zh_CN',
    faker: 'zh_CN',
    theme: {
      [E_THEME.LIGHT]: '浅色模式',
      [E_THEME.DARK]: '深色模式',
      [E_THEME.SYSTEM]: '跟随系统',
    },
  },
}
