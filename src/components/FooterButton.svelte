<script lang="ts">
  export let svg: string | undefined;
  export let icon: string | undefined;
  export let url: string;
  export let w: string;
  export let h: string;
  export let p: string;
</script>

<a href={url} class="inline-flex items-center align-middle">
    <button
        class={`flex gap-2 items-center w-16 h-16 dark:text-gray-50 text-gray-700 cursor-pointer`}
    >
        {#if svg}
            <!-- Render the SVG file as an <img> tag -->
            <img src={svg} alt="Footer Icon" class={`w-${w} h-${h} p-${p}`} />
        {:else if icon}
            <!-- Render the icon as an <svg> element -->
            <svg
                fill="#ffffff"
                class="w-5 h-5 fill-current"
                viewBox={`0 0 ${w} ${h}`}
                xmlns="http://www.w3.org/2000/svg"
            >
                <path d={icon} />
            </svg>
        {/if}
    </button>
</a>
