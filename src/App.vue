<template>
  <div id="app">
    <div class="headerDiv">
      <ul>
        <li id="brandName">Todos App</li>
        <li> <router-link class="rlink" to="/contact"> Contact </router-link> </li>
        <li> <router-link class="rlink" to="/about"> About </router-link> </li>
        <li> <router-link class="rlink" to="/"> Home </router-link> </li>
      </ul>
    </div>
		<router-view></router-view>
  </div>
</template>

<script>

export default {
  name: 'App'
  }
</script>

<style >
#app{
  margin-top: 0px;
}
</style>
