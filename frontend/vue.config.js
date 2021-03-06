module.exports = {
  transpileDependencies: [
    'vuetify'
  ],
  publicPath: process.env.NODE_ENV === 'production'
    ? './'
    : '/',
  devServer: {
    disableHostCheck: true,
    port: 8081
  }
}
