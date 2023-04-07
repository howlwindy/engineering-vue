import autoprefixer from 'autoprefixer'
import cssnano from 'cssnano'
import postcssImport from 'postcss-import'
import postcssNesting from 'postcss-nesting'
import postcssPresetEnv from 'postcss-preset-env'
import postcssReporter from 'postcss-reporter'
import stylelint from 'stylelint'
import tailwindcss from 'tailwindcss'
import tailwindcssNesting from 'tailwindcss/nesting'

import tailwindConfig from './tailwind.config'

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
