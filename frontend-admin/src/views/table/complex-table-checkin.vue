<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input v-model="listQuery.keyword" placeholder="UserName/VenueName/Check In Address" style="width: 400px;" class="filter-item" @keyup.enter.native="handleFilter" />
      <el-select v-model="listQuery.sort" style="width: 140px" class="filter-item" @change="handleFilter">
        <el-option v-for="item in sortOptions" :key="item.key" :label="item.label" :value="item.key" />
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        Search
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
      <el-table-column label="Check In ID" prop="id" align="center" width="80">
        <template slot-scope="{row}">
          <span>{{ row.check_in_id }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Username" width="200px">
        <template slot-scope="{row}">
          <span class="link-type"> {{ row.create_by }}     </span>
        </template>
      </el-table-column>
      <el-table-column label="TimeStamp" min-width="100px" align="center">
        <template slot-scope="{row}">
          <span>{{ row.CheckInTimeStamp }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Address" width="180px" align="center">
        <template slot-scope="{row}">
          <span>{{ row.CheckInAddress }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Venue Name" width="100px">
        <template slot-scope="{row}">
          <span v-if="row.venue"> {{ row.venue.venue_name }}</span>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="listQuery.page" :limit.sync="listQuery.limit" @pagination="getList" />

  </div>
</template>

<script>
import waves from '@/directive/waves' // waves directive
import Pagination from '@/components/Pagination' // secondary package based on el-pagination

const { fetchCheckInList } = require('@/api/checkIn')

const { changeInHotSport } = require('@/api/myUserInfo')

export default {
  name: 'ComplexTableCheckin',
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
      fetchCheckInList(this.listQuery).then(response => {
        this.myData = response.data.list
        this.total = response.data.total

        for (const user of this.myData) {
          user.CheckInTimeStamp = new Date(user.CheckInTimeStamp).toString()
        }

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
    // this.temp.Role[0].level = undefined
    getSortClass: function(key) {
      const sort = this.listQuery.sort
      return sort === `+${key}` ? 'ascending' : 'descending'
    }
  }
}
</script>
