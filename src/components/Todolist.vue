<template>
  <div id="listDiv">
    <h2>Your Todos for Today : {{ dateToday }}</h2>

    <CustomInput
      v-validate="'min:5'"
      name="Input"
      v-model="newTodo"
      v-on:addevent="add"
    ></CustomInput>
    <transition-group
      name="errormsg"
      enter-active-class="animated bounceIn"
      leave-active-class="animated bounceOut"
    >
      <p key="-1" class="alert" v-if="errors.has('Input')">
        {{ errors.first("Input") }}
      </p>
    </transition-group>

    <transition-group name="list" enter-active-class="animated bounceInUp">
      <TodoItem
        v-for="(todo, index) in todos"
        v-on:remove="todos.splice(index, 1)"
        v-on:edit="editTodo(index)"
        :key="index"
        :description="todo"
      ></TodoItem>
    </transition-group>
  </div>
</template>

<script>
import TodoItem from "./Todoitem.vue";
import CustomInput from "./CustomInput.vue";
import axios from "axios";
import Tracker from '@openreplay/tracker';
// import trackerAssist from '@openreplay/tracker-assist';
import trackerAxios from '@openreplay/tracker-axios';

const tracker = new Tracker({
  projectKey: "Cxx6JHUX2mj7nr5UuC0P",  
});
tracker.use(trackerAxios({instance: axios}));

export default {
  name: "TodoList",
  components: {
    TodoItem,
    CustomInput,
  },
  beforeCreate() {
    tracker.start();
    const fakeConfig = {
      method: "post",
      url: "/user/12345",
      baseURL: "/foo",
    };
    console.log(axios.getUri(fakeConfig));
  },
  data() {
    return {
      currentIndex: -1,
      newTodo: "",
      todos: [
        "Go to grocery store",
        "complete homework",
        "Visit Dentist",
        "Documentation",
        "Content consumption",
        "Implementation",
      ],
      dateToday: new Date().toLocaleDateString(),
    };
  },
  methods: {
    add() {
      this.$validator.validateAll().then((result) => {
        if (result) {
          if (this.currentIndex === -1) {
            var todo = this.newTodo;
            this.todos.push(todo);
            this.newTodo = "";
          } else {
            this.todos[this.currentIndex] = this.newTodo;
            this.newTodo = "";
            this.currentIndex = -1;
          }
        } else {
          console.log("Not valid");
        }
      });
    },
    editTodo(index) {
      this.newTodo = this.todos[index];
      this.currentIndex = index;
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#listDiv {
  margin-top: 0px;
}
.alert {
  width: 380px;
  height: 20px;
  background: #fdf2ce;
  margin-left: 510px;
  font-size: 15px;
  color: black;
  border-radius: 3px;
  font-weight: bold;
  padding: 5px;
  margin-top: -20px;
}
</style>
