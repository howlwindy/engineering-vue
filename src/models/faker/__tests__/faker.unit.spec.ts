import { FakerModel } from '@/models'
import { mount } from '@vue/test-utils'

describe('FakerModel', () => {
  const wrapper = mount(FakerModel)
  it('render', () => {
    expect(wrapper.exists()).toBeTruthy()
  })
})
