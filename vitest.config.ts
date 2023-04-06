import Vue from '@vitejs/plugin-vue'
import { URL, fileURLToPath } from 'node:url'
import { defineConfig } from 'vitest/config'

export default defineConfig({
  plugins: [Vue()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
      'vue-i18n': 'vue-i18n/dist/vue-i18n.esm-bundler.js',
    },
  },
  test: {
    setupFiles: ['vitest.setup.ts'],
    ui: true,
    environment: 'jsdom',
    globals: true,
    include: ['./src/**/__tests__/*.unit.spec.ts'],
    coverage: {
      reportsDirectory: './public/reports/unit',
    },
    outputFile: './public/reports/unit',
    logHeapUsage: true,
    passWithNoTests: false,
  },
})
