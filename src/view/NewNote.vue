<template>
  <div class="fullpage">
    <yd-navbar title="新建备忘">
      <a slot="left">
        <yd-navbar-back-icon @click.native="back">返回</yd-navbar-back-icon>
      </a>
      <div style="user-select: none;" slot="right"><a @click="save(true)">保存</a>&nbsp;&nbsp;</div>
    </yd-navbar>
    <div class="downpage">
      <div class="newnote">
        <textarea @focus="hasSave=false" v-model="newNote" placeholder=" (*/ω＼*) 还没有东西呢"></textarea>
      </div>
      <yd-cell-group>
        <yd-cell-item arrow>
          <span slot="left">时间：</span>
          <yd-datetime ref="datetime" v-model="datetime" slot="right"></yd-datetime>
        </yd-cell-item>
      </yd-cell-group>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import { dateFtt } from "@/util/time";

export default {
  data() {
    return {
      datetime: "",
      newNote: "",
      hasSave: false,
      noteId: ""
    };
  },
  computed: mapState(["noteTmp"]),
  methods: {
    back() {
      this.$router.go(-1);
      // if (this.newnote.length) {
      //   this.$dialog.confirm({
      //     mes: "您已输入了一些内容，是否需要保存？",
      //     opts: [
      //       {
      //         txt: "取消",
      //         color: false,
      //         callback: () => {
      //           //存储到垃圾桶
      //           this.$router.go(-1);
      //         }
      //       },
      //       {
      //         txt: "确定",
      //         color: true,
      //         callback: () => {
      //           //保存修改
      //           this.$router.go(-1);
      //         }
      //       }
      //     ]
      //   });
      // } else {
      //   this.$router.go(-1);
      // }
    },
    save(toast) {
      if (!window.localStorage.getItem(this.noteId)) {
        var notelist = window.localStorage.getItem("notelist") || "";
        window.localStorage.setItem("notelist", notelist + " " + this.noteId);
      }
      window.localStorage.setItem(
        this.noteId,
        JSON.stringify({
          datetime: this.datetime,
          content: this.newNote
        })
      );
      this.hasSave = true;
      this.saveNoteTmp("");
      toast && this.$dialog.toast({ mes: "已保存", timeout: 1000 });
    },
    ...mapMutations(["saveNoteTmp"])
  },
  created() {
    this.datetime = dateFtt("yyyy-MM-dd hh:mm", new Date());
    this.noteId =
      Date.now().toString() +
      Math.random()
        .toString()
        .slice(-6);
  },
  mounted() {
    var noteTmp = this.noteTmp;
    if (noteTmp.length) {
      this.saveNoteTmp("");
      this.$dialog.confirm({
        mes: "检测到您上次有未保存的内容，是否需要恢复？",
        opts: () => {
          this.newNote = noteTmp;
        }
      });
    }
  },
  beforeRouteLeave(to, from, next) {
    if (this.newNote.length && !this.hasSave) {
      this.saveNoteTmp(this.newNote);
      var answer = window.confirm("您已输入了一些内容，是否需要保存？");
      if (answer) {
        this.save();
      }
    }
    next();
  }
};
</script>

<style lang="scss" scoped>
.newnote {
  border-bottom: 1px solid #ddd;
  padding: 0.24rem 0.2rem;
  > textarea {
    border: none;
    width: 100%;
    display: block;
    height: 4rem;
    font-size: 0.3rem;
    color: #525252;
    background-color: transparent;
  }
}
</style>
