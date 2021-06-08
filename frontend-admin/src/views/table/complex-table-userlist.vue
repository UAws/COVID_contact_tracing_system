<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input v-model="listQuery.keyword" placeholder="UserName" style="width: 200px;" class="filter-item" @keyup.enter.native="handleFilter" />
      <el-select v-model="listQuery.type" placeholder="User Level" clearable class="filter-item" style="width: 200px">
        <el-option v-for="item in calendarTypeOptions" :key="item.key" :label="item.display_name+' ( '+item.key+' ) '" :value="item.key" />
      </el-select>
      <el-select v-model="listQuery.sort" style="width: 140px" class="filter-item" @change="handleFilter">
        <el-option v-for="item in sortOptions" :key="item.key" :label="item.label" :value="item.key" />
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        Search
      </el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">
        Add
      </el-button>
      <el-checkbox v-model="showReviewer" class="filter-item" style="margin-left:15px;" @change="tableKey=tableKey+1">
        reviewer
      </el-checkbox>
    </div>

    <el-table
      :key="tableKey"
      v-loading="listLoading"
      :data="myData"
      border
      fit
      highlight-current-row
      style="width: 100%;"
      @sort-change="sortChange"
    >
      <el-table-column label="ID" prop="id" sortable="custom" align="center" width="80" :class-name="getSortClass('id')">
        <template slot-scope="{row}">
          <span>{{ row.user_id }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Date" width="150px" align="center">
        <template slot-scope="{row}">
          <span>{{ row.create_time }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Username" min-width="100px">
        <template slot-scope="{row}">
          <span class="link-type" @click="handleUpdate(row)"> {{ row.username }}     </span>
          <el-tag>{{ row.Role[0].description || 'haha' }}</el-tag>
          <!-- <el-tag>{{ row.is_approval | typeFilter }}</el-tag> -->
        </template>
      </el-table-column>
      <el-table-column label="Address" width="180px" align="center">
        <template slot-scope="{row}">
          <span>{{ row.address }}</span>
        </template>
      </el-table-column>
      <el-table-column v-if="showReviewer" label="Email" width="110px" align="center">
        <template slot-scope="{row}">
          <span style="color:red;">{{ row.emailAddress }}</span>
        </template>
      </el-table-column>
      <el-table-column label="UserLevel" width="100px">
        <template slot-scope="{row}">
          <svg-icon v-for="n in + row.Role[0].level" :key="n" icon-class="star" class="meta-item__icon" />
        </template>
      </el-table-column>
      <el-table-column label="Phone" align="center" width="95">
        <template slot-scope="{row}">
          <span v-if="row.phone" class="link-type" @click="handleFetchPv(row.phone)">{{ row.phone }}</span>
          <span v-else>0</span>
        </template>
      </el-table-column>
      <el-table-column label="Email" class-name="status-col" width="150">
        <template slot-scope="{row}">
          <el-tag :type="row.emailAddress | statusFilter">
            {{ row.emailAddress }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="Actions" align="center" width="230" class-name="small-padding fixed-width">
        <template slot-scope="{row,$index}">
          <el-button type="primary" size="mini" @click="handleUpdate(row)">
            Edit
          </el-button>
          <el-button v-if="row.is_in_hotspot" size="mini" type="success" @click="handleModifyStatus(row,true)">
            In HotSpot
          </el-button>
          <el-button v-if="!row.is_in_hotspot" size="mini" @click="handleModifyStatus(row,false)">
            Not In HotSpot
          </el-button>
          <el-button size="mini" type="danger" @click="handleDelete(row,$index)">
            Delete
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="getList" />

    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="150px" style="width: 400px; margin-left:50px;">
        <el-form-item label="UserLevel" prop="type">
          <el-select v-model="temp.Role[0].description" class="filter-item" placeholder="Please select">
            <el-option v-for="item in calendarTypeOptions" :key="item.key" :label="item.display_name" :value="item.key" />
          </el-select>
        </el-form-item>
        <el-form-item label="User Name" prop="username">
          <el-input v-model="temp.username" />
        </el-form-item>
        <el-form-item label="Password" prop="password">
          <el-input v-model="temp.password" />
        </el-form-item>
        <el-form-item label="Address" prop="address">
          <el-input v-model="temp.address" />
        </el-form-item>
        <el-form-item label="Phone" prop="phone">
          <el-input v-model="temp.phone" />
        </el-form-item>
        <el-form-item label="Email" prop="emailAddress">
          <el-input v-model="temp.emailAddress" />
        </el-form-item>
        <el-form-item label="Update Time" prop="timestamp">
          <el-date-picker v-model="temp.update_time" type="datetime" placeholder="Please pick a date" />
        </el-form-item>
        <el-form-item label="HotSpot Status">
          <el-radio-group v-model="temp.is_in_hotspot">
            <el-radio :label="true.toString()">Yes</el-radio>
            <el-radio :label="false.toString()"> No </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Approval">
          <el-radio-group v-model="temp.is_approval">
            <el-radio :label="true.toString()"> Approval </el-radio>
            <el-radio :label="false.toString()"> Pending </el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">
          Cancel
        </el-button>
        <el-button type="primary" @click="dialogStatus==='create'?createData():updateData()">
          Confirm
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import waves from '@/directive/waves' // waves directive
import { parseTime } from '@/utils'
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import { fetchUserList, createUser, UpdateUser, fetchUserDetails, DeleteUser } from '@/api/myUserInfo'

const { changeInHotSport } = require('@/api/myUserInfo')

const calendarTypeOptions = [
  { key: '1', display_name: 'Administrators' },
  { key: '2', display_name: 'Venue Manager' },
  { key: '3', display_name: 'General User' }
]

// arr to obj, such as { CN : "China", US : "USA" }
const calendarTypeKeyValue = calendarTypeOptions.reduce((acc, cur) => {
  acc[cur.key] = cur.display_name
  return acc
}, {})

function isNumber(n) { return /^-?[\d.]+(?:e-?\d+)?$/.test(n) }

export default {
  name: 'ComplexTable',
  components: { Pagination },
  directives: { waves },
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: 'success',
        draft: 'info',
        deleted: 'danger'
      }
      return statusMap[status]
    },
    typeFilter(type) {
      return calendarTypeKeyValue[type]
    }
  },
  data() {
    return {
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 20,
        // TODO need to be replace by user level such as 1, 2 ,3 for user, venue manager and admins . backend support required
        importance: undefined,
        keyword: undefined,
        type: undefined,
        sort: 'ASC'
      },
      importanceOptions: [1, 2, 3],
      calendarTypeOptions,
      sortOptions: [{ label: 'ID Ascending', key: 'ASC' }, { label: 'ID Descending', key: 'DESC' }],
      statusOptions: ['false', 'true'],
      showReviewer: false,
      temp: {
        update_time: new Date(),
        create_time: '',
        update_by: '',
        create_by: '',
        user_id: undefined,
        username: '',
        password: '',
        address: '',
        emailAddress: '',
        is_in_hotspot: false,
        is_approval: false,
        phone: '',
        Role: [
          {
            update_time: new Date(),
            create_time: '',
            update_by: '',
            create_by: '',
            role_id: 3,
            level: 1,
            role_name: '',
            description: ''
          }
        ]
      },
      dialogFormVisible: false,
      dialogStatus: '',
      textMap: {
        update: 'Edit',
        create: 'Create'
      },
      dialogPvVisible: false,
      // pvData: [],
      rules: {
      //   // type: [{ required: true, message: 'type is required', trigger: 'change' }]
      //   // timestamp: [{ type: 'date', required: true, message: 'timestamp is required', trigger: 'change' }],
      //   // title: [{ required: true, message: 'title is required', trigger: 'blur' }]
      },
      // downloadLoading: false,
      // our data
      myData: [
      ]
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      fetchUserList(this.listQuery).then(response => {
        this.myData = response.data.list
        for (const user of this.myData) {
          user.password = null
        }
        this.total = response.data.total

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    handleModifyStatus(row, status) {
      changeInHotSport(row.user_id).then(response => {
        this.$message({
          message: 'Success',
          type: 'success'
        })
        row.is_in_hotspot = status
      }).catch(err => {
        this.$message({
          message: err,
          type: 'error'
        })
        console.log(err)
      })
    },
    sortChange(data) {
      const { prop, order } = data
      if (prop === 'id') {
        this.sortByID(order)
      }
    },
    sortByID(order) {
      if (order === 'ascending') {
        this.listQuery.sort = 'ASC'
      } else {
        this.listQuery.sort = 'DESC'
      }
      this.handleFilter()
    },
    resetTemp() {
      this.temp = {
        update_time: new Date(),
        create_time: '2021-05-09T13:36:47.000Z',
        update_by: '123',
        create_by: 'Akide_Liu',
        user_id: undefined,
        username: 'test',
        password: '123456',
        address: 'test st, prospect, SA',
        emailAddress: 'test@adelaide.edu.au',
        is_in_hotspot: 'false',
        is_approval: 'false',
        phone: '0450460166',
        Role: [
          {
            update_time: new Date(),
            create_time: '',
            update_by: '',
            create_by: '',
            role_id: 1,
            level: 1,
            role_name: '',
            description: ''
          }
        ]
      }
    },
    handleCreate() {
      this.resetTemp()
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          this.temp.user_id = undefined
          this.temp.is_approval = true
          // TODO need to replace by Auth API
          this.temp.create_by = 'Akide_Liu'
          this.temp.update_by = 'Akide_Liu'
          this.temp.create_time = new Date()
          let tmp_role_id
          if (isNumber(this.temp.Role[0].description)) {
            for (const userTypeOption of calendarTypeOptions) {
              if (parseInt(userTypeOption.key) === parseInt(this.temp.Role[0].description)) {
                tmp_role_id = this.temp.Role[0].description

                break
              }
            }
          } else {
            tmp_role_id = this.temp.Role[0].role_id
          }
          // tempData.Role.push({ role_id: tmp_role_id })
          this.temp.Role = []
          this.temp.Role.push({
            role_id: tmp_role_id
          })

          // this.temp.Role[0].level = undefined
          createUser(this.temp).then(response => {
            response.data.password = null
            this.myData.unshift(response.data)
            // console.log(response.data)
            this.dialogFormVisible = false
            this.$notify({
              title: 'Success',
              message: 'Created Successfully',
              type: 'success',
              duration: 2000
            })
          })
        }
      })
    },
    // this.temp.Role[0].level = undefined

    handleUpdate(row) {
      row.is_approval = row.is_approval.toString()
      row.is_in_hotspot = row.is_in_hotspot.toString()
      this.temp = Object.assign({}, row) // copy obj
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          const tempData = Object.assign({}, this.temp)

          let tmp_role_id
          if (isNumber(this.temp.Role[0].description)) {
            for (const userTypeOption of calendarTypeOptions) {
              if (parseInt(userTypeOption.key) === parseInt(tempData.Role[0].description)) {
                tmp_role_id = this.temp.Role[0].description

                break
              }
            }
          } else {
            tmp_role_id = this.temp.Role[0].role_id
          }
          // tempData.Role.push({ role_id: tmp_role_id })
          tempData.Role = []
          tempData.Role.push({
            role_id: tmp_role_id
          })

          UpdateUser(tempData).then((response) => {
            const index = this.myData.findIndex(v => v.user_id === this.temp.user_id)
            this.myData.splice(index, 1, response.data)
            this.dialogFormVisible = false
            this.$notify({
              title: 'Success',
              message: 'Update Successfully',
              type: 'success',
              duration: 2000
            })
          })
        }
      })
    },
    handleDelete(row, index) {
      DeleteUser(row.user_id).then(response => {
        this.$notify({
          title: 'Success',
          message: 'Delete Successfully',
          type: 'success',
          duration: 2000
        })
        console.log(row.user_id)
        this.myData.splice(index, 1)
      })
    },
    handleFetchPv(pv) {
      fetchUserDetails(pv).then(response => {
        this.pvData = response.data.pvData
        this.dialogPvVisible = true
      })
    },
    formatJson(filterVal) {
      return this.list.map(v => filterVal.map(j => {
        if (j === 'timestamp') {
          return parseTime(v[j])
        } else {
          return v[j]
        }
      }))
    },
    getSortClass: function(key) {
      const sort = this.listQuery.sort
      return sort === `+${key}` ? 'ascending' : 'descending'
    }
  }
}
</script>
