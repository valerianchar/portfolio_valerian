<script setup lang="ts">
import AppLayout from '@/layouts/app/AppSidebarLayout.vue';
import type { BreadcrumbItemType, NavItem } from '@/types';
import { FileUser, LayoutGrid } from 'lucide-vue-next';

interface Props {
    breadcrumbs?: BreadcrumbItemType[];
}

withDefaults(defineProps<Props>(), {
    breadcrumbs: () => [],
});

const mainNavItems: NavItem[] = [
    {
        title: 'Accueil',
        href: '/',
        icon: LayoutGrid,
    },
    {
        title: 'CV',
        href: '/curriculum-vitae',
        icon: FileUser,
    },
];
</script>

<template>
    <AppLayout :breadcrumbs="breadcrumbs" :mainNavItems="mainNavItems">
        <slot />
    </AppLayout>
</template>
