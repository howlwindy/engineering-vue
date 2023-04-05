#! /bin/bash

placeholder='vue'
# 处理目录
envD=.env
huskyD=.husky
vscodeD=.vscode
publicD=public
imgD=public/img
iconD=public/icon
e2e=e2e
srcD=src
enumsD=$srcD/enums
typesD=$srcD/types
interfaceD=$srcD/interfaces
constsD=$srcD/consts
componentsD=$srcD/components
modelsD=$srcD/models
i18nModelD=$modelsD/i18n
i18nModelTestD=$i18nModelD/__tests__
storeModelD=$modelsD/store
storeModelTestD=$storeModelD/__tests__
pagesD=$srcD/pages
homePageD=$pagesD/home
homePageTestD=$homePageD/__tests__
localesD=$srcD/locales
enUSD=$localesD/en-US
zhCND=$localesD/zh-CN
enUSTestD=$enUSD/test
zhCNTestD=$zhCND/test
routerD=$srcD/router
storeD=$srcD/store
stylesD=$srcD/styles
utilsD=$srcD/utils
dirs=($envD $huskyD $vscodeD $publicD $imgD $iconD $e2e $srcD $enumsD $typesD $interfacesD $constsD $componentsD $modelsD $i18nModelD $i18nModelTestD $storeModelD $storeModelTestD $pagesD $homePageD $homePageTestD $localesD $enUSD $enUSTestD $zhCND $zhCNTestD $routerD $storeD $stylesD $utilsD)
for dir in "${dirs[@]}"; do
  if [ ! -d $dir ]; then
    mkdir $dir
  fi
done

envEnvF=$envD/.env
if [ ! -f $envEnvF ]; then
  touch $envEnvF
fi
cat >$envEnvF <<EOF
VITE_PROJECT_NAME = $placeholder
VITE_NODE_ENV = development
VITE_PUBLIC_DIR = public
VITE_CLEAR_SCREEN = true
VITE_ENV_DIR = .env
VITE_SERVER_HOST = 0.0.0.0
VITE_SERVER_OPEN = true
VITE_SERVER_CORS = true
VITE_SERVER_HMR_OVERLAY = true
EOF
envDevelopmentF=$envD/.env.development
if [ ! -f $envDevelopmentF ]; then
  touch $envDevelopmentF
fi
cat >$envDevelopmentF <<EOF
VITE_MODE = development
VITE_SERVER_PORT = 8080
VITE_LOG_LEVEL = info
EOF
envProductionF=$envD/.env.production
if [ ! -f $envProductionF ]; then
  touch $envProductionF
fi
cat >$envProductionF <<EOF
VITE_MODE = production
VITE_LOG_LEVEL = silent
EOF
vscodeExtensionsF=$vscodeD/extensions.json
if [ ! -f $vscodeExtensionsF ]; then
  touch $vscodeExtensionsF
fi
cat >$vscodeExtensionsF <<EOF
{
  "recommendations": [
    "Vue.volar",
    "ZixuanChen.vitest-explorer",
    "EditorConfig.EditorConfig", // 编辑器格式化
    "dbaeumer.vscode-eslint", // eslint
    "stylelint.vscode-stylelint", // stylelint
    "esbenp.prettier-vscode", // prettier
    "bradlc.vscode-tailwindcss", // tailwind提示
    "IWANABETHATGUY.path-alias", // 处理路径别名，比如@是src的别名
    "humao.rest-client", // 代替postman
    "ZixuanChen.vitest-explorer", // vitest
    "lokalise.i18n-ally", // i18n
    "Vue.vscode-typescript-vue-plugin"
  ]
}
EOF
vscodeSettingsF=$vscodeD/settings.json
if [ ! -f $vscodeSettingsF ]; then
  touch $vscodeSettingsF
fi
cat >$vscodeSettingsF <<EOF
{
  // editor --->
  "editor.quickSuggestions": {
    "strings": true
  },
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true,
    "source.fixAll.stylelint": true,
    "source.fixAll.prettier": true
  },
  // editor <---
  // typescript --->
  "typescript.preferences.importModuleSpecifier": "non-relative",
  "typescript.tsdk": "node_modules/typescript/lib",
  // typescript <---
  // eslint --->
  "eslint.packageManager": "pnpm",
  "eslint.alwaysShowStatus": true,
  // eslint <---
  // stylelint --->
  "stylelint.packageManager": "pnpm",
  // stylelint <---
  // prettier --->
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[css]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[vue]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[graphql]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[yaml]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  // prettier <---
  // tailwindcss --->
  "tailwindCSS.includeLanguages": {
    "plaintext": "html",
    "html": "html",
    "typescript": "typescript",
    "css": "css",
    "vue": "vue"
  },
  // tailwindcss <---
  // i18n --->
  "i18n-ally.localesPaths": ["src/locales"]
  // i18n <---
}
EOF
enumsIndexF=$enumsD/index.ts
if [ ! -f $enumsIndexF ]; then
  touch $enumsIndexF
  cat >$enumsIndexF <<EOF
export * from './locale.enum'
export * from './storage.enum'
export * from './theme.enum'
EOF
fi
enumsLocaleF=$enumsD/locale.enum.ts
if [ ! -f $enumsLocaleF ]; then
  touch $enumsLocaleF
  cat >$enumsLocaleF <<EOF
  export enum E_LOCALE {
  'zh-CN' = 'zh-CN',
  'en-US' = 'en-US',
}
// 语言所属名称
export enum E_LOCALE_NAME {
  'zh-CN' = '简体中文',
  'en-US' = 'English',
}
// 语言所属国旗
export enum E_LOCALE_ICON {
  'zh-CN' = 'flag:cn-4x3',
  'en-US' = 'flag:um-4x3',
}
// tinymce所属语言代码映射
export enum E_LOCALE_TINYMCE {
  'zh-CN' = 'zh_CN',
  'en-US' = 'en_US',
}
// faker-js所属语言代码映射
export enum E_LOCALE_FAKER {
  'zh-CN' = 'zh_CN',
  'en-US' = 'en_US',
}
EOF
fi
srcMainF=$srcD/main.ts
if [ ! -f $srcMainF ]; then
  touch $srcMainF
  cat >$srcMainF <<EOF
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
EOF
fi
enumsStorageF=$enumsD/storage.enum.ts
if [ ! -f $enumsStorageF ]; then
  touch $enumsStorageF
  cat >$enumsStorageF <<EOF
export enum E_LOCAL_STORAGE {
  LOCALE = 'locale',
  THEME = 'theme',
}
export enum E_SESSION_STORAGE {}
EOF
fi
enumsThemeF=$enumsD/theme.enum.ts
if [ ! -f $enumsThemeF ]; then
  touch $enumsThemeF
  cat >$enumsThemeF <<EOF
export enum E_THEME {
  LIGHT = 'light',
  DARK = 'dark',
  AUTO = 'auto',
}
export enum E_THEME_ICON {
  LIGHT = 'line-md:moon-alt-to-sunny-outline-loop-transition',
  DARK = 'line-md:moon-alt-loop',
  AUTO = 'line-md:laptop',
}
EOF
fi
constsIndexF=$constsD/index.ts
if [ ! -f $constsIndexF ]; then
  touch $constsIndexF
  cat >$constsIndexF <<EOF
export * from './locale.const'
export * from './theme.const'
EOF
fi
constsLocaleF=$constsD/locale.const.ts
if [ ! -f $constsLocaleF ]; then
  touch $constsLocaleF
  cat >$constsLocaleF <<EOF
import { E_LOCALE } from '@/enums'

export const C_E_LOCALE = E_LOCALE['zh-CN']
EOF
fi
constsThemeF=$constsD/theme.const.ts
if [ ! -f $constsThemeF ]; then
  touch $constsThemeF
  cat >$constsThemeF <<EOF
import { E_THEME } from '@/enums'

export const C_E_THEME = E_THEME.LIGHT
EOF
fi
utilsIndexF=$utilsD/index.ts
if [ ! -f $utilsIndexF ]; then
  touch $utilsIndexF
  cat >$utilsIndexF <<EOF
export * from './storage.util'
EOF
fi
utilsStorageF=$utilsD/storage.util.ts
if [ ! -f $utilsStorageF ]; then
  touch $utilsStorageF
  cat >$utilsStorageF <<EOF
import { RemovableRef, useStorage } from '@vueuse/core'
import { watch } from 'vue'
import { C_E_LOCALE, C_E_THEME } from '@/consts'
import { E_LOCALE, E_LOCAL_STORAGE, E_SESSION_STORAGE, E_THEME } from '@/enums'

export const uLocaleLocalStorage: RemovableRef<E_LOCALE> = useStorage<E_LOCALE>(
  E_LOCAL_STORAGE.LOCALE,
  localStorage.getItem(E_LOCAL_STORAGE.LOCALE) as E_LOCALE,
  localStorage
)
watch(
  uLocaleLocalStorage,
  (v) => {
    if (!Object.values(E_LOCALE).includes(v)) {
      localStorage.setItem(E_LOCAL_STORAGE.LOCALE, C_E_LOCALE)
    }
  },
  { immediate: true }
)

export const uThemeLocalStorage: RemovableRef<E_THEME> = useStorage<E_THEME>(
  E_LOCAL_STORAGE.THEME,
  localStorage.getItem(E_LOCAL_STORAGE.THEME) as E_THEME,
  localStorage
)

watch(
  uThemeLocalStorage,
  (v) => {
    if (!Object.values(E_THEME).includes(v)) {
      localStorage.setItem(E_LOCAL_STORAGE.THEME, C_E_THEME)
    }
  },
  {
    immediate: true,
  }
)
EOF
fi
srcAppF=$srcD/App.vue
if [ ! -f $srcAppF ]; then
  touch $srcAppF
  cat >$srcAppF <<EOF
<script setup></script>
<template>
  <Suspense>
    <RouterView />
  </Suspense>
</template>
EOF
fi
editorconfigF=.editorconfig
if [ ! -f $editorconfigF ]; then
  touch $eidtorconfigF
fi
cat >$editorconfigF <<EOF
root = true

[*]
charset = utf-8
indent_style = space
indent_size = 2
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
EOF
gitignoreF=.gitignore
if [ ! -f $gitignoreF ]; then
  touch $gitignoreF
fi
cat >$gitignoreF <<EOF
# https://gist.github.com/octocat/9257657
# Compiled source #
###################
*.com
*.class
*.dll
*.exe
*.o
*.so

# Packages #
############
# it's better to unpack these files and commit the raw source
# git has its own built in compression methods
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# Logs and databases #
######################
*.log
*.sql
*.sqlite

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# pnpm create vite自动生成且已增删
# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*

node_modules
.DS_Store
dist
dist-ssr

# Editor directories and files
.vscode/*
!.vscode/extensions.json
!.vscode/settings.json
.idea
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?
EOF
prettierignoreF=.prettierignore
if [ ! -f $prettierignoreF ]; then
  touch $prettierignoreF
fi
cat >$prettierignoreF <<EOF
node_modules
dist
reports
EOF
prettierrcF=.prettierrc.cjs
if [ ! -f $prettierrcF ]; then
  touch $prettierrcF
fi
cat >$prettierrcF <<EOF
module.exports = {
  plugins: [
    require.resolve('@trivago/prettier-plugin-sort-imports'),
    require('prettier-plugin-tailwindcss'),
  ],
  importOrder: [
    '<THIRD_PARTY_MODULES>',
    '^@/types/(.*)$',
    '^@/interfaces/(.*)$',
    '^@/enums/(.*)$',
    '^@/consts/(.*)$',
    '^@/locales/(.*)$',
    '^@/components/(.*)$',
    '^@/models/(.*)$',
    '^@/router/(.*)$',
    '^@/store/(.*)$',
    '^@/styles/(.*)$',
    '^@/utils/(.*)$',
    '^[../]',
    '^[./]',
  ],
  importOrderSeparation: true,
  importOrderSortSpecifiers: true,
  semi: false,
  singleQuote: true,
}
EOF
stylelintignoreF=.stylelintignore
if [ ! -f $stylelintignoreF ]; then
  touch $stylelintignoreF
fi
cat >$stylelintignoreF <<EOF
node_modules
dist
reports
EOF
stylelintrcF=.stylelintrc.cjs
if [ ! -f $stylelintrcF ]; then
  touch $stylelintrcF
fi
cat >$stylelintrcF <<EOF
module.exports = {
  root: true,
  extends: [
    'stylelint-config-standard',
    'stylelint-config-recommended-vue',
    'stylelint-config-prettier',
    'stylelint-config-idiomatic-order',
  ],
  rules: {
    'at-rule-no-unknown': [
      true,
      {
        ignoreAtRules: [
          'tailwind',
          'apply',
          'layer',
          'config',
          'variants',
          'responsive',
          'screen',
        ],
      },
    ],
    'function-no-unknown': [
      true,
      {
        ignoreFunctions: ['theme'],
      },
    ],
  },
}
EOF
eslintignoreF=.eslintignore
if [ ! -f $eslintignoreF ]; then
  touch $eslintignoreF
fi
cat >$eslintignoreF <<EOF
node_modules
dist
reports
EOF
eslintrcF=.eslintrc.cjs
if [ ! -f $eslintrcF ]; then
  touch $eslintrcF
fi
cat >$eslintrcF <<EOF
require('@rushstack/eslint-patch/modern-module-resolution')

module.exports = {
  root: true,
  extends: [
    'eslint:recommended',
    'plugin:vue/vue3-recommended',
    '@vue/eslint-config-typescript',
    '@vue/eslint-config-prettier',
  ],
  parserOptions: {
    ecmaVersion: 'latest',
  },
}
EOF
commitlintConfigF=commitlint.config.cjs
if [ ! -f $commitlintConfigF ]; then
  touch $commitlintConfigF
fi
cat >$commitlintConfigF <<EOF
module.exports = { extends: ['@commitlint/config-conventional'] }
EOF
postcssConfigF=postcss.config.js
if [ ! -f $postcssConfigF ]; then
  touch $postcssConfigF
fi
cat >$postcssConfigF <<EOF
import autoprefixer from 'autoprefixer'
import cssnano from 'cssnano'
import postcssImport from 'postcss-import'
import postcssNesting from 'postcss-nesting'
import postcssPresetEnv from 'postcss-preset-env'
import postcssReporter from 'postcss-reporter'
import stylelint from 'stylelint'
import tailwindcss from 'tailwindcss'
import tailwindcssNesting from 'tailwindcss/nesting'

import tailwindConfig from './tailwind.config.cjs'

export default {
  plugins: [
    postcssImport({
      plugins: [stylelint],
    }),
    tailwindcssNesting(postcssNesting),
    tailwindcss(tailwindConfig),
    autoprefixer,
    postcssPresetEnv({
      features: { 'nesting-rules': false },
    }),
    cssnano,
    postcssReporter({ clearMessages: true }),
  ],
}
EOF
tailwindConfigF=tailwind.config.cjs
if [ ! -f $tailwindConfigF ]; then
  touch $tailwindConfigF
fi
cat >$tailwindConfigF <<EOF
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.{css,vue,ts,tsx}'],
  darkMode: 'class',
  theme: {
    extend: {
    },
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
}
EOF
indexHtmlF=index.html
if [ ! -f $indexHtmlF ]; then
  touch $indexHtmlF
  cat >$indexHtmlF <<EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" href="/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>$placeholder</title>
  </head>
  <body>
    <div id="app"></div>
    <script type="module" src="/src/main.ts"></script>
  </body>
</html>
EOF
fi
tsconfigF=tsconfig.json
if [ ! -f $tsconfigF ]; then
  touch $tsconfigF
fi
cat >$tsconfigF <<EOF
{
  "include": [
    "**/*.ts",
    "**/*.vue",
    "*.config.*",
    "**/*.d.ts"
  ],
  "exclude": ["node_modules", "public", "dist", "public/reports"],
  "compilerOptions": {
    "composite": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    },
    "types": [
      "node",
      "vite/client",
      "jsdom",
      "vitest/globals",
    ],
    "target": "ES2015",
    "useDefineForClassFields": true,
    "module": "ESNext",
    "moduleResolution": "node",
    "sourceMap": true,
    "resolveJsonModule": true,
    "esModuleInterop": true,
    "isolatedModules": true,
    "allowSyntheticDefaultImports": true,
    "lib": ["esnext", "dom"]
  }
}
EOF
vitestSetup=vitest.setup.ts
if [ ! -f $vitestSetup ]; then
  touch $vitestSetup
fi
cat >$vitestSetup <<EOF
import { config } from '@vue/test-utils'
import i18n from '@/locale'

config.global.plugins = [i18n]
config.global.mocks = {
  \$t: vi.fn((str: string) => i18n.global.t(str)),
  \$tm: vi.fn((str: string) => i18n.global.rt(str)),
  \$rt: vi.fn((str: string) => i18n.global.tm(str)),
}
EOF
vitestConfigF=vitest.config.ts
if [ ! -f $vitestConfigF ]; then
  touch $vitestConfigF
fi
cat >$vitestConfigF <<EOF
import { defineConfig } from 'vitest/config'
import Vue from '@vitejs/plugin-vue'
import { URL, fileURLToPath } from 'node:url'

export default defineConfig({
  plugins: [
    Vue(),
  ],
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
EOF
viteConfigF=vite.config.ts
if [ ! -f $viteConfigF ]; then
  touch $viteConfigF
fi
cat >$viteConfigF <<EOF
/** @type {import('vite').UserConfig} */
import { visualizer } from 'rollup-plugin-visualizer'
import { defineConfig, loadEnv, UserConfig } from 'vite'
import postcss from './postcss.config.js'
import Vue from '@vitejs/plugin-vue'
import { URL, fileURLToPath } from 'node:url'

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
EOF
vueShimF=vue-shim.d.ts
if [ ! -f $vueShimF ]; then
  touch $vueShimF
fi
cat >$vueShimF <<EOF
/// <reference types="vite/client" />

declare module '*.vue' {
  import type { DefineComponent } from 'vue'
  const component: DefineComponent<{}, {}, any>
  export default component
}
EOF
localeIndexF=$localesD/index.ts
if [ ! -f $localeIndexF ]; then
  touch $localeIndexF
fi
cat >$localeIndexF <<EOF
import { createI18n } from 'vue-i18n'
import { C_E_LOCALE } from '@/consts'
import { E_LOCALE } from '@/enums'
import { uLocaleLocalStorage } from '@/utils'

import enUS from './en-US'
import zhCN from './zh-CN'

export default createI18n({
  legacy: false,
  globalInjection: true,
  locale: uLocaleLocalStorage.value,
  fallbackLocale: C_E_LOCALE,
  messages: {
    [E_LOCALE['zh-CN']]: zhCN,
    [E_LOCALE['en-US']]: enUS,
  },
})
EOF
enUSTestIndexF=$enUSTestD/index.ts
if [ ! -f $enUSTestIndexF ]; then
  touch $enUSTestIndexF
fi
cat >$enUSTestIndexF <<EOF
export default {
  shallow: 'i18n test',
  deep: {
    dataStructures: [
      'array',
      'linkedList',
      'queue',
      'stack',
      'heap',
      'tree',
      'graph',
    ],
  }
}
EOF
zhCNTestIndexF=$zhCNTestD/index.ts
if [ ! -f $zhCNTestIndexF ]; then
  touch $zhCNTestIndexF
fi
cat >$zhCNTestIndexF <<EOF
export default {
  shallow: 'i18n 测试',
  deep: {
    dataStructures: [
      '数组',
      '链表',
      '队列',
      '栈',
      '堆',
      '树',
      '图',
    ],
  }
}
EOF
enUSIndexF=$enUSD/index.ts
if [ ! -f $enUSIndexF ]; then
  touch $enUSIndexF
fi
cat >$enUSIndexF <<EOF
import test from './test'

export default {
  test,
}
EOF
zhCNIndexF=$zhCND/index.ts
if [ ! -f $zhCNIndexF ]; then
  touch $zhCNIndexF
fi
cat >$zhCNIndexF <<EOF
import test from './test'

export default {
  test,
}
EOF
packageF=package.json
if [ ! -f $packageF ]; then
  touch $packageF
fi
cat >$packageF <<EOF
{
  "name": "$placeholder",
  "version": "0.0.1",
  "scripts": {
    "dev": "vite dev",
    "build": "rimraf dist && vite build",
    "preview": "vite preview",
    "test:unit": "rimraf reports/unit && vitest --coverage --ui -c vitest.config.ts",
    "test:e2e": "rimraf reports/e2e && playwright test && playwright show-report public/reports/e2e",
    "eslint": "eslint . --ext .vue,.js,.jsx,.cjs,.mjs,.ts,.tsx,.cts,.mts --fix --ignore-path .gitignore",
    "stylelint": "stylelint \"**/*.{css,vue}\" --color --fix",
    "prettier": "prettier . --write",
    "prepare": "husky install"
  },
  "engines": {
    "node": ">=18",
    "pnpm": ">=7"
  },
  "config": {
    "commitizen": {
      "path": "cz-conventional-changelog"
    }
  },
  "lint-staged": {
    "**/*.": [
      "prettier . --write"
    ],
    "**/*.{vue,js,jsx,cjs,mjs,ts,tsx,cts,mts}": [
      "eslint . --ext .ts,.vue --fix"
    ],
    "**/*.{css,vue}": [
      "stylelint \"**/*.{css,vue}\" --color --fix"
    ]
  },
  "dependencies": {
    "@quasar/extras": "^1.15.11",
    "@tinymce/tinymce-vue": "^5.0.1",
    "@vueuse/components": "^9.13.0",
    "@vueuse/core": "^9.13.0",
    "@vueuse/router": "^9.13.0",
    "highlight.js": "^11.7.0",
    "nanoid": "^4.0.1",
    "pinia": "^2.0.33",
    "quasar": "^2.11.7",
    "vue": "^3.2.47",
    "vue-i18n": "^9.2.2",
    "vue-router": "^4.1.6"
  },
  "devDependencies": {
    "@commitlint/cli": "^17.4.4",
    "@commitlint/config-conventional": "^17.4.4",
    "@commitlint/cz-commitlint": "^17.4.4",
    "@faker-js/faker": "^7.6.0",
    "@iconify/types": "^2.0.0",
    "@iconify/vue": "^4.1.0",
    "@pinia/testing": "^0.0.15",
    "@playwright/test": "^1.31.2",
    "@quasar/vite-plugin": "^1.3.0",
    "@rushstack/eslint-patch": "^1.2.0",
    "@tailwindcss/aspect-ratio": "^0.4.2",
    "@tailwindcss/typography": "^0.5.9",
    "@trivago/prettier-plugin-sort-imports": "^4.1.1",
    "@types/d3": "^7.4.0",
    "@types/jsdom": "^21.1.0",
    "@vitejs/plugin-vue": "^4.0.0",
    "@vitest/coverage-c8": "^0.29.2",
    "@vitest/ui": "^0.29.2",
    "@vue/eslint-config-prettier": "^7.1.0",
    "@vue/eslint-config-typescript": "^11.0.2",
    "@vue/test-utils": "^2.3.1",
    "autoprefixer": "^10.4.14",
    "commitizen": "^4.3.0",
    "cssnano": "^5.1.15",
    "cz-conventional-changelog": "^3.3.0",
    "eslint": "^8.36.0",
    "eslint-plugin-vue": "^9.9.0",
    "husky": "^8.0.3",
    "iconify": "^1.4.0",
    "inquirer": "^9.1.4",
    "jsdom": "^21.1.1",
    "lint-staged": "^13.2.0",
    "markdown-it-anchor": "^8.6.7",
    "postcss": "^8.4.21",
    "postcss-html": "^1.5.0",
    "postcss-import": "^15.1.0",
    "postcss-nesting": "^11.2.1",
    "postcss-preset-env": "^8.0.1",
    "postcss-reporter": "^7.0.5",
    "prettier": "^2.8.4",
    "prettier-plugin-tailwindcss": "^0.2.4",
    "rimraf": "^4.4.0",
    "rollup-plugin-visualizer": "^5.9.0",
    "stylelint": "^15.2.0",
    "stylelint-config-idiomatic-order": "^9.0.0",
    "stylelint-config-prettier": "^9.0.5",
    "stylelint-config-recommended-vue": "^1.4.0",
    "stylelint-config-standard": "^30.0.1",
    "tailwindcss": "^3.2.7",
    "typescript": "^4.9.5",
    "vite": "^4.1.4",
    "vite-plugin-dts": "^2.1.0",
    "vitepress": "1.0.0-alpha.56",
    "vitest": "^0.29.2",
    "vue-tsc": "^1.2.0"
  }
}
EOF
npmrcF=.npmrc
if [ ! -f $npmrcF ]; then
  touch $npmrcF
fi
cat >$npmrcF <<EOF
auto-install-peers=true
shamefully-hoist=true

registry=https://registry.npmjs.org
// registry=https://npmmirror.com/mirrors
EOF
routerF=$routerD/index.ts
if [ ! -f $routerF ]; then
  touch $routerF
  cat >$routerF <<EOF
import * as VueRouter from 'vue-router'

import routes from './routes'

export const router = VueRouter.createRouter({
  history: VueRouter.createWebHistory(),
  routes: routes,
})
EOF
fi
routesF=$routerD/routes.ts
if [ ! -f $routesF ]; then
  touch $routesF
  cat >$routesF <<EOF
export default [
  { path: '/', component: () => import('@/pages/home/HomePage.vue') }
]
EOF
fi
indexCssF=$stylesD/index.css
if [ ! -f $indexCssF ]; then
  touch $indexCssF
  cat >$indexCssF <<EOF
@tailwind base;
@tailwind components;
@tailwind utilities;
@tailwind variants;
EOF
fi
globalStoreF=$storeD/global.store.ts
if [ ! -f $globalStoreF ]; then
  touch $globalStoreF
  cat >$globalStoreF <<EOF
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
EOF
fi
HomePageF=$homePageD/HomePage.vue
if [ ! -f $HomePageF ]; then
  touch $HomePageF
fi
cat >$HomePageF <<EOF
<script setup lang="ts">
import { QBtn, QCard, QCardActions } from 'quasar'

import I18nModel from '@/models/i18n/I18nModel.vue'
import StoreModel from '@/models/store/StoreModel.vue'
import ThemeModel from '@/models/theme/ThemeModel.vue'
</script>
<template>
  <div class="flex flex-col items-center">
    <h1 class="home text-center text-3xl text-sky-500">
      这些都是i18n和pinia的例子
    </h1>
    <QCard flat>
      <QCardActions>
        <QBtn flat target="_blank" href="/reports/unit/index.html"
          >unit报告</QBtn
        >
        <QBtn flat target="_blank" href="/reports/e2e/index.html">e2e报告</QBtn>
      </QCardActions>
    </QCard>
    <ThemeModel />
    <I18nModel />
    <StoreModel />
  </div>
</template>
EOF
homePageTestF=$homePageTestD/home.unit.spec.ts
if [ ! -f $homePageTestF ]; then
  touch $homePageTestF
fi
cat >$homePageTestF <<EOF
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
EOF
modelIndexF=$i18nModelD/index.ts
if [ ! -f $modelIndexF ]; then
  touch $modelIndexF
  cat >$modelIndexF <<EOF
export { default as I18nModel } from './i18n/I18nModel.vue'
export { default as ThemeModel } from './theme/ThemeModel.vue'
export { default as StoreModel } from './store/StoreModel.vue'
EOF
fi
i18nModelF=$i18nModelD/I18nModel.vue
if [ ! -f $i18nModelF ]; then
  touch $i18nModelF
fi
cat >$i18nModelF <<EOF
<script setup lang="ts">
import {
  QBtn,
  QCard,
  QCardActions,
  QCardSection,
} from 'quasar'
import { E_LOCALE } from '@/enums'
import { useI18n } from 'vue-i18n'

const { locale } = useI18n()
</script>
<template>
  <QCard class="flex flex-col items-center">
    <QCardSection class="flex flex-col items-center">
      <h1 class="text-xl font-bold">vue-i18n</h1>
      <p>{{ \$t('test.shallow') }}</p>
      <div v-for="v of \$tm('test.deep.dataStructures')" :key="v">
        <span class="px-5">{{ \$rt(v) }}</span>
      </div>
    </QCardSection>
    <QCardActions>
      <QBtn
        flat
        :data-unit-test="v"
        v-for="v of [E_LOCALE['zh-CN'], E_LOCALE['en-US']]"
        :key="v"
        @click="locale = v"
        >{{ v }}</QBtn
      >
    </QCardActions>
  </QCard>
</template>
EOF
i18nModelTestF=$i18nModelTestD/i18n.unit.spec.ts
if [ ! -f $i18nModelTestF ]; then
  touch $i18nModelTestF
fi
cat >$i18nModelTestF <<EOF
import { mount } from '@vue/test-utils'
import I18nModel from '@/models/i18n/I18nModel.vue'
import i18n from '@/locale'

describe('I18nModel', () => {
  const wrapper = mount(I18nModel)
  const zhCN = wrapper.get('[data-unit-test=zh-CN]')
  const enUS = wrapper.get('[data-unit-test=en-US]')
  it('button render', () => {
    expect(zhCN.text()).toBe('zh-CN')
    expect(enUS.text()).toBe('en-US')
  })
  it('button click', async () => {
    await zhCN.trigger('click')
    expect(i18n.global.locale.value).toBe('zh-CN')
    await enUS.trigger('click')
    expect(i18n.global.locale.value).toBe('en-US')
  })
})
EOF
storeModelF=$storeModelD/StoreModel.vue
if [ ! -f $storeModelF ]; then
  touch $storeModelF
fi
cat >$storeModelF <<EOF
<script setup lang="ts">
import {
  QBtn,
  QCard,
  QCardActions,
  QCardSection,
} from 'quasar'

import { useGlobalStore } from '@/store/global.store'

const globalStore = useGlobalStore()
</script>
<template>
  <QCard class="flex flex-col items-center">
    <QCardSection class="flex flex-col items-center">
      <h1 class="text-2xl font-bold">store</h1>
      <div class="flex justify-center">
        <span data-unit-test="pow"
          >pow = {{ globalStore.countPow2Getter }}</span
        >
        <span data-unit-test="log"
          >log = {{ globalStore.countLog2Getter }}</span
        >
      </div>
    </QCardSection>
    <QCardActions>
      <QBtn
        flat
        @click="
          globalStore.\$patch({
            countState: ++globalStore.countState,
          })
        "
        >globalStore.countState = {{ globalStore.countState }}</QBtn
      >
    </QCardActions>
  </QCard>
</template>
EOF
storeModelTestF=$storeModelTestD/store.unit.spec.ts
if [ ! -f $storeModelTestF ]; then
  touch $storeModelTestF
fi
cat >$storeModelTestF <<EOF
import { mount } from '@vue/test-utils'
import StoreModel from '@/models/store/StoreModel.vue'
import { createTestingPinia } from '@pinia/testing'
import { useGlobalStore } from '@/store/global.store'

describe('StoreModel', () => {
  const wrapper = mount(StoreModel, {
    plugins: [createTestingPinia()]
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
EOF
e2eHome=$e2e/home.e2e.spec.ts
if [ ! -f $e2eHome ]; then
  touch $e2eHome
fi
cat >$e2eHome <<EOF
import { test, expect } from '@playwright/test'

test('一个例子', async ({ page }) => {
  await page.goto('/');
  await expect(page.locator('h1.home')).toHaveText('这些都是i18n和pinia的例子');
})
EOF
playwrightConfig=playwright.config.ts
if [ ! -f $playwrightConfig ]; then
  touch $playwrightConfig
fi
cat >$playwrightConfig <<EOF
import { devices } from '@playwright/test'
import type { PlaywrightTestConfig } from '@playwright/test'

const config: PlaywrightTestConfig = {
  timeout: 1000 * 60,
  testDir: 'e2e',
  testMatch: /.*\.e2e\.spec\.ts/,
  reporter: [['html', { outputFolder: 'public/reports/e2e' }]],
  use: {
    baseURL: 'http://localhost:8080',
  },
  projects: [
    {
      name: 'Desktop Chrome',
      use: { ...devices['Desktop Chrome'] },
    },
    {
      name: 'Desktop Firefox',
      use: { ...devices['Desktop Firefox'] },
    },
    {
      name: 'Desktop Edge',
      use: { ...devices['Desktop Edge'] },
    },
  ],
}

export default config
EOF
