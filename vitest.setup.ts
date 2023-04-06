import i18n from '@/locale'
import { config } from '@vue/test-utils'

config.global.plugins = [i18n]
config.global.mocks = {
  $t: vi.fn((str: string) => i18n.global.t(str)),
  $tm: vi.fn((str: string) => i18n.global.rt(str)),
  $rt: vi.fn((str: string) => i18n.global.tm(str)),
}
