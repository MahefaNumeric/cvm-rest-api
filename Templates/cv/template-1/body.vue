<template>
    <div>
        _body.vue_ <br/>
        {{ cv.address.value }}
    </div>
</template>

<script>
    // It's necessary for vue mecanism
    module.exports = {
        data: () => {},
        props: ['cv']
    }
</script>