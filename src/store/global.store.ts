import { defineStore } from 'pinia'

interface IGlobalState {
  countState: number
}
export const useGlobalStore = defineStore('global', {
  state: (): IGlobalState => ({
    countState: 1,
  }),
  getters: {
    countPow2Getter: (state) => Math.pow(state.countState, 2),
    countLog2Getter: (state) => Math.log(state.countState),
  },
})
