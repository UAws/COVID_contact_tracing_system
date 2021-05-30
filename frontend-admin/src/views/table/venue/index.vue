<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input
        v-model="listQuery.keyword"
        placeholder="Title"
        style="width: 200px;"
        class="filter-item"
        @keyup.enter.native="handleFilter"
      />
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        Search
      </el-button>
      <el-button
        class="filter-item"
        style="margin-left: 10px;"
        type="primary"
        icon="el-icon-edit"
        @click="handleUpdate({})"
      >
        Add
      </el-button>
      <el-button
        v-waves
        :loading="downloadLoading"
        class="filter-item"
        type="primary"
        icon="el-icon-download"
        @click="handleDownload"
      >
        Export
      </el-button>
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
      <el-table-column
        label="ID"
        prop="venue_id"
        sortable="custom"
        align="center"
        width="80"
        :class-name="getSortClass('id')"
      />
      <el-table-column label="Check In Code" prop="check_in_code" />
      <el-table-column label="Email Address" prop="email_address" />
      <el-table-column label="Venue Name" prop="venue_name" />
      <el-table-column label="Shop Address" prop="shop_address" />
      <el-table-column label="Is HotSpot" width="100">
        <template slot-scope="{row}">
          <span>{{ row.is_hotspot ? 'yes' : 'no' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Actions" align="center" width="250" class-name="small-padding fixed-width">
        <template slot-scope="{row,$index}">
          <el-button type="text" size="mini" @click="handleUpdate(row)">
            Edit
          </el-button>
          <el-button size="mini" type="text" @click="handleModifyStatus(row,!row.is_in_hotspot)">
            {{ !row.is_in_hotspot ? 'In HotSpot' : 'Not In HotSpot' }}
          </el-button>
          <el-button v-if="row.status!=='deleted'" size="mini" type="text" @click="handleDelete(row,$index)">
            Delete
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="getList"
    />
    <edit-modal ref="editModal" :visible.sync="ctrl.showEditModal" @update="getList" />
  </div>
</template>

<script>
import { fetchPv, updateArticle } from '@/api/article'
import { createUser } from '@/api/myUserInfo'
import { delVenue, editVenue, listVenue } from '@/api/venue'
import Pagination from '@/components/Pagination' // secondary package based on el-pagination
import waves from '@/directive/waves' // waves directive
import { parseTime } from '@/utils'
import editModal from './components/editModal'

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
  components: { Pagination, editModal },
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
      ctrl: {
        showEditModal: false
      },
      tableKey: 0,
      list: null,
      total: 0,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 20,
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
      myData: []
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.listLoading = true
      listVenue(this.listQuery).then(response => {
        this.myData = response.data.list
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
    async handleModifyStatus(row, status) {
      const res = await editVenue(row.id, { ...row, status })
      if (res.code === 20000) {
        this.$message({
          message: '操作Success',
          type: 'success'
        })
        // eslint-disable-next-line require-atomic-updates
        row.is_in_hotspot = status
      }
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
    async handleUpdate(row) {
      this.ctrl.showEditModal = true
      await this.$nextTick()
      this.$refs.editModal.setValues(row)
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
    async handleDelete(row, index) {
      const res = await delVenue(row.id)
      if (res.code === 20000) {
        this.$notify({
          title: 'Success',
          message: 'Delete Successfully',
          type: 'success',
          duration: 2000
        })
        this.list.splice(index, 1)
      }
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
