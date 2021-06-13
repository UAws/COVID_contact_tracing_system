<template>
  <el-form>
    <el-form-item
      v-permission="['admin']"
      label="UserLevel"
    >
      <el-select v-model.trim="localUser.Role[0].description" class="filter-item" placeholder="Please select">
        <el-option v-for="item in userTypeOptions" :key="item.key" :label="item.display_name" :value="item.key" />
      </el-select>
    </el-form-item>
    <el-form-item required label="Name">
      <el-input v-model.trim="localUser.name" />
    </el-form-item>
    <el-form-item required label="Password">
      <el-input v-model.trim="password" type="password" />
    </el-form-item>
    <el-form-item required label="Address">
      <el-input v-model.trim="localUser.address" />
    </el-form-item>
    <el-form-item required label="Phone">
      <el-input v-model.trim="localUser.phone" />
    </el-form-item>
    <el-form-item required label="Email">
      <el-input v-model.trim="localUser.emailAddress" />
    </el-form-item>
    <el-form-item label="Update Time" prop="timestamp">
      <el-date-picker v-model="localUser.update_time" type="datetime" placeholder="Please pick a date" />
    </el-form-item>

    <el-form-item required label="HotSpot Status">
      <el-radio-group v-model="localUser.is_in_hotspot">
        <el-radio :label="true">Yes</el-radio>
        <el-radio :label="false"> No </el-radio>
      </el-radio-group>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submit">Update</el-button>
    </el-form-item>
  </el-form>
</template>

<script>

const { UpdateUser } = require('@/api/myUserInfo')
import permission from '@/directive/permission/index.js' // 权限判断指令
const userTypeOptions = [
  { key: '1', display_name: 'Administrators' },
  { key: '2', display_name: 'Venue Manager' },
  { key: '3', display_name: 'General User' }
]

export default {
  directives: { permission },
  props: {
    user: {
      type: Object,
      default: () => {
        return {
          name: '',
          role: '',
          emailAddress: '',
          avatar: '',
          password: '',
          update_time: '',
          create_time: '',
          update_by: '',
          create_by: '',
          user_id: '',
          address: '',
          is_in_hotspot: '',
          is_approval: '',
          phone: '',
          Role: []
        }
      }
    }
  },
  data() {
    return {
      userTypeOptions,
      statusOptions: ['false', 'true'],
      password: '',
      localUser: this.user,
      valid: false
    }
  },
  methods: {
    submit() {
      // Clear role, we just need id;

      function isNumber(n) { return /^-?[\d.]+(?:e-?\d+)?$/.test(n) }

      const tempData = Object.assign({}, this.localUser)

      let tmp_role_id
      if (isNumber(this.localUser.Role[0].description)) {
        for (const userTypeOption of userTypeOptions) {
          if (parseInt(userTypeOption.key) === parseInt(tempData.Role[0].description)) {
            tmp_role_id = this.localUser.Role[0].description

            break
          }
        }
      } else {
        tmp_role_id = this.localUser.Role[0].role_id
      }
      // tempData.Role.push({ role_id: tmp_role_id })
      tempData.Role = []
      tempData.Role.push({
        role_id: tmp_role_id
      })
      // tempData.Role[0].role_id = tmp_role_id

      tempData.update_by = this.localUser.update_by
      tempData.update_by = new Date()

      tempData.password = this.password

      tempData.avatar = null
      tempData.role = null

      console.log(tempData)

      UpdateUser(tempData).then((response) => {
        this.localUser = response.data
        this.$message({
          message: 'User information has been updated successfully',
          type: 'success',
          duration: 5 * 1000
        })
      })
    }
  }
}
</script>
