<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}"  @class(['dark' => ($appearance ?? 'system') == 'dark'])>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title inertia>Portfolio de Valérian Charrier – Développeur Web</title>
        <meta name="description" content="Découvrez les projets web de Valérian Charrier, développeur full-stack Laravel & Vue.js.">
        <meta name="robots" content="index, follow">

        <!-- Canonical -->
        <link rel="canonical" href="https://portfolio.valeriancharrier.fr/" />

        <!-- Open Graph -->
        <meta property="og:title" content="Portfolio de Valérian Charrier" />
        <meta property="og:description" content="Développeur Web Laravel & Vue.js — Projets, compétences, contact." />
        <meta property="og:url" content="https://portfolio.valeriancharrier.fr/" />
        <meta property="og:type" content="website" />
        <meta property="og:image" content="https://portfolio.valeriancharrier.fr/assets/CV/curriculum-vitae.png" />
        <meta property="og:image:alt" content="Aperçu du portfolio de Valérian Charrier" />

        <!-- Twitter Card -->
{{--        <meta name="twitter:card" content="summary_large_image" />--}}
{{--        <meta name="twitter:title" content="Portfolio de Valérian Charrier" />--}}
{{--        <meta name="twitter:description" content="Développeur Web Full-Stack Laravel & Vue.js — Projets, compétences, contact." />--}}
{{--        <meta name="twitter:image" content="https://portfolio.valeriancharrier.fr/assets/preview.jpg" />--}}

        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=instrument-sans:400,500,600" rel="stylesheet" />

        {{-- Inline script to detect system dark mode preference and apply it immediately --}}
        <script>
            (function() {
                const appearance = '{{ $appearance ?? "system" }}';

                if (appearance === 'system') {
                    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;

                    if (prefersDark) {
                        document.documentElement.classList.add('dark');
                    }
                }
            })();
        </script>

        {{-- Inline style to set the HTML background color based on our theme in app.css --}}
        <style>
            html {
                background-color: oklch(1 0 0);
            }

            html.dark {
                background-color: oklch(0.145 0 0);
            }
        </style>

        <title inertia>{{ config('app.name', 'Portfolio') }}</title>

        <link rel="icon" href="/assets/CV/curriculum-vitae.png" sizes="any">
        <link rel="icon" href="/assets/CV/curriculum-vitae.png" type="image/svg+xml">
        <link rel="apple-touch-icon" href="/apple-touch-icon.png">

        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=instrument-sans:400,500,600" rel="stylesheet" />

        @routes
        @vite(['resources/js/app.ts', "resources/js/pages/{$page['component']}.vue"])
        @inertiaHead
    </head>
    <body class="font-sans antialiased">
        @inertia
    </body>
</html>
