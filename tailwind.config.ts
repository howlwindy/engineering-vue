import type {Config} from 'tailwindcss'

export default {
  content: ['./index.html', './src/**/*.{css,vue,ts,tsx}'],
  darkMode: 'class',
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
} satisfies Config
