import 'package:app_p_81/core/app_export.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final bool isEditable;

  const UserAvatarWidget({
    super.key,
    this.isEditable = false,
  });

  @override
  Widget build(BuildContext context) {
    final user = MainRepository.user;

    return GestureDetector(
      onTap: isEditable ? MainRepository.updateUserAvatar : null,
      child: SizedBox(
        height: 66.adaptSize,
        width: 66.adaptSize,
        child: user?.avatar != null
            ? ClipOval(
                child: Image.memory(
                  user!.avatar!,
                  fit: BoxFit.cover,
                ),
              )
            : CustomIconButton(
                height: 66.adaptSize,
                width: 66.adaptSize,
                decoration: IconButtonStyleHelper.fillOnPrimaryContainer,
                child: CustomImageView(
                  imagePath:
                      isEditable ? ImageConstant.addAvatar : ImageConstant.user,
                ),
              ),
      ),
    );
  }
}
