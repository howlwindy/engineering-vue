/** @type {import('vite').UserConfig} */
import Vue from '@vitejs/plugin-vue'
import { URL, fileURLToPath } from 'node:url'
import { visualizer } from 'rollup-plugin-visualizer'
import { UserConfig, defineConfig, loadEnv } from 'vite'

import postcss from './postcss.config.js'

// https://vitejs.dev/config/
export default defineConfig(async ({ command, mode, ssrBuild }) => {
  process.env = await loadEnv(mode, './.env')
  const ENV = process.env
  console.log(ENV)
  return {
    mode: ENV.VITE_MODE,
    plugins: [
      Vue(),
      visualizer({
        filename: './public/reports/bundle-analyze.html',
        title: ENV.VITE_PROJECT_NAME,
        open: true,
        template: 'sunburst',
        gzipSize: true,
        brotliSize: true,
      }),
    ],
    resolve: {
      alias: {
        '@': fileURLToPath(new URL('./src', import.meta.url)),
        'vue-i18n':
          ENV.VITE_MODE === 'development'
            ? 'vue-i18n/dist/vue-i18n.esm-bundler.js'
            : 'vue-i18n.runtime.esm-bundler.js',
      },
    },
    css: {
      postcss,
    },
    logLevel: ENV.VITE_LOG_LEVEL as UserConfig['logLevel'],
    clearScreen: ENV.VITE_CLEAR_SCREEN === 'true',
    envDir: ENV.VITE_ENV_DIR,
    server: {
      host: ENV.VITE_SERVER_HOST,
      port: +ENV.VITE_SERVER_PORT,
      open: ENV.VITE_SERVER_OPEN === 'true',
      proxy: {
        '^/api': {
          target: ENV.VITE_BASE_URL,
          rewrite: (path) => path.replace(/^\/api/, ''),
          changeOrigin: true,
          secure: true,
        },
      },
      cors: ENV.VITE_SERVER_CORS === 'true',
      hmr: {
        overlay: ENV.VITE_SERVER_HMR_OVERLAY === 'true',
      },
    },
  }
})
