import { useGlobalStore } from '@/store'
import { createTestingPinia } from '@pinia/testing'
import { mount } from '@vue/test-utils'

import StoreModel from '@/models/store/StoreModel.vue'

describe('StoreModel', () => {
  const wrapper = mount(StoreModel, {
    plugins: [createTestingPinia()],
  })
  const count = wrapper.get('button')
  const pow = wrapper.get('[data-unit-test=pow]')
  const log = wrapper.get('[data-unit-test=log]')
  const globalStore = useGlobalStore()
  it('render', () => {
    expect(count.text()).toBe('globalStore.countState = 1')
    expect(pow.text()).toBe('pow = 1')
    expect(log.text()).toBe('log = 0')
  })
  it('click', async () => {
    await count.trigger('click')
    expect(count.text()).toContain('2')
    expect(pow.text()).toContain('4')
    expect(log.text()).toContain('0.6931471805599453')
    await count.trigger('click')
    await count.trigger('click')
    await count.trigger('click')
    expect(count.text()).toContain('5')
    expect(pow.text()).toContain('25')
    expect(log.text()).toContain('1.6094379124341003')
  })
})
