<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
export default {
  name: "App",
  methods: mapMutations(["saveNoteTmp"]),
  created() {
    var noteTmp = window.localStorage.getItem("noteTmp");
    if (noteTmp !== null) {
      this.saveNoteTmp(noteTmp);
    }
  }
};
</script>

<style lang="scss">
body {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #fff;
  font-size: 0.3rem;
}

#app {
  height: 100%;
  width: 100%;
}

.fullpage {
  width: 100%;
  height: 100%;
}

.downpage {
  box-sizing: border-box;
  width: 100%;
  height: calc(100% - 1rem);
  overflow-x: hidden;
  overflow-y: auto;
  &::-webkit-scrollbar {
    width: 0;
  }
}

::-webkit-scrollbar {
  width: 0;
}
</style>
