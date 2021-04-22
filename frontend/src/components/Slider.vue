<template>
    <div>
        <carousel
        :per-page="1"
        :mouse-drag="true"
        :autoplay="true"
        :centerMode="true"
        :loop="true"
        :autoplayTimeout="6000"
        paginationPosition="bottom-overlay"
        paginationActiveColor="rgb(15,61,137)"
        >
            <slide>
                <a href="apple.com"><img src ="../assets/main-pic.webp" alt="" width="100%" style="border-radius: 5%"></a>
            </slide>
            <slide>
                <a href="apple.com"><img src ="../assets/main-pic.webp" alt="" width="100%" style="border-radius: 5%"></a>
            </slide>
            <slide>
                <a href="apple.com"><img src ="../assets/main-pic.webp" alt="" width="100%" style="border-radius: 5%"></a>
            </slide>
            <slide>
                <a href="apple.com"><img src ="../assets/main-pic.webp" alt="" width="100%" style="border-radius: 5%"></a>
            </slide>
        </carousel>
    </div>
</template>
<script>
import { Carousel, Slide } from 'vue-carousel'
export default {
  components: {
    Carousel,
    Slide
  }
}
</script>

<style scoped>
.text{
    font-size: 12px;
    color:white;
    line-height:initial;
}
.bottom-left {
  position: absolute;
  bottom: 8px;
  left: 16px;
  color:white;
}

</style>
