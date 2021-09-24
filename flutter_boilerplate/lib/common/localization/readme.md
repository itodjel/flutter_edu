# Localization (multiple languages)
Localization in multilingual mobile application is implemented in this module by implementing main Localizer inherited widget to enable accessing translation using specific key for a specific culture or language.
## Localization is implemented from four parts:
- [Translation model](https://github.com/itodjel/flutter_edu/blob/master/flutter_boilerplate/lib/common/localization/models/translation_model.dart) - a class that enforces translation for a specific language to provide translations for every key/property contained in the TranslationModel class
- [Language model](https://github.com/itodjel/flutter_edu/blob/master/flutter_boilerplate/lib/common/localization/models/language_model.dart) - data structure that holds the referent data for every language that we provide the translation in our app 
- [Specific language translation](https://github.com/itodjel/flutter_edu/blob/master/flutter_boilerplate/lib/common/localization/translations/en.dart) - instance of TranslationModel class for a specific language with all of the translations passed through the constructor
- [Localizer](https://github.com/itodjel/flutter_edu/blob/master/flutter_boilerplate/lib/common/localization/localizer.dart) - inherited widget wrapper class that serves as the middle component between UI and specific translation, it holds the current translation and allows us to access specific translation via context.localizer.someKeyThatHoldsTheTranslation

## Configuration
#
```
... 
MaterialApp(
    //This value is currently used from LocalizationBloc, 
    //but this value of the selected language can come from storage, widget's state or anywhere else
    locale: localizationState.locale,
    localeResolutionCallback: Localizer.getSupportedLocale,
    localizationsDelegates: const [
        Localizer.delegate,
        Localizer.fallbackCupertinoLocalisationsDelegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
    ],
...
```

## Usage (In your widgets)
#
```
// Gets the translation for password for current culture
Localizer.of(context).translations.password

// The same thing, only simplified by using extension methods
context.localizer.translations.password

// Even more simplefied
context.translations.password 
```

## Changing current language
The current language is stored in a storage repository and the logic of changing the current language is implemented in [LocalizationBloc](https://github.com/itodjel/flutter_edu/blob/master/flutter_boilerplate/lib/blocs/localization/localization_bloc.dart).
While the application starts the first event is dispatched ([LocalizationInitEvent](https://github.com/itodjel/flutter_edu/blob/master/flutter_boilerplate/lib/blocs/localization/localization_event.dart)) to initialize the last used language in the application so the user would have the experience of seamles continuing using the app. This fetches the last stored locale from the storage repository and yields the initial state with the new language selected.

Usually in the settings part of the app there is an option to select/change the language. This is usually a dropdown of all listed supported languages from our application. By selecting one option a new event is dispatched ([LocalizationChangeEvent](https://github.com/itodjel/flutter_edu/blob/master/flutter_boilerplate/lib/blocs/localization/localization_event.dart)) and the [LocalizationBloc](https://github.com/itodjel/flutter_edu/blob/master/flutter_boilerplate/lib/blocs/localization/localization_bloc.dart) handles the logic of changing the current language, stores the locale and yields the new state.

Changing the language looks something like this:
```
onSelected: (LanguageModel selectedLanguageModel) {
    context.read<LocalizationBloc>().add(LocalizationChangeEvent(locale: selected.locale));
},
```