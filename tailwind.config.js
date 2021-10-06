const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        background: '#F7F7F7'
      },
      fontFamily: {
        sans: ['Mulish', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  variants: {
    extend: {
        gray: colors.trueGray,
        gradientFirst: '#30DB81',
        gradientSecond: '#26AB93',
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/aspect-ratio'),
  ]
}
