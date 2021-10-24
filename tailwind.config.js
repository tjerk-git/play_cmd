const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  purge: [],
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        background: '#F7F7F7',
        darkColor: '#212121',
        darkBackground: '#121212',
      },
      fontFamily: {
        sans: ['Mulish', ...defaultTheme.fontFamily.sans],
      },
      listStyleType: {
        disc: 'disc',
        decimal: 'decimal',
      }
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
