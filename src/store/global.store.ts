import { C_LOCALE } from '@/consts'
import { uFaker } from '@/utils'
import { uLocaleLocalStorage } from '@/utils'
import { faker } from '@faker-js/faker'
import { defineStore } from 'pinia'

faker.setLocale(C_LOCALE[uLocaleLocalStorage.value].faker)

interface IFakers {
  sidenav: string[]
  content: string[]
}
interface IGlobalState {
  faker: IFakers
  countState: number
}
export const useGlobalStore = defineStore('global', {
  state: (): IGlobalState => ({
    faker: uFaker(),
    countState: 1,
  }),
  getters: {
    countPow2Getter: (state) => Math.pow(state.countState, 2),
    countLog2Getter: (state) => Math.log(state.countState),
  },
})
