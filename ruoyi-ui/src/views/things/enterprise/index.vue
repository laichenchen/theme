<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系人" prop="contact">
        <el-input
          v-model="queryParams.contact"
          placeholder="请输入联系人"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['things:enterprise:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['things:enterprise:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['things:enterprise:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['things:enterprise:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>
    <el-row :gutter="10">
      <el-col :span="12">
    <el-table v-loading="loading" :data="enterpriseList" @selection-change="handleSelectionChange" highlight-current-row>
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="名称" align="center" prop="name" />
      <el-table-column label="地址" align="center" prop="address" :formatter="addressFormat" />
      <el-table-column label="联系人" align="center" prop="contact" />
      <el-table-column label="联系电话" align="center" prop="contactMobile" />
      <el-table-column label="邮件地址" align="center" prop="email" />
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
      </el-col>
      <el-col :span="12">
        <ShowLeafletMap ref="showLeafletMap"></ShowLeafletMap>
      </el-col>
    </el-row>
    <!-- 添加或修改企业信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="地址" prop="address">
          <el-select v-model="form.address" placeholder="请选择地址">
            <el-option
              v-for="dict in addressOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="地址详情" prop="addressDetail">
          <el-input v-model="form.addressDetail" placeholder="请输入地址详情" />
        </el-form-item>
        <el-form-item label="地图坐标" prop="addressMap">
          <el-link :underline="false" type="primary" @click="showMap"><i style="font-size: 25px;" class="el-icon-location-information"></i></el-link>
          <LeafletMap ref="leafletMap" v-if="mapShow" @func="getLatLng"></LeafletMap>
        </el-form-item>
        <el-form-item label="联系人" prop="contact">
          <el-input v-model="form.contact" placeholder="请输入联系人" />
        </el-form-item>
        <el-form-item label="联系电话" prop="contactMobile">
          <el-input v-model="form.contactMobile" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="邮件地址" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮件地址" />
        </el-form-item>
        <el-form-item label="企业文件资料" prop="fileIds">
          <FileUpload ref="fileUpload" @func="getFileList"></FileUpload>
        </el-form-item>
        <el-form-item label="备注信息" prop="remarks">
          <el-input v-model="form.remarks" placeholder="请输入备注信息" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listEnterprise, getEnterprise, delEnterprise, addEnterprise, updateEnterprise, exportEnterprise } from "@/api/things/enterprise";
import FileUpload from "../fileUpload.vue"
import LeafletMap from "../editVueLeaflet.vue"
import ShowLeafletMap from "../showVueLeaflet.vue"
export default {
  name: "Enterprise",
    components: {
        FileUpload,
        LeafletMap,
        ShowLeafletMap
    },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 企业信息表格数据
      enterpriseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 地址字典
      addressOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        contact: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
        fileIds: [],
        //附件
        fileList:[],
        //地图显示
        mapShow:false
    };
  },
  created() {
    this.getList();
    this.getDicts("sys_user_sex").then(response => {
      this.addressOptions = response.data;
    });
  },
  methods: {
    /** 查询企业信息列表 */
    getList() {
      this.loading = true;
      listEnterprise(this.queryParams).then(response => {
        this.enterpriseList = response.rows;
        this.total = response.total;
        this.loading = false;
          if(response.rows.length>0){
              this.$nextTick(()=>{
                  this.$refs.showLeafletMap.resetLatlng(response.rows);
              })
          }
      });
    },
    // 地址字典翻译
    addressFormat(row, column) {
      return this.selectDictLabel(this.addressOptions, row.address);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        address: null,
        addressDetail: null,
        addressMap: null,
        contact: null,
        contactMobile: null,
        email: null,
        remarks: null,
        delFlag: null,
          fileList:[],
          latlng:null
      };
      this.resetForm("form");
        this.fileList=[];
        this.mapShow=false
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加企业信息";
        this.$nextTick(()=>{
            this.$refs.fileUpload.setFileList(this.fileList);
        })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getEnterprise(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改企业信息";
          this.fileList = response.data.fileList;
          this.$nextTick(()=>{
              this.$refs.fileUpload.setFileList(this.fileList);
          })
      });
    },
    /** 提交按钮 */
    submitForm() {
        this.$refs["leafletMap"].setLatLng()
        this.form.fileList=JSON.parse(JSON.stringify(this.fileList));
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateEnterprise(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addEnterprise(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认删除企业信息编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delEnterprise(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有企业信息数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportEnterprise(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    },
      getFileList(data){
          this.fileList = data;
      },
      showMap(){
        if(this.mapShow){
            this.mapShow=false
        }else {
            this.mapShow=true;
            this.$nextTick(()=>{
                this.$refs.leafletMap.resetLatlng(this.form.latlng);
            })
        }
      },
      getLatLng(data){
          this.form.latlng = JSON.stringify(data);
      },
      rowClick(selection, row){
          this.$refs.showLeafletMap.lightHeight(selection.id);
      }
  }
};
</script>
