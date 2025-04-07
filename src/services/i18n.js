import { dictionary, locale, _, waitLocale, init } from "svelte-i18n";
import en from "./locales/en/common.json";
import es from "./locales/es/common.json";
import eu from "./locales/eu/common.json";

async function setupI18n({ withLocale: _locale } = { withLocale: "en" }) {
  // Initialize svelte-i18n with a fallback locale
  init({
    fallbackLocale: "en", // Set your fallback locale here
  });

  // Set the dictionary with available translations
  dictionary.set({
    en: en,
    es: es,
    eu: eu,
  });

  // Set the initial locale
  locale.set(_locale);

  // Wait for the locale to be ready
  await waitLocale();
}

export { _, setupI18n };
