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
  - **`typescript`** - 统一项目`ts`版本
    - [![](https://img.shields.io/npm/v/typescript?logo=npm&style=plastic&label=typescript)](https://www.npmjs.com/package/typescript)
    - [![](https://img.shields.io/github/stars/microsoft/TypeScript?logo=github&style=plastic&label=typescript)](https://github.com/microsoft/TypeScript)
    - [![](https://img.shields.io/static/v1?logo=typescript&style=plastic&label=typescript&message=official-site)](https://www.typescriptlang.org)
  - **`rimraf`** - 在打包前删除已经存在的`dist`目录
    - [![](https://img.shields.io/npm/v/rimraf?logo=npm&style=plastic&label=rimraf)](https://www.npmjs.com/package/rimraf)
    - [![](https://img.shields.io/github/stars/isaacs/rimraf?logo=github&style=plastic&label=rimraf)](https://github.com/isaacs/rimraf)
  - git hooks 拦截 - 用于执行某些 git 命令时先进行代码检查或其他操作
    - **`husky`**
      - [![](https://img.shields.io/npm/v/husky?logo=husky&style=plastic&label=husky)](https://www.npmjs.com/package/husky)
      - [![](https://img.shields.io/github/stars/microsoft/TypeScript?logo=github&style=plastic&label=typescript)](https://github.com/microsoft/TypeScript)
      - [![](https://img.shields.io/static/v1?logo=typescript&style=plastic&label=typescript&message=official-site)](https://typicode.github.io/husky)
    - **`lint-staged`**
      - [![](https://img.shields.io/npm/v/lint-staged?logo=lint-staged&style=plastic&label=lint-staged)](https://www.npmjs.com/package/lint-staged)

#### `git commit` 规范

> `git commit`改为`git cz`并将提交信息规范化

[![](https://img.shields.io/npm/v/lint-staged?logo=lint-staged&style=plastic&label=lint-staged)](https://www.npmjs.com/package/lint-staged)
[![](https://img.shields.io/npm/v/@commitlint/cli?logo=@commitlint/cli&style=plastic&label=@commitlint/cli)](https://www.npmjs.com/package/@commitlint/cli)
[![](https://img.shields.io/npm/v/@commitlint/config-conventional?logo=@commitlint/config-conventional&style=plastic&label=@commitlint/config-conventional)](https://www.npmjs.com/package/@commitlint/config-conventional)
[![](https://img.shields.io/npm/v/@commitlint/cz-commitlint?logo=@commitlint/cz-commitlint&style=plastic&label=@commitlint/cz-commitlint)](https://www.npmjs.com/package/@commitlint/cz-commitlint)
[![](https://img.shields.io/npm/v/commitizen?logo=commitizen&style=plastic&label=commitizen)](https://www.npmjs.com/package/commitizen)
[![](https://img.shields.io/npm/v/cz-conventional-changelog?logo=cz-conventional-changelog&style=plastic&label=cz-conventional-changelog)](https://www.npmjs.com/package/cz-conventional-changelog)

#### eslint

> 对`.js`,`.ts`,`.jsx`,`.tsx`,`.vue` 进行代码检查

[![](https://img.shields.io/npm/v/eslint?logo=eslint&style=plastic&label=eslint)](https://www.npmjs.com/package/eslint)
[![](https://img.shields.io/npm/v/@rushstack/eslint-patch?logo=@rushstack/eslint-patch&style=plastic&label=@rushstack/eslint-patch)](https://www.npmjs.com/package/@rushstack/eslint-patch)
[![](https://img.shields.io/npm/v/@vue/eslint-config-prettier?logo=@vue/eslint-config-prettier&style=plastic&label=@vue/eslint-config-prettier)](https://www.npmjs.com/package/@vue/eslint-config-prettier)
[![](https://img.shields.io/npm/v/@vue/eslint-config-typescript?logo=@vue/eslint-config-typescript&style=plastic&label=@vue/eslint-config-typescript)](https://www.npmjs.com/package/@vue/eslint-config-typescript)
[![](https://img.shields.io/npm/v/eslint-plugin-vue?logo=eslint-plugin-vue&style=plastic&label=eslint-plugin-vue)](https://www.npmjs.com/package/eslint-plugin-vue)

#### prettier

> 对`.js`,`.ts`,`.jsx`,`.tsx`,`.vue`,`.css`,`.md`,`.json`,`.yml`进行格式化

[![](https://img.shields.io/npm/v/@trivago/prettier-plugin-sort-imports?logo=@trivago/prettier-plugin-sort-imports&style=plastic&label=@trivago/prettier-plugin-sort-imports)](https://www.npmjs.com/package/@trivago/prettier-plugin-sort-imports)
[![](https://img.shields.io/npm/v/prettier?logo=prettier&style=plastic&label=prettier)](https://www.npmjs.com/package/prettier)
[![](https://img.shields.io/npm/v/prettier-plugin-tailwindcss?logo=prettier-plugin-tailwindcss&style=plastic&label=prettier-plugin-tailwindcss)](https://www.npmjs.com/package/prettier-plugin-tailwindcss)

#### stylelint

> 对`.css`,`.vue`进行代码检查

[![](https://img.shields.io/npm/v/stylelint?logo=stylelint&style=plastic&label=stylelint)](https://www.npmjs.com/package/stylelint)
[![](https://img.shields.io/npm/v/stylelint-config-idiomatic-order?logo=stylelint-config-idiomatic-order&style=plastic&label=stylelint-config-idiomatic-order)](https://www.npmjs.com/package/stylelint-config-idiomatic-order)
[![](https://img.shields.io/npm/v/stylelint-config-prettier?logo=stylelint-config-prettier&style=plastic&label=stylelint-config-prettier)](https://www.npmjs.com/package/stylelint-config-prettier)
[![](https://img.shields.io/npm/v/stylelint-config-recommended-vue?logo=stylelint-config-recommended-vue&style=plastic&label=stylelint-config-recommended)](https://www.npmjs.com/package/stylelint-config-recommended)
[![](https://img.shields.io/npm/v/stylelint-config-standard?logo=stylelint-config-standard&style=plastic&label=stylelint-config-standard)](https://www.npmjs.com/package/stylelint-config-standard)

#### css 相关

由于期望所有组件样式都是`@shiyue/ui`完成，所以业务项目只需要做好组件解偶，所以采用`tailwindcss`是最优解

##### tailwindcss

[![](https://img.shields.io/npm/v/tailwindcss?logo=tailwindcss&style=plastic&label=tailwindcss)](https://www.npmjs.com/package/tailwindcss)
[![](https://img.shields.io/npm/v/@tailwindcss/aspect-ratio?logo=@tailwindcss/aspect-ratio&style=plastic&label=@tailwindcss/aspect-ratio)](https://www.npmjs.com/package/@tailwindcss/aspect-ratio)

##### postcss

[![](https://img.shields.io/npm/v/postcss?logo=postcss&style=plastic&label=postcss)](https://www.npmjs.com/package/postcss)
[![](https://img.shields.io/npm/v/postcss-html?logo=postcss-html&style=plastic&label=postcss-html)](https://www.npmjs.com/package/postcss-html)
[![](https://img.shields.io/npm/v/postcss-nesting?logo=postcss-nesting&style=plastic&label=postcss-nesting)](https://www.npmjs.com/package/postcss-nesting)
[![](https://img.shields.io/npm/v/postcss-preset-env?logo=postcss-preset-env&style=plastic&label=postcss-preset-env)](https://www.npmjs.com/package/postcss-preset-env)
[![](https://img.shields.io/npm/v/postcss-reporter?logo=postcss-reporter&style=plastic&label=postcss-reporter)](https://www.npmjs.com/package/postcss-reporter)
[![](https://img.shields.io/npm/v/autoprefixer?logo=autoprefixer&style=plastic&label=autoprefixer)](https://www.npmjs.com/package/autoprefixer)
[![](https://img.shields.io/npm/v/cssnano?logo=cssnano&style=plastic&label=cssnano)](https://www.npmjs.com/package/cssnano)

### 开发

[![](https://img.shields.io/npm/v/vue?logo=vuedotjs&style=plastic&label=vue)](https://www.npmjs.com/package/vue)
[![](https://img.shields.io/npm/v/vue-router?logo=vue-router&style=plastic&label=vue-router)](https://www.npmjs.com/package/vue-router)
[![](https://img.shields.io/npm/v/pinia?logo=pinia&style=plastic&label=pinia)](https://www.npmjs.com/package/pinia)
[![](https://img.shields.io/npm/v/vue-i18n?logo=vue-i18n&style=plastic&label=vue-i18n)](https://www.npmjs.com/package/vue-18n)
[![](https://img.shields.io/npm/v/@vueuse/core?logo=@vueuse/core&style=plastic&label=@vueuse/core)](https://www.npmjs.com/package/@vueuse/core)
[![](https://img.shields.io/npm/v/@vueuse/components?logo=@vueuse/components&style=plastic&label=@vueuse/components)](https://www.npmjs.com/package/@vueuse/components)
[![](https://img.shields.io/npm/v/@vueuse/router?logo=@vueuse/router&style=plastic&label=@vueuse/router)](https://www.npmjs.com/package/@vueuse/router)

### 图标

[![](https://img.shields.io/npm/v/iconify?logo=iconify&style=plastic&label=iconify)](https://www.npmjs.com/package/iconify)
[![](https://img.shields.io/npm/v/@iconify/types?logo=@iconify/types&style=plastic&label=@iconify/types)](https://www.npmjs.com/package/@iconify/types)
[![](https://img.shields.io/npm/v/@iconify/vue?logo=@iconify/vue&style=plastic&label=@iconify/vue)](https://www.npmjs.com/package/@iconify/vue)

### 测试和假数据

#### 假数据

[![](https://img.shields.io/npm/v/@faker-js/faker?logo=@faker-js/faker&style=plastic&label=@faker-js/faker)](https://www.npmjs.com/package/@faker-js/faker)

#### e2e

[![](https://img.shields.io/npm/v/@playwright/test?logo=@playwright/test&style=plastic&label=@playwright/test)](https://www.npmjs.com/package/@playwright/test)

#### unit

[![](https://img.shields.io/npm/v/vitest?logo=vitest&style=plastic&label=vitest)](https://www.npmjs.com/package/vitest)
[![](https://img.shields.io/npm/v/@vue/test-utils?logo=@vue/test-utils&style=plastic&label=@vue/test-utils)](https://www.npmjs.com/package/@vue/test-utils)
[![](https://img.shields.io/npm/v/@pinia/testing?logo=@pinia/testing&style=plastic&label=@pinia/testing)](https://www.npmjs.com/package/@pinia/testing)
[![](https://img.shields.io/npm/v/@vitest/coverage-c8?logo=@vitest/coverage-c8&style=plastic&label=@vitest/coverage-c8)](https://www.npmjs.com/package/@vitest/coverage-c8)
[![](https://img.shields.io/npm/v/@vitest/ui?logo=@vitest/ui&style=plastic&label=@vitest/ui)](https://www.npmjs.com/package/@vitest/ui)
[![](https://img.shields.io/npm/v/jsdom?logo=jsdom&style=plastic&label=jsdom)](https://www.npmjs.com/package/jsdom)
[![](https://img.shields.io/npm/v/@types/jsdom?logo=@types/jsdom&style=plastic&label=@types/jsdom)](https://www.npmjs.com/package/@types/jsdom)
