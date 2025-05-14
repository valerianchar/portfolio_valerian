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
                <div class="md:col-span-2 flex flex-col justify-center gap-4 p-6">
                    <h1 class="text-3xl font-bold text-white">Valérian Charrier</h1>
                    <h2 class="text-xl font-semibold text-gray-300">Développeur Web Full Stack</h2>
                    <p class="text-gray-400">
                        Actuellement en Master à Ynov Lyon, je conçois des applications modernes avec Laravel, Vue.js et Docker.
                        Passionné par l’univers du développement web, je cherche à rejoindre une équipe dynamique dès septembre 2025.
                    </p>
                    <div class="flex gap-3 mt-4">
                        <a download href="/CV/CV_Valerian_charrier.pdf" class="px-4 py-2 rounded-xl bg-white text-black font-medium hover:bg-gray-200 transition">📄 Télécharger mon CV</a>
                        <a href="https://github.com/valerianchar" class="px-4 py-2 rounded-xl border border-white text-white hover:bg-white hover:text-black transition">💻 Voir mes projets</a>
                    </div>
                </div>

                <!-- Bloc image ou illustration -->
                <div class="flex items-center justify-center">
                    <!-- Tu peux remplacer l'image ci-dessous -->
                    <img src="@/assets/images/moi.jpg" alt="Photo de Valérian" class="rounded-full w-full object-cover" />
                </div>
            </div>

            <!-- Placeholder pour le reste (tu peux ensuite intégrer une section Projets ici) -->
            <div class="relative min-h-[60vh] flex-1 rounded-xl border border-sidebar-border/70 dark:border-sidebar-border md:min-h-min p-6">
                <!-- Placeholder pour le reste (tu peux ensuite intégrer une section Projets ici) -->
                <!-- Projets complets (organisation) -->
                <h2 class="text-2xl font-semibold text-white mb-4">Projets complets</h2>
                <p class="text-gray-400">Retrouvez ici mon organisation VTTRACING-Solutions. (en cours de développement)</p>
                <div class="grid gap-4 md:grid-cols-2">
                    <div
                        v-for="repo in orgRepos"
                        :key="repo.id"
                        class="border border-yellow-500/40 rounded-lg p-4 hover:bg-yellow-100/10 transition"
                    >
                        <h3 class="text-yellow-400 font-semibold">{{ repo.name }}</h3>
                        <p class="text-gray-400 text-sm">{{ repo.description }}</p>
                        <a :href="repo.html_url" target="_blank" class="text-yellow-300 text-sm hover:underline">Voir sur GitHub</a>
                    </div>
                </div>
            </div>
            <!-- Placeholder pour le reste (tu peux ensuite intégrer une section Projets ici) -->
            <div class="relative min-h-[60vh] flex-1 rounded-xl border border-sidebar-border/70 dark:border-sidebar-border md:min-h-min p-6">
                <h2 id="projets" class="text-2xl font-semibold text-white mb-4">Mes Projets</h2>
                <p class="text-gray-400">Retrouvez ici une sélection de projets personnels et professionnels réalisés pendant mes cours.</p>
                <div class="grid gap-4 md:grid-cols-2">
                    <div
                        v-for="repo in repositories"
                        :key="repo.id"
                        class="border border-white/20 rounded-lg p-4 hover:bg-white/5 transition"
                    >
                        <h3 class="text-white font-semibold">{{ repo.name }}</h3>
                        <p class="text-gray-400 text-sm">{{ repo.description }}</p>
                        <a :href="repo.html_url" target="_blank" class="text-blue-400 text-sm hover:underline">Voir sur GitHub</a>
                    </div>
                </div>>
            </div>



        </div>
    </AppLayout>
</template>
