<template>
    <form @submit.prevent="$emit('addevent')">
  <input type="text" required autocomplete="off" :value=value @input="$emit('input',$event.target.value)" placeholder="Add TODO"/>
  <button class="addButton">Add</button>
  </form>
</template>

<script>
export default{
    name: 'CustomInput',
    props: ["value"]
}
</script>

<style scoped>
</style>