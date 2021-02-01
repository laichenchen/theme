<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入设备名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设备类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择设备类型" clearable size="small">
          <el-option
            v-for="dict in typeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="设备厂家" prop="supplierId">
        <el-select v-model="queryParams.supplierId" placeholder="请选择设备厂家" clearable size="small">
          <el-option
            v-for="dict in supplierIdOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
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
          v-hasPermi="['things:basedevice:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['things:basedevice:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['things:basedevice:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['things:basedevice:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="deviceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="设备名称" align="center" prop="name"/>
      <el-table-column label="设备型号" align="center" prop="model"/>
      <el-table-column label="设备类型" align="center" prop="type" :formatter="typeFormat"/>
      <el-table-column label="产品资料文件" align="center" prop="fileIds"/>
      <el-table-column label="生产日期" align="center" prop="productionDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.productionDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="设备厂家" align="center" prop="supplierId" :formatter="supplierIdFormat"/>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['things:basedevice:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['things:basedevice:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改设备基础信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="设备名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入设备名称"/>
        </el-form-item>
        <el-form-item label="设备型号" prop="model">
          <el-input v-model="form.model" placeholder="请输入设备型号"/>
        </el-form-item>
        <el-form-item label="设备类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择设备类型">
            <el-option
              v-for="dict in typeOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="产品资料文件" prop="fileIds">
          <el-input v-model="form.fileIds" placeholder="请输入产品资料文件"/>
        </el-form-item>
        <el-form-item label="生产日期" prop="productionDate">
          <el-date-picker clearable size="small" style="width: 200px"
                          v-model="form.productionDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="选择生产日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="设备厂家ID" prop="supplierId">
          <el-select v-model="form.supplierId" placeholder="请选择设备厂家ID">
            <el-option
              v-for="dict in supplierIdOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="备注信息" prop="remarks">
          <el-input v-model="form.remarks" type="textarea" placeholder="请输入内容"/>
        </el-form-item>
        <el-row>
          <el-card>
            <el-row class="text-right m-b">
              <el-button type="primary" @click="handleAddSub()">
                添加行
              </el-button>
              <el-button type="danger" plain @click="batchRemove">
                删除行
              </el-button>
              <el-button type="primary" @click="handleInsert">
                插入行
              </el-button>
              <el-button type="primary" @click="handleMove(1)">
                上移
              </el-button>
              <el-button type="primary" @click="handleMove(0)">
                下移
              </el-button>
              <el-button type="primary" @click="handleTopOrBottom(1)">
                置顶
              </el-button>
              <el-button type="primary" @click="handleTopOrBottom(0)">
                置底
              </el-button>
              <el-button type="primary" @click="clearList">
                清空
              </el-button>
            </el-row>
            <el-row :span="24">
              <el-table ref="studentTable" :data="lpBaseDeviceParametersData" style="width: 100%"
                        :row-class-name="tableRowClassName"
                        @selection-change="clickLogCheckboxHandler" @current-change="currentChange"
                        highlight-current-row stripe border>
                <el-table-column type="index" label="序号"/>
                <el-table-column prop="name" label="参数名称">
                  <template slot-scope="scope">
                    <el-form-item :prop="'lpBaseDeviceParametersData.'+scope.$index+'.name'" label-width="0">
                      <el-input v-if="scope.row.showFormDom" v-model="scope.row.name"/>
                      <div v-else>
                        {{ scope.row.name }}
                      </div>
                    </el-form-item>
                  </template>
                </el-table-column>
                <el-table-column prop="controlType" label="控制类型">
                  <template slot-scope="scope">
                    <el-form-item :prop="'lpBaseDeviceParametersData.'+scope.$index+'.controlType'" label-width="0">
                      <el-input v-if="scope.row.showFormDom" v-model="scope.row.controlType"/>
                      <div v-else>
                        {{ scope.row.controlType }}
                      </div>
                    </el-form-item>
                  </template>
                </el-table-column>
                <el-table-column prop="interfaceName" label="接口名称">
                  <template slot-scope="scope">
                    <el-form-item :prop="'lpBaseDeviceParametersData.'+scope.$index+'.interfaceName'" label-width="0">
                      <el-input v-if="scope.row.showFormDom" v-model="scope.row.interfaceName"/>
                      <div v-else>
                        {{ scope.row.interfaceName }}
                      </div>
                    </el-form-item>
                  </template>
                </el-table-column>
                <el-table-column prop="remarks" label="备注信息">
                  <template slot-scope="scope">
                    <el-form-item :prop="'lpBaseDeviceParametersData.'+scope.$index+'.remarks'" label-width="0">
                      <el-input v-if="scope.row.showFormDom" v-model="scope.row.remarks"/>
                      <div v-else>
                        {{ scope.row.remarks }}
                      </div>
                    </el-form-item>
                  </template>
                </el-table-column>
              </el-table>
            </el-row>
          </el-card>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
    import {listDevice, getDevice, delDevice, addDevice, updateDevice, exportDevice} from "@/api/things/basedevice";

    export default {
        name: "Device",
        data() {
            return {
                // 选中的行
                selected: null,
                rowIndex: 0,
                lpBaseDeviceParametersData: [],
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
                // 设备基础信息表格数据
                deviceList: [],
                // 弹出层标题
                title: "",
                // 是否显示弹出层
                open: false,
                // 设备类型(01.温度02.压力)字典
                typeOptions: [],
                // 设备厂家ID字典
                supplierIdOptions: [],
                // 查询参数
                queryParams: {
                    pageNum: 1,
                    pageSize: 10,
                    name: null,
                    type: null,
                    supplierId: null,
                },
                // 表单参数
                form: {},
                // 表单校验
                rules: {}
            };
        },
        created() {
            this.getList();
            this.getDicts("sys_user_sex").then(response => {
                this.typeOptions = response.data;
            });
            this.getDicts("sys_user_sex").then(response => {
                this.supplierIdOptions = response.data;
            });
        },
        methods: {
            /** 查询设备基础信息列表 */
            getList() {
                this.loading = true;
                listDevice(this.queryParams).then(response => {
                    this.deviceList = response.rows;
                    this.total = response.total;
                    this.loading = false;
                });
            },
            // 设备类型(01.温度02.压力)字典翻译
            typeFormat(row, column) {
                return this.selectDictLabel(this.typeOptions, row.type);
            },
            // 设备厂家ID字典翻译
            supplierIdFormat(row, column) {
                return this.selectDictLabel(this.supplierIdOptions, row.supplierId);
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
                    model: null,
                    type: null,
                    fileIds: null,
                    productionDate: null,
                    supplierId: null,
                    remarks: null,
                    delFlag: null,
                    lpBaseDeviceParametersList: []
                };
                this.resetForm("form");
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
                this.single = selection.length !== 1
                this.multiple = !selection.length
            },
            /** 新增按钮操作 */
            handleAdd() {
                this.reset();
                this.open = true;
                this.title = "添加设备基础信息";
            },
            /** 修改按钮操作 */
            handleUpdate(row) {
                this.reset();
                const id = row.id || this.ids
                getDevice(id).then(response => {
                    console.log(response)
                    this.form = response.data;
                    this.open = true;
                    this.title = "修改设备基础信息";
                    this.lpBaseDeviceParametersData = this.form.lpBaseDeviceParametersList
                });
            },
            /** 提交按钮 */
            submitForm() {
                this.form.lpBaseDeviceParametersList = JSON.parse(JSON.stringify(this.lpBaseDeviceParametersData));
                this.$refs["form"].validate(valid => {
                    if (valid) {
                        if (this.form.id != null) {
                            updateDevice(this.form).then(response => {
                                this.msgSuccess("修改成功");
                                this.open = false;
                                this.getList();
                            });
                        } else {
                            addDevice(this.form).then(response => {
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
                this.$confirm('是否确认删除设备基础信息编号为"' + ids + '"的数据项?', "警告", {
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    type: "warning"
                }).then(function () {
                    return delDevice(ids);
                }).then(() => {
                    this.getList();
                    this.msgSuccess("删除成功");
                })
            },
            /** 导出按钮操作 */
            handleExport() {
                const queryParams = this.queryParams;
                this.$confirm('是否确认导出所有设备基础信息数据项?', "警告", {
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    type: "warning"
                }).then(function () {
                    return exportDevice(queryParams);
                }).then(response => {
                    this.download(response.msg);
                })
            },
            tableRowClassName({row, rowIndex}) {
                row.row_index = rowIndex
            },
            clickLogCheckboxHandler(selection) {
                this.selecteds = selection
            },
            handleAddSub() {
                const list = {
                    name: '',
                    controlType: '',
                    interfaceName: '',
                    remarks: '',
                    showFormDom: true
                }
                if (this.selected !== null) {
                    const index = this.selected.row_index
                    this.$set(this.lpBaseDeviceParametersData[index], 'showFormDom', false)
                }
                this.lpBaseDeviceParametersData.push(list);
                this.selected = list
                this.selected.row_index = this.lpBaseDeviceParametersData.length - 1
                this.$refs.studentTable.setCurrentRow(this.lpBaseDeviceParametersData[this.selected.row_index])

            },
            currentChange(newRow, oldRow) {
                if (this.selected !== null) {
                    if (newRow.row_index !== this.selected.row_index) {
                        const index = this.selected.row_index
                        this.$set(this.lpBaseDeviceParametersData[newRow.row_index], 'showFormDom', true)
                        this.$set(this.lpBaseDeviceParametersData[index], 'showFormDom', false)
                        this.selected = newRow
                    }
                } else {
                    this.$set(this.lpBaseDeviceParametersData[newRow.row_index], 'showFormDom', true)
                    this.selected = newRow
                }
            },
            batchRemove() {
                this.$confirm('确认删除选中记录吗？', '提示', {
                    type: 'warning'
                })
                    .then(() => {
                        if (this.selected !== null) {
                            this.lpBaseDeviceParametersData.splice(this.selected.row_index, 1)
                            this.selected = null
                            this.$message({
                                message: '删除成功',
                                type: 'success'
                            })
                        } else {
                            this.$message({
                                message: '请选择要删除的行！',
                                type: 'warning'
                            })
                        }
                    })
                    .catch(() => {
                    })
            },
            handleInsert() {
                if (this.selected !== null) {
                    const list = {
                        name: '',
                        controlType: '',
                        interfaceName: '',
                        remarks: '',
                        showFormDom: true
                    }
                    if (this.lpBaseDeviceParametersData.length > 0) {
                        const index = this.selected.row_index
                        this.$set(this.lpBaseDeviceParametersData[index], 'showFormDom', false)
                        this.lpBaseDeviceParametersData.splice(index, 0, list)
                        this.selected = list
                        this.selected.row_index = index
                        this.$refs.studentTable.setCurrentRow(this.lpBaseDeviceParametersData[index])
                    } else {
                        this.lpBaseDeviceParametersData.push(list)
                        this.selected = list
                        this.selected.row_index = 0
                        this.$refs.studentTable.setCurrentRow(this.lpBaseDeviceParametersData[0])
                    }
                } else {
                    this.$message.warning('请选择插入位置！')
                }
            },
            handleMove(dir) {
                if (this.selected !== null) {
                    const moveComm = (curIndex, nextIndex) => {
                        const arr = this.lpBaseDeviceParametersData
                        arr[curIndex] = arr.splice(nextIndex, 1, arr[curIndex])[0]
                        return arr
                    }
                    this.lpBaseDeviceParametersData.some((val, index) => {
                        if (val.name === this.selected.name) {
                            if (dir === 1 && index === 0) {
                                this.$message.warning('已在顶部！')
                            } else if (dir === 0 && index === this.lpBaseDeviceParametersData.length - 1) {
                                this.$message.warning('已在底部！')
                            } else {
                                const nextIndex = dir === 1 ? index - 1 : index + 1
                                this.lpBaseDeviceParametersData = moveComm(index, nextIndex)
                            }
                            return true
                        }
                        return false
                    })
                } else {
                    this.$message.warning('请选择操作的行！')
                }
            },
            handleTopOrBottom(dir) {
                if (this.selected !== null) {
                    const moveComm = (curIndex, nextIndex) => {
                        const arr = this.lpBaseDeviceParametersData
                        arr[curIndex] = arr.splice(nextIndex, 1, arr[curIndex])[0]
                        return arr
                    }
                    this.lpBaseDeviceParametersData.some((val, index) => {
                        if (val.name === this.selected.name) {
                            if (dir === 1 && index === 0) {
                                this.$message.warning('已在顶部！')
                            } else if (dir === 0 && index === this.lpBaseDeviceParametersData.length - 1) {
                                this.$message.warning('已在底部！')
                            } else {
                                const nextIndex = dir === 1 ? 0 : this.lpBaseDeviceParametersData.length - 1
                                this.lpBaseDeviceParametersData = moveComm(index, nextIndex)
                            }
                            return true
                        }
                        return false
                    })
                } else {
                    this.$message.warning('请选择操作的行！')
                }
            },
            clearList() {
                this.$confirm('确认执行清空操作吗？', '提示', {
                    type: 'warning'
                })
                    .then(() => {
                        this.lpBaseDeviceParametersData = []
                        this.selected = null
                        this.$message({
                            message: '清空完成！',
                            type: 'success'
                        })
                    })
            }
        }
    };
</script>
