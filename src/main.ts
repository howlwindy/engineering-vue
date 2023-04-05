import '@quasar/extras/material-icons/material-icons.css'
import { createPinia } from 'pinia'
import { Quasar } from 'quasar'
import 'quasar/dist/quasar.css'
import { createApp } from 'vue'

import App from './App.vue'
import i18n from './locales'
import { router } from './router'
import './styles/index.css'

createApp(App)
  .use(router)
  .use(createPinia())
  .use(i18n)
  .use(Quasar, {})
  .mount('#app')
