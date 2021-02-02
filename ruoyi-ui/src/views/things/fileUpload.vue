<template>
    <div>
      <el-upload
        class="upload-demo"
        :action="uploadActionUrl"
        :headers="myHeaders"
        :on-preview="handlePreview"
        :on-remove="handleRemove"
        :before-remove="beforeRemove"
        multiple
        :limit="3"
        :on-exceed="handleExceed"
        :file-list="fileList"
        :on-success="onSuccess">
        <el-button size="small" type="primary">点击上传</el-button>
        <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
      </el-upload>
    </div>
</template>
<script>
    import  fileApi,{removeFile} from "@/api/things/fileupload";
    import { getToken } from '@/utils/auth'

    export default {
        data() {
            return {
                /**
                 * 此ID 是rou.id 也就是fileUploadId
                 */
                id: '',
                fileList:[],
                uploadActionUrl: fileApi.uploadUrl,
                myHeaders: {Authorization: 'Bearer ' + getToken()},//请求头
            }
        },

        methods: {
            setFileList(data) {
                this.fileList = data
            },
            handleRemove(file, fileList) {
                let _this = this;
                removeFile(file.path).then(response => {
                    //使用过滤器筛选出id不等于要删除的数据的所有对象，并将其重新赋值给list数组
                    _this.fileList = _this.fileList.filter((item) => {
                        return item.uid != file.uid
                    });
                    _this.$emit('func', _this.fileList);
                });
            },
            handlePreview(file) {
                //下载附件
                var x = new XMLHttpRequest();
                x.open("GET", fileApi.downloadUrl.replace("{id}",file.id), true);
                x.setRequestHeader("Authorization",'Bearer ' + getToken());
                x.responseType = "blob";
                let that = this;
                x.onprogress = function(event) {
                    //在这里监听文件下载的进度
                };
                x.onload = function(e) {
                    var url = window.URL.createObjectURL(x.response);
                    var a = document.createElement("a");
                    a.href = url;
                    a.download = file.name; //可以填写默认的下载名称
                    a.click();
                };
                x.send();
            },
            handleExceed(files, fileList) {
                this.$message.warning(`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
            },
            beforeRemove(file, fileList) {
                return this.$confirm(`确定移除 ${ file.name }？`);
            },
            /**
             * 上传成功的钩子
             * @param files
             * @param fileList
             */
            onSuccess(res, file) {
                var uploadFile={};
                if (res.code === 200) {
                    //向父组件传值
                    uploadFile.name = file.name;
                    uploadFile.path = res.fileName;
                    uploadFile.size = file.size;
                    uploadFile.id = file.uid;
                    this.fileList.push(uploadFile);
                    this.$emit('func', this.fileList);
                } else {
                    this.$message.error(res.message);
                }
            },

        }
        ,
        watch: {
            upShow(val) {
                this.show = val
            }
            ,
            fileUploadId(val) {
                this.id = val
            }
            ,
        }
    }

</script>
<style scoped>
  .el-upload__tip{
    display: inline;
    margin-left: 5px;
  }
  .el-upload{
    display: inline;
  }
</style>

