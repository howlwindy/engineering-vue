import { E_THEME, E_THEME_ICON } from '@/enums'

export const C_THEME = {
  [E_THEME.LIGHT]: {
    icon: E_THEME_ICON.LIGHT,
  },
  [E_THEME.DARK]: {
    icon: E_THEME_ICON.DARK,
  },
  [E_THEME.SYSTEM]: {
    icon: E_THEME_ICON.SYSTEM,
  },
} as const
