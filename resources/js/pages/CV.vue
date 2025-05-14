<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head } from '@inertiajs/vue3';
import { Phone, Mail, MapPin, Dot, Diamond, Linkedin, Github } from 'lucide-vue-next';
import { ref } from 'vue';

const copiedEmail = ref(false);
const copiedPhone = ref(false);
const copiedAddress = ref(false);

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'CV',
        href: '/cursus-vitae',
    },
];

const competences: string[] = [
    'Mysql - 3 ans',
    'Vue.js - 2 ans',
    'Git - 5 ans',
    'Docker - 2 ans',
    'PostgreSQL - 2 ans',
    'C# - 5 ans',
    'Laravel - 1 an',
    'HTML - 5 ans',
    'TailwindCSS - 2 ans'
];
const qualites: string[] = [
    'Créativité',
    'Capacité d\'adaptation',
    'Excellentes compétences',
    'relationnelles',
    'Esprit d\'équipe',
    'Motivé'
];
const stacksProject: string[] = [
    'Rédaction du cahier des charges',
    'Suivi Agile (Kanban)',
    'Développement front et back',
    'Mise en place d’un pipeline CI/CD avec Docker',
    'Mise en production sur un VPS (Ubuntu)'
];


const reseaux = [
    {
        name: 'LinkedIn',
        url: 'https://www.linkedin.com/in/valerian-charrier-3b677b1b2/',
        icon: Linkedin,
    },
    {
        name: 'GitHub',
        url: 'https://github.com/valerianchar',
        icon: Github,
    }
];


const onEmailClick = async () => {
    try {
        await navigator.clipboard.writeText('valerian.charrier@gmail.com');
        copiedEmail.value = true;
        setTimeout(() => copiedEmail.value = false, 2000);

    } catch (err) {
        console.error("Erreur lors de la copie :", err);
    }
};
const onPhoneClick = async () => {
    try {
        await navigator.clipboard.writeText('0628947120');
        copiedPhone.value = true;
        setTimeout(() => copiedPhone.value = false, 2000);

    } catch (err) {
        console.error("Erreur lors de la copie :", err);
    }
};
const onAddressClick = async () => {
    try {
        await navigator.clipboard.writeText('1 Rue Père Louis de Galard, 69009 Lyon');
        copiedAddress.value = true;
        setTimeout(() => copiedAddress.value = false, 2000);

    } catch (err) {
        console.error("Erreur lors de la copie :", err);
    }
};
</script>

<template>
    <Head title="Portfolio" />
    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex h-full flex-1 flex-col gap-4 rounded-xl p-4">
            <div class="grid gap-4 md:grid-cols-3">
                <div class="dark:border-sidebar-border relative justify-items-center overflow-hidden md:col-span-1">
                    <img src="@/assets/images/moi.jpg" alt="VC" class="h-60 w-60 rounded-full object-cover" />
                </div>
                <div class="border-sidebar-border/70 dark:border-sidebar-border justify-center overflow-hidden rounded-xl border p-4 md:col-span-2">
                    <div class="text-2xl italic">VALÉRIAN CHARRIER</div>
                    <div class="text-3xl font-bold">DÉVELOPPEUR WEB FULL STACK</div>
                    Jeune diplômé en informatique, actuellement en Master à Ynov Lyon, je suis passionné par le développement full stack. Fort de
                    plusieurs expériences, notamment chez Optimis où j’ai contribué à des projets web et mobiles en C#, Laravel et Vue.js, je suis à
                    la recherche d’une opportunité dès septembre pour intégrer une équipe dynamique et continuer à progresser dans des environnements
                    techniques stimulants.
                </div>
            </div>
            <div class="flex gap-4">
                <div
                    class="relative border-sidebar-border/70 flex-wrap dark:border-sidebar-border flex flex-col gap-8 overflow-hidden rounded-xl border p-4"
                >
                    <div class="flex flex-col  gap-4">
                        <div class="text-2xl font-bold">Contact</div>
                        <div class="flex flex-col gap-4">

                            <div class="relative">
                                <span v-if="copiedPhone" class="ml-10 absolute -top-4  text-green-400 text-xs">copied</span>
                                <div class="flex gap-2 items-center hover:text-blue-500 cursor-pointer text-nowrap" @click="onPhoneClick()">
                                    <Phone />
                                    <div class="h-6 w-0.5 bg-white" />
                                    <p>06-28-94-71-20</p>
                                </div>
                            </div>

                            <div class="relative">
                                <span v-if="copiedEmail" class="ml-10 absolute -top-4  text-green-400 text-xs">copied</span>
                                <div class="flex gap-2 items-center hover:text-blue-500 cursor-pointer text-nowrap" @click="onEmailClick()">
                                    <Mail/>
                                    <div class="h-6 w-0.5 bg-white" />
                                    <p class="text-sm">
                                        valerian.charrier@gmail.com
                                    </p>
                                </div>
                            </div>

                            <div class="relative">
                                <span v-if="copiedAddress" class="ml-10 absolute -top-4 text-green-400 text-xs">copied</span>
                                <div class="flex gap-2 items-center hover:text-blue-500 cursor-pointer text-nowrap" @click="onAddressClick()">
                                    <MapPin />
                                    <div class="h-6 w-0.5 bg-white" />
                                    <div>
                                        <p>1 Rue père louis de galard</p>
                                        <p>69009, LYON</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="flex flex-col gap-4">
                        <div class="text-2xl font-bold">Compétences</div>
                        <div class="flex flex-col gap-2" v-for="(competence, index) in competences" :key="index">
                            <div class="flex gap-2">
                                <Dot/>
                                {{competence}}
                            </div>
                        </div>
                    </div>
                    <div class="flex flex-col gap-4">
                        <div class="text-2xl font-bold">Qualités</div>
                        <div class="flex flex-col gap-2" v-for="(qualite, index) in qualites" :key="index">
                            <div class="flex gap-2">
                                <Dot/>
                                {{qualite}}
                            </div>
                        </div>
                    </div>
                    <div class="flex flex-col gap-4">
                        <div class="text-2xl font-bold">Réseaux</div>
                        <div class="flex flex-col gap-2">
                            <a
                                v-for="reseau in reseaux"
                                :key="reseau.name"
                                :href="reseau.url"
                                target="_blank"
                                class="text-blue-400 ml-4 hover:underline flex items-center gap-2"
                            >
                                <component :is="reseau.icon" class="w-4 h-4" />
                                {{ reseau.name }}
                            </a>
                        </div>
                    </div>
                </div>
                <div
                    class="relative flex-1 border-sidebar-border/70 dark:border-sidebar-border justify-center overflow-hidden rounded-xl border p-4"
                >
                    <div class="flex flex-col gap-6">
                        <div class="flex gap-4">
                            <div class="pt-13 pb-2 flex flex-col justify-center items-center">
                                <div class="w-0.5 bg-white h-full"/>
                                <Diamond class="w-4 h-4"/>
                            </div>
                            <div class="flex flex-col gap-4">
                                <div class="text-xl font-bold">
                                    EXPÉRIENCE PROFESSIONNELLE
                                </div>
                                <div class="flex flex-col gap-3">
                                    <div  class="flex flex-col gap-1">
                                        <div class="font-bold">
                                            Développeur Full Stack
                                        </div>
                                        <div>
                                            <div class="italic">Optimis - Lyon (69) | Sept. 2022 - Aujourd'hui </div>
                                            <div>
                                                Lors de ce poste, j’ai réalisé de nombreuses tâches allant du
                                                développement mobile au développement web. Les
                                                technologies que j’ai utilisées sont principalement : C#,
                                                Xamarin dans mes premières années, puis laravel et vuejs par
                                                la suite.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="flex flex-col gap-1">
                                        <div class="font-bold">
                                            Technicien Système et Réseau
                                        </div>
                                        <div>
                                            <div class="italic">AssaAbloy - Dunière (43) | Oct. 2020 - Juil. 2022 </div>
                                            <div>
                                                Lors de ce poste, j’ai effectué de nombreuses tâches réseau
                                                telles que : la gestion de ticketing, l’aide à l’utilisateur, gestion
                                                basique de serveurs virtuels, développement d’application
                                                Windev.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex gap-4">
                            <div class="pt-13 pb-2 flex flex-col justify-center items-center">
                                <div class="w-0.5 bg-white h-full"/>
                                <Diamond class="w-4 h-4"/>
                            </div>
                            <div class="flex flex-col gap-4">
                                <div class="text-xl font-bold">
                                    PROJETS
                                </div>
                                <div class="flex flex-col gap-3">
                                    <div  class="flex flex-col gap-1">
                                        <div class="font-bold">
                                            Projet personnel – Application de partage de spot et de parcours.
                                        </div>
                                        <div>
                                            <div class="italic">2025 – Projet de Master (En cours de développement) </div>
                                            <div>
                                                Développement d’une application full stack (Laravel, Vue.js,
                                                Inertia) en autonomie, incluant :
                                                <div
                                                    class="flex"
                                                    v-for="(stackProject, index) in stacksProject"
                                                    :key="index"
                                                >
                                                    <Dot/>
                                                    {{stackProject}}
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex gap-4">
                            <div class="pt-13 pb-2 flex flex-col justify-center items-center">
                                <div class="w-0.5 bg-white h-full"/>
                                <Diamond class="w-4 h-4"/>
                            </div>
                            <div class="flex flex-col gap-4">
                                <div class="text-xl font-bold">
                                    FORMATIONS
                                </div>
                                <div class="flex flex-col gap-3">
                                    <div  class="flex flex-col gap-1">
                                        <div class="font-bold">
                                            Master en Informatique, Titre RNCP Expert en développement logiciel (RNCP 39583)
                                        </div>
                                        <div class="italic">Ynov | Lyon | 2023-Aujourd’hui</div>
                                    </div>
                                    <div  class="flex flex-col gap-1">
                                        <div class="font-bold">
                                            Licence en Concepteur développeur d’application
                                        </div>
                                        <div class="italic">Doranco | Lyon | 2022-2023</div>
                                    </div>
                                    <div  class="flex flex-col gap-1">
                                        <div class="font-bold">
                                            BTS SIO (Système informatique aux organisation)
                                        </div>
                                        <div class="italic">CFAI LOIRE | Saint-Etienne | 2020-2022</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </AppLayout>
</template>
