<template>
    <div class="todoitems">
      {{description}}
      <button class="editbutton" v-on:click="$emit('remove')"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
      <button class="deletebutton" v-on:click="$emit('edit')"><i class="fa fa-pencil" aria-hidden="true"></i></button>
  </div>
</template>

<script>
export default{
    name: 'TodoItem',
    props: ["description"]
}
</script>

<style scoped>

</style>