<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default  {
  name:  'App'
}
</script>
<style>
  .el-table__body tr.current-row>td{
    background-color: #aad9f1 !important;
    font-weight: 600;
  }
</style>
