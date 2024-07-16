import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/core/utils/settings_utils.dart';
import 'package:app_p_81/presentation/settings_screen/widgets/settings_button.dart';
import 'package:app_p_81/widgets/user_avatar_widget.dart';
import 'package:app_p_81/widgets/app_bar/appbar_title.dart';
import 'package:app_p_81/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:app_p_81/core/app_export.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        appBar: AppbarTitle(
          text: localizations.settings,
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 16.v,
          ),
          child: Column(
            children: [
              _UserInfoWidget(),
              SizedBox(height: 24.v),
              ...List.generate(
                SettingsItemType.values.length,
                (index) => SettingsButton(
                  settingsItem: SettingsItemType.values[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserInfoWidget extends StatefulWidget {
  const _UserInfoWidget();

  @override
  State<_UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<_UserInfoWidget> {
  late final FocusNode focusNode;
  late final TextEditingController nameController;

  late AppLocalizations localizations;

  String suffixIcon = ImageConstant.edit;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    nameController = TextEditingController(
      text: MainRepository.user?.name,
    );
    focusNode.addListener(() {
      setState(() {
        suffixIcon =
            focusNode.hasFocus ? ImageConstant.save : ImageConstant.edit;
      });
    });
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MainRepository.userBox.listenable(),
      builder: (_, box, child) {
        return SizedBox(
          height: 66.adaptSize,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserAvatarWidget(
                isEditable: true,
              ),
              SizedBox(width: 12.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        focusNode: focusNode,
                        controller: nameController,
                        hintText: localizations.username,
                        textInputAction: TextInputAction.done,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                        ),
                        suffix: InkWell(
                          onTap: focusNode.hasFocus
                              ? () {
                                  final name = nameController.text.trim();
                                  MainRepository.updateUserName(name);
                                  focusNode.unfocus();
                                }
                              : null,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.v),
                            child: CustomImageView(
                              imagePath: suffixIcon,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      localizations.totalActiveSubscriptions + "10",
                      style: CustomTextStyles.bodySmallSecondaryContainer,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
