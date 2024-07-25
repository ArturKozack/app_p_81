import 'package:app_p_81/core/utils/settings_utils.dart';
import 'package:app_p_81/core/utils/size_utils.dart';
import 'package:app_p_81/theme/theme_helper.dart';
import 'package:app_p_81/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final SettingsItemType type;

  const InfoPage(
    this.type, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarTitle(
          text: type.title,
          implyLeading: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 18.v,
          ),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Text(
   '''
MyCredo Subs ("we", "us", or "our") is committed to safeguarding your privacy. This Privacy Policy explains how we collect, use, and protect your information when you use our mobile application (the "App"). By accessing or using the App, you agree to the terms outlined in this policy.

 2. Information We Collect

 a. Device ID

We may collect your device ID to enhance our services, including for marketing, advertising, and analytics purposes.

 3. How We Use Your Information

We may use the information we collect from you in the following ways:

- To customize and enhance your experience by providing content and product offerings tailored to your interests.
- To improve our App based on user feedback and usage data.
- To administer promotions, surveys, or other App features.
- To send you information and updates pertaining to your account or other services.

 4. Information Sharing and Disclosure

We do not sell, trade, or otherwise transfer your Personally Identifiable Information to outside parties without providing you with prior notice. This does not include trusted third parties who assist us in operating our App, conducting our business, or serving our users, as long as those parties agree to keep this information confidential. We may also release your information when required to comply with the law, enforce our App policies, or protect ours or others' rights, property, or safety.

 5. Data Security

We employ a range of security measures to ensure the protection of your personal information. Your data is stored on secure servers and is only accessible by authorized personnel who are required to maintain its confidentiality. We also use secure methods to process and transmit your information.

 6. Third-Party Services

We may employ third-party companies and individuals to facilitate our App, provide the service on our behalf, perform App-related services, or assist us in analyzing how our App is used. These third parties have access to your personal information only to perform these tasks and are obligated not to disclose or use it for any other purpose.

 7. Advertising and Analytics

We may partner with third-party advertising networks and analytics providers to display advertisements in our App and to understand user behavior better. These partners may collect information about your use of the App over time and across different services.

 8. Children's Privacy

Our App is not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13. If we discover that we have inadvertently gathered personal data from a child under 13, we will promptly delete such information.

 9. Changes to This Privacy Policy

We may update our Privacy Policy periodically. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy regularly for any changes. Continued use of the App after the changes are made constitutes acceptance of the updated policy.

 10. Your Consent

By using our App, you consent to our Privacy Policy.

 11. Contact Us

If you have any questions or concerns regarding this Privacy Policy, please contact us at:

**Email: info@mycredapp.co**

 12. Governing Law

This Privacy Policy is governed by the laws of [Your Country/State], without regard to its conflict of law principles.

 13. Data Retention

We will retain your information for as long as your account is active or as needed to provide you services. We will also retain and use your information as necessary to comply with legal obligations, resolve disputes, and enforce our agreements.

 14. Your Rights

Depending on your jurisdiction, you may have certain rights with respect to your personal information, such as the right to access, correct, update, or request the deletion of your data. To exercise these rights, please contact us at [Your Contact Email].

 15. International Transfers

Your information, including personal data, may be transferred to and maintained on computers located outside of your state, province, country, or other governmental jurisdiction where the data protection laws may differ. By providing your information, you consent to such transfers.

Thank you for using MyCredo Subs!
''',
          style: theme.textTheme.titleMedium!.copyWith(
            height: 1.25,
          ),
        ),
      ),
    );
  }
}
