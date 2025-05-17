<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head } from '@inertiajs/vue3';
import { onMounted, ref } from 'vue';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Accueil',
        href: '/',
    },
];

const repositories = ref([]);
const orgRepos = ref([]);

onMounted(async () => {
    try {
        const res = await fetch('https://api.github.com/users/valerianchar/repos');
        const data = await res.json();
        repositories.value = data.sort((a, b) => new Date(b.updated_at).getTime() - new Date(a.updated_at).getTime());

        const resOrg = await fetch('https://api.github.com/orgs/VTTRACING-Solutions/repos');
        const orgData = await resOrg.json();
        orgRepos.value = orgData.sort((a, b) => new Date(b.updated_at).getTime() - new Date(a.updated_at).getTime());
        console.log(orgRepos.value);
    } catch (err) {
        console.error('Erreur de récupération GitHub:', err);
    }
});
</script>

<template>
    <Head title="Portfolio" />
    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex h-full flex-1 flex-col gap-4 rounded-xl p-4">
            <!-- Section de bienvenue -->
            <div class="grid auto-rows-min gap-4 md:grid-cols-3">
                <!-- Bloc texte -->
                <div class="flex flex-col justify-center gap-4 p-6 md:col-span-2">
                    <h1 class="text-3xl font-bold text-white">Valérian Charrier</h1>
                    <h2 class="text-xl font-semibold text-gray-300">Développeur Web Full Stack</h2>
                    <p class="text-gray-400">
                        Actuellement en Master à Ynov Lyon, je conçois des applications modernes avec Laravel, Vue.js et Docker. Passionné par
                        l’univers du développement web, je cherche à rejoindre une équipe dynamique dès septembre 2025.
                    </p>
                    <div class="mt-4 flex gap-3">
                        <a
                            download
                            href="/CV/CV_Valerian_charrier.pdf"
                            class="rounded-xl bg-white px-4 py-2 font-medium text-black transition hover:bg-gray-200"
                            >📄 Télécharger mon CV</a
                        >
                        <a
                            href="https://github.com/valerianchar"
                            class="rounded-xl border border-white px-4 py-2 text-white transition hover:bg-white hover:text-black"
                            >💻 Voir mes projets</a
                        >
                    </div>
                </div>

                <!-- Bloc image ou illustration -->
                <div class="flex items-center justify-center">
                    <!-- Tu peux remplacer l'image ci-dessous -->
                    <img src="/assets/images/moi.jpg" alt="Photo de Valérian" class="w-full rounded-full object-cover" />
                </div>
            </div>

            <!-- Placeholder pour le reste (tu peux ensuite intégrer une section Projets ici) -->
            <div class="border-sidebar-border/70 dark:border-sidebar-border relative min-h-[60vh] flex-1 rounded-xl border p-6 md:min-h-min">
                <!-- Placeholder pour le reste (tu peux ensuite intégrer une section Projets ici) -->
                <!-- Projets complets (organisation) -->
                <h2 class="mb-4 text-2xl font-semibold text-white">Projets complets</h2>
                <p class="text-gray-400">Retrouvez ici mon organisation VTTRACING-Solutions. (en cours de développement)</p>
                <div class="grid gap-4 md:grid-cols-2">
                    <div v-for="repo in orgRepos" :key="repo.id" class="rounded-lg border border-yellow-500/40 p-4 transition hover:bg-yellow-100/10">
                        <h3 class="font-semibold text-yellow-400">{{ repo.name }}</h3>
                        <p class="text-sm text-gray-400">{{ repo.description }}</p>
                        <a :href="repo.html_url" target="_blank" class="text-sm text-yellow-300 hover:underline">Voir sur GitHub</a>
                    </div>
                </div>
            </div>
            <!-- Placeholder pour le reste (tu peux ensuite intégrer une section Projets ici) -->
            <div class="border-sidebar-border/70 dark:border-sidebar-border relative min-h-[60vh] flex-1 rounded-xl border p-6 md:min-h-min">
                <h2 id="projets" class="mb-4 text-2xl font-semibold text-white">Mes Projets</h2>
                <p class="text-gray-400">Retrouvez ici une sélection de projets personnels et professionnels réalisés pendant mes cours.</p>
                <div class="grid gap-4 md:grid-cols-2">
                    <div v-for="repo in repositories" :key="repo.id" class="rounded-lg border border-white/20 p-4 transition hover:bg-white/5">
                        <h3 class="font-semibold text-white">{{ repo.name }}</h3>
                        <p class="text-sm text-gray-400">{{ repo.description }}</p>
                        <a :href="repo.html_url" target="_blank" class="text-sm text-blue-400 hover:underline">Voir sur GitHub</a>
                    </div>
                </div>
                >
            </div>
        </div>
    </AppLayout>
</template>
