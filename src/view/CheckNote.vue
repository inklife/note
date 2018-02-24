<template>
  <div class="fullpage">
    <yd-navbar title="查看备忘">
      <a slot="left">
        <yd-navbar-back-icon @click.native="back">返回</yd-navbar-back-icon>
      </a>
      <div style="user-select: none;" slot="right"><a @click="modifyOrSave">{{ isEditting ? '保存' : '编辑' }}</a>&nbsp;&nbsp;</div>
    </yd-navbar>
    <div class="downpage">
      <div class="shownote">
        <textarea id="showNote" v-model="content" :readonly="!isEditting" placeholder=" o(*￣▽￣*)ブ 这里是空的"></textarea>
      </div>
      <yd-cell-group>
        <yd-cell-item arrow>
          <span slot="left">时间：</span>
          <yd-datetime ref="datetime" v-model="datetime" slot="right"></yd-datetime>
        </yd-cell-item>
      </yd-cell-group>
      <yd-button-group>
        <yd-button size="large" @click.native="deleteNote" type="danger">删除备忘</yd-button>
      </yd-button-group>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isEditting: false,
      content: "",
      datetime: ""
    };
  },
  methods: {
    back() {
      this.$router.go(-1);
    },
    modifyOrSave() {
      this.isEditting = !this.isEditting;
      if (this.isEditting) {
        this.setCaretPosition(
          document.getElementById("showNote"),
          this.content.length
        );
      } else {
        window.localStorage.setItem(
          this.noteId,
          JSON.stringify({
            content: this.content,
            datetime: this.datetime
          })
        );
        this.$dialog.toast({ mes: "保存成功", timeout: 1000 });
      }
    },
    deleteNote() {
      this.$dialog.confirm({
        mes: "真的要删除这条备忘吗？",
        opts: () => {
          var notelist = window.localStorage.getItem("notelist");
          if (notelist) {
            window.localStorage.setItem(
              "notelist",
              notelist.replace(" " + this.noteId, "")
            );
          }
          this.$router.go(-1);
        }
      });
    },
    setCaretPosition(tObj, sPos) {
      if (tObj.setSelectionRange) {
        setTimeout(function() {
          tObj.setSelectionRange(sPos, sPos);
          tObj.focus();
        }, 0);
      } else if (tObj.createTextRange) {
        var rng = tObj.createTextRange();
        rng.move("character", sPos);
        rng.select();
      }
    }
  },
  computed: {
    noteId() {
      return this.$route.params.NoteId;
    }
  },
  created() {
    var t = window.localStorage.getItem(this.noteId);
    if (t !== null) {
      try {
        var d = JSON.parse(t);
        this.content = d.content;
        this.datetime = d.datetime;
      } catch (error) {}
    }
  }
};
</script>

<style lang="scss" scoped>
.shownote {
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
