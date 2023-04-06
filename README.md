# node/pnpm

因为 vite v4 开始，需要 node>=18 且目标项目选择`pnpm`管理，所以有以下操作

查看 node 版本

```bash
node -v
```

查看本地所有 node 版本[官方文档](https://www.npmjs.com/package/n)

```bash
sudo n
```

如果 node < 18，但本地已有 18，使用上下键切换到最新的版本

如果 node < 18，但本地没有 18，安装最新稳定版

```bash
sudo n stable
```

查看 pnpm 是否存在

```bash
pnpm -v
```

如果不存在，将包管理器切换到 pnpm[官方文档](https://pnpm.io/installation)

```bash
sudo corepack enable
```

# 项目目录及配置

> 目前先 ctrlCV 吧，后续再写一个 cli

如果是空项目则先创建官方模板[官方文档](https://vitejs.dev/guide/)

```bash
pnpm create vite
```

创建下述文件

```bash

```

- **.env** - vite 环境变量
  - **.env** - development 和 production 的公共
  - **.env.development** - 开发模式
  - **.env.production** - 生产模式
- **.husky** - husky 所有 bash
- **.vscode** - vscode 的配置
- **e2e** - playwright 进行 e2e 测试
- **public** - 资源文件 [官方文档](https://vitejs.dev/guide/assets.html#the-public-directory)
- **src**
  - **components** - 低层次组件
  - **consts** - 常量
  - **locale** - i18n
  - **models** - 高层次组件
  - **pages** - 页面
  - **router** - vue-router
  - **store** - pinia
  - **styles** - css/tailwind
  - **types** - enum/type/interface
  - **utils** - 工具
  - **App.vue**
  - **main.ts**
- **.editorconfig** - 所有编辑器大致上格式一致化
- **.eslintignore** - 不需要 eslint 检查的文件或目录
- **.eslintrc.cjs** - eslint 配置
- **.gitignore**
- **.npmrc** - 改变 pnpm 安装时的某些表现
- **.prettierignore** - 不需要 prettier 检查的文件或目录
- **.prettierrc.cjs** - prettier 配置
- **.stylelintignore** - 不需要 stylelint 检查的文件或目录
- **.stylelintrc.yml** - stylelint 配置
- **CHANGLELOG.md** - 版本 log
- **commitlint.config.cjs** - git 规范配置
- **index.html**
- **package.json**
- **playwright.config.ts** - playwright 配置
- **postcss.config.js** - 配置 tailwind 和其他 css 语法
- **README.md** - 项目说明
- **tailwind.config.cjs** - tailwindcss 配置
- **tsconfig.json** - 当前项目 ts 的表现
- **vite.config.ts** - vite 配置
- **vitest.config.ts** - vitest 配置
- **vitest.setup.ts** - vitest启动

# 需要的库及相关文件配置

> 所有的库只说明其地址和简要，具体请查看相关 api

- 工程化
  - **`vite`** [![](https://img.shields.io/npm/v/vite?logo=npm)](https://www.npmjs.com/package/vite) [![](https://img.shields.io/github/stars/vitejs/vite?logo=github)](https://github.com/vitejs/vite) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://vitejs.dev)
  - **`typescript`** [![](https://img.shields.io/npm/v/typescript?logo=npm)](https://www.npmjs.com/package/typescript) [![](https://img.shields.io/github/stars/microsoft/TypeScript?logo=github)](https://github.com/microsoft/TypeScript) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://www.typescriptlang.org)
    >  统一项目`ts`版本
  - **`rimraf`** [![](https://img.shields.io/npm/v/rimraf?logo=npm)](https://www.npmjs.com/package/rimraf) [![](https://img.shields.io/github/stars/isaacs/rimraf?logo=github)](https://github.com/isaacs/rimraf)
    > 在打包前删除已经存在的`dist`目录
  - git hooks 拦截 - 用于执行某些 git 命令时先进行代码检查或其他操作
    - **`husky`** [![](https://img.shields.io/npm/v/husky?logo=npm)](https://www.npmjs.com/package/husky) [![](https://img.shields.io/github/stars/typicode/husky?logo=github)](https://github.com/typicode/husky) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://typicode.github.io/husky)
    - **`lint-staged`** [![](https://img.shields.io/npm/v/lint-staged?logo=npm)](https://www.npmjs.com/package/lint-staged) [![](https://img.shields.io/github/stars/okonet/lint-staged?logo=github)](https://github.com/okonet/lint-staged)
    - `git commit`规范 - `git commit`改为`pnpm run commit`并将提交信息规范化
      - **`@comitlint/cli`** [![](https://img.shields.io/npm/v/@commitlint/cli?logo=npm)](https://www.npmjs.com/package/@commitlint/cli) [![](https://img.shields.io/github/stars/conventional-changelog/commitlint?logo=github)](https://github.com/conventional-changelog/commitlint) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://commitlint.js.org)
      - **`@commitlint/config-conventional`** [![](https://img.shields.io/npm/v/@commitlint/config-conventional?logo=npm)](https://www.npmjs.com/package/@commitlint/config-conventional) [![](https://img.shields.io/github/stars/conventional-changelog/commitlint?logo=github)](https://github.com/conventional-changelog/commitlint) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://commitlint.js.org)
      - **`@commitlint/cz-commitlint`** [![](https://img.shields.io/npm/v/@commitlint/cz-commitlint?logo=npm)](https://www.npmjs.com/package/@commitlint/cz-commitlint) [![](https://img.shields.io/github/stars/conventional-changelog/commitlint?logo=github)](https://github.com/conventional-changelog/commitlint) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://commitlint.js.org)
      - **`@commitlint/fotmat`** [![](https://img.shields.io/npm/v/@commitlint/format?logo=npm)](https://www.npmjs.com/package/@commitlint/cz-commitlint) [![](https://img.shields.io/github/stars/conventional-changelog/commitlint?logo=github)](https://github.com/conventional-changelog/commitlint) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://commitlint.js.org)
      - **`inquirer`** [![](https://img.shields.io/npm/v/inquirer?logo=npm)](https://www.npmjs.com/package/inquirer) [![](https://img.shields.io/github/stars/SBoudrias/Inquirer.js?logo=github)](https://github.com/SBoudrias/Inquirer.js)
  - eslint
    - **`eslint`** [![](https://img.shields.io/npm/v/eslint?logo=npm)](https://www.npmjs.com/package/eslint) [![](https://img.shields.io/github/stars/eslint/eslint?logo=github)](https://github.com/eslint/eslint) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://eslint.org)
      > 对`.js`,`.ts`,`.jsx`,`.tsx`,`.vue` 进行代码检查
    - **`@rushstack/eslint-patch`** [![](https://img.shields.io/npm/v/@rushstack/eslint-patch?logo=npm)](https://www.npmjs.com/package/@rushstack/eslint-patch) [![](https://img.shields.io/github/stars/microsoft/rushstack?logo=github)](https://github.com/microsoft/rushstack) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://rushstack.io/)
    - **`eslint-config-prettier`** [![](https://img.shields.io/npm/v/@vue/eslint-config-prettier?logo=npm)](https://www.npmjs.com/package/@vue/eslint-config-prettier) [![](https://img.shields.io/github/stars/vuejs/eslint-config-prettier?logo=github)](https://github.com/vuejs/eslint-config-prettier)
    - **`eslilnt-config-typescript`** [![](https://img.shields.io/npm/v/@vue/eslint-config-typescript?logo=npm)](https://www.npmjs.com/package/@vue/eslint-config-typescript) [![](https://img.shields.io/github/stars/vuejs/eslint-config-typescript?logo=github)](https://github.com/vuejs/eslint-config-typescript)
    - **`eslint-plugin-vue`** [![](https://img.shields.io/npm/v/eslint-plugin-vue?logo=npm)](https://www.npmjs.com/package/eslint-plugin-vue) [![](https://img.shields.io/github/stars/vuejs/eslint-plugin-vue?logo=github)](https://github.com/vuejs/eslint-plugin-vue) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://eslint.vuejs.org)
  - prettier
    - **`prettier`** [![](https://img.shields.io/npm/v/prettier?logo=npm)](https://www.npmjs.com/package/prettier) [![](https://img.shields.io/github/stars/prettier/prettier?logo=github)](https://github.com/prettier/prettier) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://prettier.io)
      > 对`.js`,`.ts`,`.jsx`,`.tsx`,`.vue`,`.css`,`.md`,`.json`,`.yml`进行格式化
    - **`@trivago/prettier-plugin-sort-imports`** [![](https://img.shields.io/npm/v/@trivago/prettier-plugin-sort-imports?logo=npm)](https://www.npmjs.com/package/@trivago/prettier-plugin-sort-imports) [![](https://img.shields.io/github/stars/trivago/prettier-plugin-sort-imports?logo=github)](https://github.com/trivago/prettier-plugin-sort-imports)
    - **`prettier-plugin-tailwindcss`** [![](https://img.shields.io/npm/v/prettier-plugin-tailwindcss?logo=npm)](https://www.npmjs.com/package/prettier-plugin-tailwindcss) [![](https://img.shields.io/github/stars/tailwindlabs/prettier-plugin-tailwindcss?logo=github)](https://github.com/tailwindlabs/prettier-plugin-tailwindcss)
  - stylelint
    - **`stylelint`** [![](https://img.shields.io/npm/v/stylelint?logo=npm)](https://www.npmjs.com/package/stylelint) [![](https://img.shields.io/github/stars/stylelint/stylelint?logo=github)](https://github.com/stylelint/stylelint) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://stylelint.io)
      > 对`.css`,`.vue`进行代码检查
    - **`stylelint-config-idiomatic-order`** [![](https://img.shields.io/npm/v/stylelint-config-idiomatic-order?logo=npm)](https://www.npmjs.com/package/stylelint-config-idiomatic-order) [![](https://img.shields.io/github/stars/ream88/stylelint-config-idiomatic-order?logo=github)](https://github.com/ream88/stylelint-config-idiomatic-order)
    - **`stylelint-config-prettier`** [![](https://img.shields.io/npm/v/stylelint-config-prettier?logo=npm)](https://www.npmjs.com/package/stylelint-config-prettier) [![](https://img.shields.io/github/stars/prettier/stylelint-config-prettier?logo=github)](https://github.com/prettier/stylelint-config-prettier)
    - **`stylelint-config-recommended-vue`** [![](https://img.shields.io/npm/v/stylelint-config-recommended-vue?logo=npm)](https://www.npmjs.com/package/stylelint-config-recommended) [![](https://img.shields.io/github/stars/stylelint/stylelint-config-recommended?logo=github)](https://github.com/stylelint/stylelint-config-recommended)
    - **`stylelint-config-standard`** [![](https://img.shields.io/npm/v/stylelint-config-standard?logo=)](https://www.npmjs.com/package/stylelint-config-standard) [![](https://img.shields.io/github/stars/stylelint/stylelint-config-standard?logo=github)](https://github.com/stylelint/stylelint-config-standard)
- css 相关
  - postcss
    - **`postcss`** [![](https://img.shields.io/npm/v/postcss?logo=npm)](https://www.npmjs.com/package/postcss) [![](https://img.shields.io/github/stars/postcss/postcss?logo=github)](https://github.com/postcss/postcss) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://postcss.org/)
    - **`postcss-html`** [![](https://img.shields.io/npm/v/postcss-html?logo=npm)](https://www.npmjs.com/package/postcss-html) [![](https://img.shields.io/github/stars/ota-meshi/postcss-html?logo=github)](https://github.com/ota-meshi/postcss-html) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://ota-meshi.github.io/postcss-html)
    - **`postcss-nesting`** [![](https://img.shields.io/npm/v/postcss-nesting?logo=npm)](https://www.npmjs.com/package/postcss-nesting) [![](https://img.shields.io/github/stars/csstools/postcss-plugins?logo=github)](https://github.com/csstools/postcss-plugins) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://preset-env.cssdb.org)
    - **`postcss-preset-env`** [![](https://img.shields.io/npm/v/postcss-preset-env?logo=npm)](https://www.npmjs.com/package/postcss-preset-env) [![](https://img.shields.io/github/stars/csstools/postcss-plugins?logo=github)](https://github.com/csstools/postcss-plugins) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://preset-env.cssdb.org)
    - **`postcss-reporter`** [![](https://img.shields.io/npm/v/postcss-reporter?logo=npm)](https://www.npmjs.com/package/postcss-reporter) [![](https://img.shields.io/github/stars/postcss/postcss-reporter?logo=github)](https://github.com/postcss/postcss-reporter)
    - **`autoprefixer`** [![](https://img.shields.io/npm/v/autoprefixer?logo=npm)](https://www.npmjs.com/package/autoprefixer) [![](https://img.shields.io/github/stars/postcss/autoprefixer?logo=github)](https://github.com/postcss/autoprefixer)
    - **`cssnano`** [![](https://img.shields.io/npm/v/cssnano?logo=npm)](https://www.npmjs.com/package/cssnano) [![](https://img.shields.io/github/stars/cssnano/cssnano?logo=github)](https://github.com/cssnano/cssnano) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://cssnano.co/)
  - tailwindcss
    - **`tailwindcss`** [![](https://img.shields.io/npm/v/tailwindcss?logo=npm)](https://www.npmjs.com/package/tailwindcss) [![](https://img.shields.io/github/stars/tailwindlabs/tailwindcss?logo=github)](https://github.com/tailwindlabs/tailwindcss) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://tailwindcss.com)
    - **`@tailwindcss/aspect-ratio`** [![](https://img.shields.io/npm/v/@tailwindcss/aspect-ratio?logo=npm)](https://www.npmjs.com/package/@tailwindcss/aspect-ratio) [![](https://img.shields.io/github/stars/tailwindlabs/tailwindcss-aspect-ratio?logo=github)](https://github.com/tailwindlabs/tailwindcss-aspect-ratio)
    - **`@tailwindcss/typography`** [![](https://img.shields.io/npm/v/@tailwindcss/typography?logo=npm)](https://www.npmjs.com/package/@tailwindcss/typography) [![](https://img.shields.io/github/stars/tailwindlabs/tailwindcss-typography?logo=github)](https://github.com/tailwindlabs/tailwindcss-typography) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://tailwindcss.com/docs/typography-plugin)
 - vue
   - **`vue`** [![](https://img.shields.io/npm/v/vue?logo=npm)](https://www.npmjs.com/package/vue) [![](https://img.shields.io/github/stars/vuejs/core?logo=github)](https://github.com/vuejs/core) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://vuejs.org)
   - **`vue-router`** [![](https://img.shields.io/npm/v/vue-router?logo=npm)](https://www.npmjs.com/package/vue-router) [![](https://img.shields.io/github/stars/vuejs/router?logo=github)](https://github.com/vuejs/router) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://router.vuejs.org)
   - **`pinia`** [![](https://img.shields.io/npm/v/pinia?logo=npm)](https://www.npmjs.com/package/pinia) [![](https://img.shields.io/github/stars/vuejs/pinia?logo=github)](https://github.com/vuejs/pinia) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://pinia.vuejs.org)
   - **`vue-i18n`** [![](https://img.shields.io/npm/v/vue-i18n?logo=npm)](https://www.npmjs.com/package/vue-i18n) [![](https://img.shields.io/github/stars/intlify/vue-i18n-next?logo=github)](https://github.com/intlify/vue-i18n-next) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://vue-i18n.intlify.dev/)
   - **`@vueuse/core`** [![](https://img.shields.io/npm/v/@vueuse/core?logo=npm)](https://www.npmjs.com/package/@vueuse/core) [![](https://img.shields.io/github/stars/vueuse/vueuse?logo=github)](https://github.com/vueuse/vueuse) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://vueuse.org)
   - **`@vueuse/components`** [![](https://img.shields.io/npm/v/@vueuse/components?logo=npm)](https://www.npmjs.com/package/@vueuse/components) [![](https://img.shields.io/github/stars/vueuse/vueuse?logo=github)](https://github.com/vueuse/vueuse) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://vueuse.org/functions.html#category=%40Router)
   - **`@vueuse/router`** [![](https://img.shields.io/npm/v/@vueuse/router?logo=npm)](https://www.npmjs.com/package/@vueuse/router) [![](https://img.shields.io/github/stars/vueuse/vueuse?logo=github)](https://github.com/vueuse/vueuse) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://vueuse.org/guide/components.html)
  - 图标
    - iconify
      - **`@iconify/vue`** [![](https://img.shields.io/npm/v/@iconify/vue?logo=npm)](https://www.npmjs.com/package/@iconify/vue) [![](https://img.shields.io/github/stars/iconify/iconify?logo=github)](https://github.com/iconify/iconify) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://iconify.design/)
  - 动画
    - **`d3`** [![](https://img.shields.io/npm/v/d3?logo=npm)](https://www.npmjs.com/package/d3) [![](https://img.shields.io/github/stars/d3/d3?logo=github)](https://github.com/d3/d3) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://d3js.org/)
    - **`@types/d3`** [![](https://img.shields.io/npm/v/d3?logo=npm)](https://www.npmjs.com/package/d3) [![](https://img.shields.io/github/stars/@types/d3?logo=github)](https://github.com/@types/d3)
    - 2d
      - **`pixijs`** [![](https://img.shields.io/npm/v/pixijs?logo=npm)](https://www.npmjs.com/package/pixijs) [![](https://img.shields.io/github/stars/pixijs/pixijs?logo=github)](https://github.com/pixijs/pixijs) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://pixijs.com)
    - 3d
      - **`babylonjs`** [![](https://img.shields.io/npm/v/babylonjs?logo=npm)](https://www.npmjs.com/package/babylonjs) [![](https://img.shields.io/github/stars/BabylonJS/Babylon.js?logo=github)](https://github.com/BabylonJS/Babylon.js) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://www.babylonjs.com)
  - 工具
    - **`nanoid`** [![](https://img.shields.io/npm/v/nanoid?logo=npm)](https://www.npmjs.com/package/nanoid) [![](https://img.shields.io/github/stars/ai/nanoid?logo=github)](https://github.com/ai/nanoid) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://zelark.github.io/nano-id-cc)
    - **`@tinymce/tinymce-vue`** [![](https://img.shields.io/npm/v/@tinymce/tinymce-vue?logo=npm)](https://www.npmjs.com/package/@tinymce/tinymce-vue) [![](https://img.shields.io/github/stars/tinymce/tinymce-vue?logo=github)](https://github.com/tinymce/tinymce-vue) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://www.tiny.cloud)
    - **`highlight.js`** [![](https://img.shields.io/npm/v/highlight.js?logo=npm)](https://www.npmjs.com/package/highlight.js) [![](https://img.shields.io/github/stars/highlightjs/highlight.js?logo=github)](https://github.com/highlightjs/highlight.js) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://highlightjs.org/)
  - 测试和假数据
    - 假数据
      - **`@faker-js/faker`** [![](https://img.shields.io/npm/v/@faker-js/faker?logo=npm)](https://www.npmjs.com/package/@faker-js/faker) [![](https://img.shields.io/github/stars/faker-js/faker?logo=github)](https://github.com/faker-js/faker) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://fakerjs.dev)
    - e2e测试
      - **`@playwright/test`** [![](https://img.shields.io/npm/v/@playwright/test?logo=npm)](https://www.npmjs.com/package/@playwright/test) [![](https://img.shields.io/github/stars/Microsoft/playwright?logo=github)](https://github.com/Microsoft/playwright) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://playwright.dev/)
    - unit测试
      - **`vitest`** [![](https://img.shields.io/npm/v/vitest?logo=npm)](https://www.npmjs.com/package/vitest) [![](https://img.shields.io/github/stars/vitest-dev/vitest?logo=github)](https://github.com/vitest-dev/vitest) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://vitest.dev)
      - **`@vue/test-utils`** [![](https://img.shields.io/npm/v/@vue/test-utils?logo=npm)](https://www.npmjs.com/package/@vue/test-utils) [![](https://img.shields.io/github/stars/vuejs/test-utils?logo=github)](https://github.com/vuejs/test-utils) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://test-utils.vuejs.org/)
      - **`@pinia/testing`** [![](https://img.shields.io/npm/v/@pinia/testing?logo=npm)](https://www.npmjs.com/package/@pinia/testing) [![](https://img.shields.io/github/stars/vuejs/pinia?logo=github)](https://github.com/vuejs/pinia) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://pinia.vuejs.org/cookbook/testing.html#testing-stores)
      - **`@vitest/coverage-c8`** [![](https://img.shields.io/npm/v/@vitest/coverage-c8?logo=npm)](https://www.npmjs.com/package/@vitest/coverage-c8) [![](https://img.shields.io/github/stars/vitest-dev/vitest?logo=github)](https://github.com/vitest-dev/vitest) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://vitest.dev/guide/coverage.html#coverage)
      - **`@vitest/ui`** [![](https://img.shields.io/npm/v/@vitest/ui?logo=npm)](https://www.npmjs.com/package/@vitest/ui) [![](https://img.shields.io/github/stars/vitest-dev/vitest?logo=github)](https://github.com/vitest-dev/vitest) [![](https://img.shields.io/static/v1?label=official-site&message=>)](https://vitest.dev/guide/ui.html)
      - **`jsdom`** [![](https://img.shields.io/npm/v/jsdom?logo=npm)](https://www.npmjs.com/package/jsdom) [![](https://img.shields.io/github/stars/jsdom/jsdom?logo=github)](https://github.com/jsdom/jsdom)
      - **`@types/jsdom`** [![](https://img.shields.io/npm/v/@types/jsdom?logo=npm)](https://www.npmjs.com/package/@types/jsdom) [![](https://img.shields.io/github/stars/DefinitelyTyped/DefinitelyTyped?logo=github)](https://github.com/DefinitelyTyped/DefinitelyTyped)
    - 打包分析
      - **`rollup-plugin-visualizer`** [![](https://img.shields.io/npm/v/rollup-plugin-visualizer?logo=npm)](https://www.npmjs.com/package/rollup-plugin-visualizer) [![](https://img.shields.io/github/stars/btd/rollup-plugin-visualizer?logo=github)](https://github.com/btd/rollup-plugin-visualizer)
