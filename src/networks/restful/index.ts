export default 'default'
import { createFetch } from '@vueuse/core'

export const SERVICE = createFetch({
  // vitest在启动时环境变量是test
  baseUrl: import.meta.env.VITE_NODE_ENV === 'test' ? import.meta.env.VITE_BASE_URL : window.location.origin,
  options: {
    timeout: TIME_OUT,
    // fetch:,
    // immediate: false,
    // refetch:,
    // initinalData:,
    async beforeFetch({ url, options, cancel }) {
      const token = sessionStorage.getItem('token')
      if (!APIS_UNNECESSARY_TOKEN.some((v) => v === url.split('//')[1].split('/').slice(1).join('/'))) {
        token
          ? (options.headers = {
              ...options.headers,
              authorization: token,
            })
          : cancel()
      }
      return { options }
    },
    async afterFetch({ response, data }) {
      return { response, data }
    },
    async onFetchError({ data, response, error }) {
      return { data, response, error }
    },
  },
  fetchOptions: {
    // body: ,
    // cache: ,
    // credentials:,
    // headers: ,
    // integrity:,
    // keepalive:,
    // method:,
    mode: 'cors',
    // redirect:,
    // referrer:,
    // referrerPolicy:,
    // signal:,
    // window:
  },
})
export const GET = <T = IRes>(url: string, params?: object) => {
  const ENTRIES = Object.entries(params || {})
  const QUERIES = ENTRIES.map((v) => `${v[0]}=${v[1]}`)
  return SERVICE<T>(`${url}${QUERIES.length > 0 ? `?${QUERIES.join('&')}` : ''}`)
}
export const POST = <T = IRes>(url: string, payload?: unknown) => SERVICE<T>(url).post(payload)
