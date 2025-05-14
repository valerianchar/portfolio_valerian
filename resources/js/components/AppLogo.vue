<script setup lang="ts">
import AppLogoIcon from '@/components/AppLogoIcon.vue';
import { BookmarkIcon } from '@heroicons/vue/24/solid'
</script>

<template>
    <div class="flex aspect-square size-8 items-center justify-center rounded-md bg-sidebar-primary text-sidebar-primary-foreground">
        <BookmarkIcon class="size-4.5 fill-current text-white dark:text-black" />
    </div>
    <div class="ml-1 grid flex-1 text-left text-sm">
        <span class="mb-0.5 truncate font-semibold leading-none">Portfolio Valérian</span>
    </div>
</template>
