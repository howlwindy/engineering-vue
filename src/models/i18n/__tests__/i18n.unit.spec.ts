import i18n from '@/locale'
import { mount } from '@vue/test-utils'

import I18nModel from '@/models/i18n/I18nModel.vue'

describe('I18nModel', () => {
  const wrapper = mount(I18nModel)
  const zhCN = wrapper.get('[data-unit-test=zh-CN]')
  const enUS = wrapper.get('[data-unit-test=en-US]')
  it('button render', () => {
    expect(zhCN.text()).toBe('zh-CN')
    expect(enUS.text()).toBe('en-US')
  })
  it('button click', async () => {
    await zhCN.trigger('click')
    expect(i18n.global.locale.value).toBe('zh-CN')
    await enUS.trigger('click')
    expect(i18n.global.locale.value).toBe('en-US')
  })
})
