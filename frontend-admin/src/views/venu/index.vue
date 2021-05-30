<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input v-model="listQuery.keyword" placeholder="Keyword" style="width: 200px;" class="filter-item" @keyup.enter.native="handleFilter" />
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        Search
      </el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">
        Add
      </el-button>
      <el-button v-waves :loading="downloadLoading" class="filter-item" type="primary" icon="el-icon-download" @click="handleDownload">
        Export
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
          <span class="link-type" @click="handleUpdate(row)">{{ row.username }}</span>
          <el-tag>{{ row.is_approval | typeFilter }}</el-tag>
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
          <el-button v-if="!row.is_in_hotspot" size="mini" type="success" @click="handleModifyStatus(row,true)">
            In HotSpot
          </el-button>
          <el-button v-if="row.is_in_hotspot" size="mini" @click="handleModifyStatus(row,false)">
            Not In HotSpot
          </el-button>
          <el-button v-if="row.status!='deleted'" size="mini" type="danger" @click="handleDelete(row,$index)">
            Delete
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="getList" />

    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="temp" label-position="left" label-width="70px" style="width: 400px; margin-left:50px;">
        <el-form-item label="Type" prop="type">
          <el-select v-model="temp.type" class="filter-item" placeholder="Please select">
            <el-option v-for="item in calendarTypeOptions" :key="item.key" :label="item.display_name" :value="item.key" />
          </el-select>
        </el-form-item>
        <el-form-item label="Update Time" prop="timestamp">
          <el-date-picker v-model="temp.update_time" type="datetime" placeholder="Please pick a date" />
        </el-form-item>
        <el-form-item label="UserName" prop="title">
          <el-input v-model="temp.username" />
        </el-form-item>
        <el-form-item label="Password" prop="password">
          <el-input v-model="temp.password" />
        </el-form-item>
        <el-form-item label="Address" prop="address">
          <el-input v-model="temp.address" />
        </el-form-item>
        <el-form-item label="Email" prop="emailAddress">
          <el-input v-model="temp.emailAddress" />
        </el-form-item>
        <el-form-item label="Phone" prop="phone">
          <el-input v-model="temp.phone" />
        </el-form-item>
        <el-form-item label="HostSport Status">
          <el-select v-model="temp.is_in_hotspot" class="filter-item" placeholder="Please select">
            <el-option v-for="item in statusOptions" :key="item" :label="item" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item label="UserLevel">
          <el-rate v-model="temp.Role[0].level" :colors="['#99A9BF', '#F7BA2A', '#FF9900']" :max="3" style="margin-top:8px;" />
        </el-form-item>
        <el-form-item label="Remark">
          <el-input v-model="temp.remark" :autosize="{ minRows: 2, maxRows: 4}" type="textarea" placeholder="Please input" />
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

    <el-dialog :visible.sync="dialogPvVisible" title="Reading statistics">
      <el-table :data="pvData" border fit highlight-current-row style="width: 100%">
        <el-table-column prop="key" label="Channel" />
        <el-table-column prop="pv" label="Pv" />
      </el-table>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogPvVisible = false">Confirm</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { fetchPv, updateArticle } from '@/api/article'
import waves from '@/directive/waves' // waves directive
import { parseTime } from '@/utils'
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import { createUser } from '@/api/myUserInfo'
import { listVenue } from '@/api/venue'
const calendarTypeOptions = [
  { key: 'CN', display_name: 'China' },
  { key: 'US', display_name: 'USA' },
  { key: 'JP', display_name: 'Japan' },
  { key: 'EU', display_name: 'Eurozone' }
]

// arr to obj, such as { CN : "China", US : "USA" }
const calendarTypeKeyValue = calendarTypeOptions.reduce((acc, cur) => {
  acc[cur.key] = cur.display_name
  return acc
}, {})

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
        keyword: undefined,
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
        is_in_hotspot: 'false',
        is_approval: 'false',
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
      pvData: [],
      rules: {
        // type: [{ required: true, message: 'type is required', trigger: 'change' }]
        // timestamp: [{ type: 'date', required: true, message: 'timestamp is required', trigger: 'change' }],
        // title: [{ required: true, message: 'title is required', trigger: 'blur' }]
      },
      downloadLoading: false,
      // our data
      myData: [
      ]
    }
  },
  created() {
    this.getList()
  },
  methods: {
    async getList() {
      this.listLoading = true
      const res = await listVenue(this.listQuery)
      this.myData = res.data.list
      this.total = res.data.total
      this.listLoading = false
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    handleModifyStatus(row, status) {
      this.$message({
        message: '操作Success',
        type: 'success'
      })
      row.is_in_hotspot = status
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
            role_id: 1,
            level: 1
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
          switch (this.temp.Role[0].level) {
            case 1:
              this.temp.Role[0].role_id = 3
              break
            case 2:
              this.temp.Role[0].role_id = 2
              break
            case 3:
              this.temp.Role[0].role_id = 1
              break
            default:
              this.temp.Role[0].role_id = 3
          }
          // this.temp.Role[0].level = undefined
          createUser(this.temp).then(response => {
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
    handleUpdate(row) {
      this.temp = Object.assign({}, row) // copy obj
      this.temp.timestamp = new Date(this.temp.timestamp)
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
          tempData.timestamp = +new Date(tempData.timestamp) // change Thu Nov 30 2017 16:41:05 GMT+0800 (CST) to 1512031311464
          updateArticle(tempData).then(() => {
            const index = this.list.findIndex(v => v.id === this.temp.id)
            this.list.splice(index, 1, this.temp)
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
      this.$notify({
        title: 'Success',
        message: 'Delete Successfully',
        type: 'success',
        duration: 2000
      })
      this.list.splice(index, 1)
    },
    handleFetchPv(pv) {
      fetchPv(pv).then(response => {
        this.pvData = response.data.pvData
        this.dialogPvVisible = true
      })
    },
    handleDownload() {
      this.downloadLoading = true
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['timestamp', 'title', 'type', 'importance', 'status']
        const filterVal = ['timestamp', 'title', 'type', 'importance', 'status']
        const data = this.formatJson(filterVal)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'table-list'
        })
        this.downloadLoading = false
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
