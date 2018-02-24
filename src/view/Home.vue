<template>
  <div class="fullpage">
    <yd-navbar title="我的备忘录">
      <a slot="left">
        <yd-icon @click.native="test" name="type"></yd-icon>
      </a>
    </yd-navbar>
    <div class="downpage">
      <note-item v-for="noteItem in notelist" :noteData='noteItem.data.content' :noteId="noteItem.noteId" :key="noteItem.noteId"></note-item>
      <div v-if="!notelist.length" class="zero">
        (￣△￣；) 还没有备忘呢，赶快点击小红笔'记下一个吧
      </div>
    </div>
    <div @click="newNote" class="newnote">
      <yd-icon name="compose"></yd-icon>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import NoteItem from "@/components/NoteItem";

export default {
  data() {
    return {
      msg: "Welcome to Your Vue.js App",
      notelist: []
    };
  },
  methods: {
    newNote() {
      this.$router.push("/new");
    },
    test() {
      this.$dialog.toast({
        mes: window.navigator.userAgent,
        timeout: 3000
      });
    }
  },
  components: {
    "note-item": NoteItem
  },
  created() {
    var _this = this;
    var notelist = window.localStorage.getItem("notelist");
    if (notelist !== null) {
      var t = notelist.split(/\s+/);
      var l = t.length;
      for (var i = l - 1; i >= 0; i--) {
        var value = t[i];
        if (value.length) {
          _this.notelist.push({
            noteId: value,
            data: JSON.parse(window.localStorage.getItem(value))
          });
        }
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.newnote {
  position: absolute;
  right: 0.8rem;
  bottom: 1.8rem;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 1rem;
  height: 1rem;
  color: #fff;
  background-color: rgba(218, 21, 64, 0.8);
  border-radius: 50%;
}
.zero {
  box-sizing: border-box;
  display: flex;
  width: 100%;
  height: 100%;
  padding: 0 0.5rem 1rem;
  justify-content: center;
  align-items: center;
  text-align: center;
  font-size: 0.4rem;
  color: #515151;
}
</style>
