/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./web_ui/**/*.{html,tpl,js}"],
  theme: {
    extend: {},
    container: {
      center: true,
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
