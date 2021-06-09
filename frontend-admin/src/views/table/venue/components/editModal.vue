<template>
  <el-dialog
    :title="form.venue_id?'Edit':'Add'"
    :visible="visible"
    width="600px"
    :before-close="()=>handleClose()"
  >
    <el-form ref="form" :model="form" label-position="top">
      <el-form-item required prop="venue_name" label="Venue Name">
        <el-input v-model="form.venue_name" />
      </el-form-item>
      <el-form-item required prop="check_in_code" label="Check In Code">
        <el-input v-model="form.check_in_code" />
      </el-form-item>
      <el-form-item required prop="email_address" label="Email Address">
        <el-input v-model="form.email_address" />
      </el-form-item>
      <el-form-item required prop="shop_address" label="Shop Address">
        <el-input v-model="form.shop_address" />
      </el-form-item>
      <el-form-item required prop="is_hotspot" label="Is HotSpot">
        <el-radio-group v-model="form.is_hotspot">
          <el-radio :label="true">YES</el-radio>
          <el-radio :label="false">NO</el-radio>
        </el-radio-group>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="handleClose">Cancel</el-button>
      <el-button type="primary" @click="handleSubmit">Submit</el-button>
    </span>
  </el-dialog>
</template>

<script>
import { addVenue, editVenue } from '@/api/venue'

export default {
  name: 'EditModal',
  props: {
    visible: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      form: {}
    }
  },
  computed: {
    userName() {
      return this.$store.getters.name
    }
  },
  methods: {
    handleClose() {
      this.form = {}
      this.$emit('update:visible', false)
    },
    async setValues(info) {
      this.form = { ...info }
      await this.$nextTick()
      this.$refs.form.clearValidate()
    },
    async handleSubmit() {
      const valid = await this.$refs.form.validate()
      if (valid) {
        this.form.venue_id
          ? await editVenue(this.form.venue_id, { ...this.form, update_by: this.userName, update_time: new Date() })
          : await addVenue({
            ...this.form,
            create_time: new Date(),
            create_by: this.userName,
            update_by: this.userName,
            update_time: new Date()
          })
        this.$notify.success(`${this.form.venue_id ? 'Edit' : 'Add'} Success`)
        this.$emit('getList')
        this.handleClose()
      }
    }
  }
}
</script>

<style scoped>

</style>
