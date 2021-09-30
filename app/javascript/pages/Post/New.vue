<template>
    <div>
        <h1>Hello world</h1>
        <form @submit.prevent="form.post($routes.posts())">
            <div class="input-group">
                <label for="title">Title</label>
                <input type="text" name="title" id="title" v-model="form.postItem.title">
            </div>
            <div class="input-group">
                <label for="content">Content</label>
                <input type="text" name="content" id="content" v-model="form.postItem.body">
            </div>
            <div class="input-group">
                <input type="file" multiple @input="form.postItem.images.push($event.target.files[0])" />
            </div>
            <div class="input-group">
                <label for="skills">Skills</label>
                <multiselect
                    id="products"
                    v-model="form.postItem.skill_list"
                    placeholder="Search skill"
                    label="name"
                    :multiple="true"
                    :allow-empty="false"
                    :max="3"
                    :options="options.map((option) => option.name)"
                    :custom-label="
                        (opt) =>
                        options.find((x) => x.name === opt).name
                    "
                    :taggable="true"
                    @tag="addTag"
                ></multiselect>
            </div>
            <div class="input-group">
                <button type="submit">Submit</button>
            </div>
        </form>
    </div>
</template>
<script>
import Multiselect from 'vue-multiselect'

export default {
    components: {
        Multiselect,
    },
    data () {
        return {
            options: [],
            form: this.$inertia.form({
                postItem: {
                    ...this.post,
                    images: []
                }
            })
        }
    },
    props: {
        skills: Array,
        post: Object,
    },
    methods: {
        addTag(newTag) {
            const tag = {
                name: newTag,
            }
            this.options.push(tag)
            this.post.skill_list.push(newTag)
        }
    },
    mounted () {
        this.options = this.skills
    }
}
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>

<style>
.multiselect__content-wrapper {
  background-color: #f3f4f6;
}
.multiselect__tags {
  background-color: #f3f4f6;
  border: none;
}
.multiselect__input {
  background-color: #f3f4f6;
  border: none;
}
</style>
