<template>
  <v-app style="background: rgb(0, 38, 77)">
    <v-container fluid>
      <Header />
      <v-row>
        <v-col
          cols="12"
          xl="8"
          lg="8"
          class="d-none d-sm-none d-md-none d-lg-flex"
        >
          <!-- TODO url must replaced -->
          <v-img
            class="mx-auto white--text align-end"
            src="https://cdn.jsdelivr.net/gh/UAws/COVID_contact_tracing_system/frontend-admin/src/assets/login.png"
            height="90vh"
            style="margin-top: 5vh"
          />
        </v-col>

        <v-col cols="12" xl="4" lg="4" md="4" class="login">
          <SignupComponent />

        </v-col>
      </v-row>

    </v-container>
  </v-app>
</template>

<script>
import { validUsername } from '@/utils/validate'
import Header from '@/views/login/components/Header'
import SignupComponent from '@/views/login/components/SignupComponent'

export default {
  name: 'Signup',
  components: { Header, SignupComponent },
  data() {
    const validateUsername = (rule, value, callback) => {
      if (!validUsername(value)) {
        callback(new Error('Please enter the correct user name'))
      } else {
        callback()
      }
    }
    const validatePassword = (rule, value, callback) => {
      if (value.length < 6) {
        callback(new Error('The password can not be less than 6 digits'))
      } else {
        callback()
      }
    }
    return {
      loginForm: {
        username: '',
        password: '',
        email: '',
        userLevels: ''
      },
      loginRules: {
        username: [{ required: true, trigger: 'blur', validator: validateUsername }],
        password: [{ required: true, trigger: 'blur', validator: validatePassword }]
      },
      passwordType: 'password',
      capsTooltip: false,
      loading: false,
      showDialog: false,
      redirect: undefined,
      otherQuery: {}
    }
  },
  mounted() {
  },
  destroyed() {
    // window.removeEventListener('storage', this.afterQRScan)
  },
  methods: {
    checkCapslock(e) {
      const { key } = e
      this.capsTooltip = key && key.length === 1 && (key >= 'A' && key <= 'Z')
    },
    showPwd() {
      if (this.passwordType === 'password') {
        this.passwordType = ''
      } else {
        this.passwordType = 'password'
      }
      this.$nextTick(() => {
        this.$refs.password.focus()
      })
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true
          this.$store.dispatch('user/signup', this.loginForm)
            .then(() => {
              this.$router.push({ path: this.redirect || '/', query: this.otherQuery })
              this.loading = false
            })
            .catch(() => {
              this.loading = false
            })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    getOtherQuery(query) {
      return Object.keys(query).reduce((acc, cur) => {
        if (cur !== 'redirect') {
          acc[cur] = query[cur]
        }
        return acc
      }, {})
    }
    // afterQRScan() {
    //   if (e.key === 'x-admin-oauth-code') {
    //     const code = getQueryObject(e.newValue)
    //     const codeMap = {
    //       wechat: 'code',
    //       tencent: 'code'
    //     }
    //     const type = codeMap[this.auth_type]
    //     const codeName = code[type]
    //     if (codeName) {
    //       this.$store.dispatch('LoginByThirdparty', codeName).then(() => {
    //         this.$router.push({ path: this.redirect || '/' })
    //       })
    //     } else {
    //       alert('第三方登录失败')
    //     }
    //   }
    // }
  }
}
</script>

  <style lang="scss">
    /* 修复input 背景不协调 和光标变色 */
    /* Detail see https://github.com/PanJiaChen/vue-element-admin/pull/927 */

    $bg:#283443;
    $light_gray:#fff;
    $cursor: #fff;

    @supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
    .login-container .el-input input {
    color: $cursor;
    }
    }

    /* reset element-ui css */
    .login-container {
    .el-input {
    display: inline-block;
    height: 47px;
    width: 85%;

    input {
    background: transparent;
    border: 0px;
    -webkit-appearance: none;
    border-radius: 0px;
    padding: 12px 5px 12px 15px;
    color: $light_gray;
    height: 47px;
    caret-color: $cursor;

    &:-webkit-autofill {
    box-shadow: 0 0 0px 1000px $bg inset !important;
    -webkit-text-fill-color: $cursor !important;
    }
    }
    }

    .el-form-item {
    border: 1px solid rgba(255, 255, 255, 0.1);
    background: rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    color: #454545;
    }
    }
  </style>

  <style lang="scss" scoped>
    $bg:#2d3a4b;
    $dark_gray:#889aa4;
    $light_gray:#eee;

    .login-container {
    min-height: 100%;
    width: 100%;
    background-color: $bg;
    overflow: hidden;

    .login-form {
    position: relative;
    width: 520px;
    max-width: 100%;
    padding: 160px 35px 0;
    margin: 0 auto;
    overflow: hidden;
    }

    .tips {
    font-size: 14px;
    color: #fff;
    margin-bottom: 10px;

    span {
    &:first-of-type {
    margin-right: 16px;
    }
    }
    }

    .svg-container {
    padding: 6px 5px 6px 15px;
    color: $dark_gray;
    vertical-align: middle;
    width: 30px;
    display: inline-block;
    }

    .title-container {
    position: relative;

    .title {
    font-size: 26px;
    color: $light_gray;
    margin: 0px auto 40px auto;
    text-align: center;
    font-weight: bold;
    }
    }

    .show-pwd {
    position: absolute;
    right: 10px;
    top: 7px;
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
    }

    .thirdparty-button {
    position: absolute;
    right: 0;
    bottom: 6px;
    }

    @media only screen and (max-width: 470px) {
    .thirdparty-button {
    display: none;
    }
    }
    }

    .login {
      padding-top: 6vh;
    }
  </style>
