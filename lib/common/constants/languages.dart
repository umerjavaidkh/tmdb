import '../../domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'es', value: 'Spanish'),
    LanguageEntity(code: 'ur', value: 'Urdu'),
  ];
}
