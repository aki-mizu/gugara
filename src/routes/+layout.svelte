<script lang="ts">
    import "../app.css";
    import Header from "../components/Header.svelte";
    import Footer from "../components/Footer.svelte";
    import { setupI18n } from "../services/i18n";
    import { Toaster } from "svelte-french-toast";
    import { onMount } from "svelte";

    let i18nReady = false;

    // Ensure setupI18n completes before rendering
    onMount(async () => {
        await setupI18n({ withLocale: "en" });
        i18nReady = true;
    });
</script>

{#if i18nReady}
    <div
        class="container relative mx-auto flex min-h-screen w-full max-w-[1800px] flex-col text-sm sm:text-base"
    >
        <Toaster />
        <Header />
        <slot />
        <Footer />
    </div>
{/if}
