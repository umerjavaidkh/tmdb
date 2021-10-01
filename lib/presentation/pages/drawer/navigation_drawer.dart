import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/theme/theme_cubit.dart';
import '../../themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

import '../../../common/constants/languages.dart';
import '../../../common/constants/route_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';
import '../../blocs/language/language_cubit.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/logo.dart';
import 'navigation_expanded_list_item.dart';
import 'navigation_list_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: Sizes.dimen_200.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w,
              ),
              child: Logo(
                height: Sizes.dimen_20.h,
              ),
            ),

            NavigationExpandedListItem(
              title: TranslationConstants.language.t(context),
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) => _onLanguageSelected(index, context),
            ),

            Row(
              children: [

                SizedBox(width: 15,),

                Text(
                  TranslationConstants.themeText.t(context),
                  style: Theme.of(context).textTheme.subtitle1,
                ),

                BlocBuilder<ThemeCubit, Themes>(builder: (context, theme) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                      icon: Icon(
                        theme == Themes.dark
                            ? Icons.brightness_4_sharp
                            : Icons.brightness_7_sharp,
                        color: context.read<ThemeCubit>().state == Themes.dark
                            ? Colors.white
                            : AppColor.vulcan,
                        size: Sizes.dimen_40.w,
                      ),
                    ),
                  );
                }),

              ],
            )

          ],
        ),
      ),
    );
  }

  void _onLanguageSelected(int index, BuildContext context) {
    BlocProvider.of<LanguageCubit>(context).toggleLanguage(
      Languages.languages[index],
    );
  }


}
