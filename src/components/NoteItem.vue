<template>
  <div class="note-item" @click="nav">
    {{ noteData }}
  </div>
</template>

<script>
export default {
  props: ["noteData", "noteId"],
  methods: {
    nav() {
      this.$router.push("/check/" + this.noteId);
    }
  }
};
</script>

<style scoped>
.note-item {
  height: calc(0.98rem + 1px);
  padding: 0.24rem;
  font-size: 0.3rem;
  line-height: 0.5rem;
  border-bottom: 1px solid #ddd;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>
