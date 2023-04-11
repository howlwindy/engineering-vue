import { createPinia } from 'pinia'
import { createApp } from 'vue'

import App from './App.vue'
import i18n from './locales'
import { router } from './router'
import './styles/index.css'

createApp(App).use(router).use(createPinia()).use(i18n).mount('#app')
