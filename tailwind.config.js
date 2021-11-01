const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  purge: [],
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        background: '#F7F7F7',
        'tundora': {
          DEFAULT: '#424242',
          '50': '#B5B5B5',
          '100': '#A8A8A8',
          '200': '#8F8F8F',
          '300': '#757575',
          '400': '#5C5C5C',
          '500': '#424242',
          '600': '#292929',
          '700': '#0F0F0F',
          '800': '#000000',
          '900': '#000000'
        },
        'mine-shaft': {
          DEFAULT: '#303030',
          '50': '#A3A3A3',
          '100': '#969696',
          '200': '#7D7D7D',
          '300': '#636363',
          '400': '#4A4A4A',
          '500': '#303030',
          '600': '#171717',
          '700': '#000000',
          '800': '#000000',
          '900': '#000000'
        },
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
