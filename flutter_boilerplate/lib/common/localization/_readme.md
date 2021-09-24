### Localization (Multiple languages)
Localization in multilingual mobile application is implemented in this module by implementing main Localizer inherited widget to enable accessing translation using specific key for a specific culture or language.
Localization is implemented from four parts:
- Translation model - a class that enforces translation for a specific language to provide translations for every key/property contained in the TranslationModel class
- Language model - data structure that holds the referent data for every language that we provide the translation in out app 
- Specific language translation - instance of TranslationModel class for a specific language with all of the translations passed thrugh the constructor
- Localizer - inherited widget wrapper class that serves as the middle component between UI and specific translation, it holds the current translation and allows us to access specific translation via context.localizer.someKeyThatHoldsTheTranslation