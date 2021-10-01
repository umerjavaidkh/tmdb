import 'package:flutter/material.dart';
import 'package:tmdb/common/constants/translation_constants.dart';
import '../../../common/extensions/string_extensions.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key? key,
    required this.height,
  })   : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Text(
       TranslationConstants.appName.t(context),
       style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
       );
  }
}
