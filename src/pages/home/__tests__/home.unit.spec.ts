import { mount } from '@vue/test-utils'
import HomePage from '@/pages/home/HomePage.vue'
import StoreModel from '@/models/store/StoreModel.vue'
import I18nModel from '@/models/i18n/I18nModel.vue'

describe('HomePage', () => {
  it('render', () => {
    const wrapper = mount(HomePage, {
      shallow: true
    })
    expect(wrapper.findComponent(StoreModel).exists()).toBe(true)
    expect(wrapper.findComponent(I18nModel).exists()).toBe(true)
    expect(wrapper.text()).toContain('这些都是i18n和pinia的例子')
  })
})
