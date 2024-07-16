import 'package:app_p_81/core/models/category_type/category_type.dart';
import 'package:app_p_81/core/models/subscription/subscription.dart';
import 'package:app_p_81/core/models/subscription_type/subscription_type.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/core/utils/extensions.dart';
import 'package:app_p_81/core/utils/input_formatters.dart';
import 'package:app_p_81/core/utils/subscription_utils.dart';
import 'package:app_p_81/presentation/calendar_page/widgets/calendar_widget.dart';
import 'package:app_p_81/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_p_81/core/app_export.dart';
import 'package:app_p_81/theme/custom_button_style.dart';
import 'package:app_p_81/widgets/custom_elevated_button.dart';
import 'package:app_p_81/widgets/custom_switch.dart';
import 'package:app_p_81/widgets/custom_text_form_field.dart';
import 'package:app_p_81/widgets/category_item_widget.dart';

class SubscriptionDetailsPage extends StatefulWidget {
  final SubscriptionModel? subscription;

  SubscriptionDetailsPage({
    Key? key,
    this.subscription,
  }) : super(key: key);

  @override
  State<SubscriptionDetailsPage> createState() =>
      _SubscriptionDetailsPageState();
}

class _SubscriptionDetailsPageState extends State<SubscriptionDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _amountController;
  late final TextEditingController _dateController;

  CategoryType? _category;
  SubscriptionType _type = SubscriptionType.monthly;
  DateTime _startDate = DateTime.now();
  bool _isReminderSet = false;

  late AppLocalizations _localizations;

  @override
  void initState() {
    super.initState();
    if (widget.subscription != null) {
      _type = widget.subscription!.type;
      _startDate = widget.subscription!.startDate;
      _isReminderSet = widget.subscription!.isReminderSet;
    }
    _nameController = TextEditingController(
      text: widget.subscription?.name,
    );
    _amountController = TextEditingController(
      text: widget.subscription?.amount.format,
    );
    _dateController = TextEditingController(
      text: _startDate.format,
    );
    _category = widget.subscription?.category;
  }

  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTitle(
        text: _localizations.newSubscription,
        implyLeading: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 12.v,
              horizontal: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._buildCategoryType(),
                SizedBox(height: 10.v),
                Text(
                  _localizations.subscriptionName,
                  style: CustomTextStyles.titleMediumPrimary_1,
                ),
                SizedBox(height: 10.v),
                CustomTextFormField(
                  controller: _nameController,
                  hintText: _localizations.subscriptionName,
                  onChanged: (_) => setState(() {}),
                ),
                SizedBox(height: 10.v),
                ..._buildSubscriptionType(),
                SizedBox(height: 10.v),
                CustomTextFormField(
                  controller: _amountController,
                  hintText: "\$0",
                  suffix: Text(
                    _type.name,
                    style: CustomTextStyles.titleMediumPrimary,
                  ),
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsFormatter(),
                  ],
                  onChanged: (_) => setState(() {}),
                ),
                SizedBox(height: 10.v),
                ..._buildStartDate(),
                SizedBox(height: 6.v),
                CalendarWidget(
                  selectedDate: _startDate,
                  onSelectDate: (date) {
                    setState(
                      () {
                        _startDate = date;
                        _dateController.text = _startDate.format;
                      },
                    );
                  },
                ),
                SizedBox(height: 10.v),
                _buildReminderSwitcher(),
                SizedBox(height: 36.v),
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCategoryType() {
    final categories =
        CategoryType.values.where((e) => e != CategoryType.all).toList();

    return [
      Text(
        _localizations.category,
        style: CustomTextStyles.titleMediumPrimary_1,
      ),
      SizedBox(height: 10.v),
      Wrap(
        runSpacing: 8.v,
        spacing: 8.h,
        children: List<Widget>.generate(
          categories.length,
          (index) {
            final category = categories[index];
            return CategoryItemWidget(
              category: category,
              isSelected: _category == category,
              onSelected: () => setState(() => _category = category),
            );
          },
        ),
      ),
    ];
  }

  List<Widget> _buildSubscriptionType() {
    return [
      Text(
        _localizations.regularPayment,
        style: CustomTextStyles.titleMediumPrimary_1,
      ),
      SizedBox(height: 10.v),
      Row(
        children: List.generate(
          SubscriptionType.values.length,
          (index) {
            final type = SubscriptionType.values[index];
            return Expanded(
              child: RadioListTile<SubscriptionType>(
                value: type,
                groupValue: _type,
                onChanged: (value) => setState(() => _type = type),
                title: Text(
                  type.description,
                  style: CustomTextStyles.titleMediumPrimary_1,
                ),
                contentPadding: EdgeInsets.zero,
                fillColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    return (_type == type)
                        ? appTheme.greenA700
                        : appTheme.blueGray400;
                  },
                ),
              ),
            );
          },
        ),
      ),
    ];
  }

  List<Widget> _buildStartDate() {
    return [
      SizedBox(height: 10.v),
      Text(
        _localizations.dateOfPayment,
        style: CustomTextStyles.titleMediumPrimary_1,
      ),
      SizedBox(height: 10.v),
      CustomTextFormField(
        controller: _dateController,
        textInputAction: TextInputAction.done,
        suffix: Container(
          padding: EdgeInsets.only(right: 8.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconsToday24px,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        enabled: false,
        textAlign: TextAlign.center,
      ),
    ];
  }

  Widget _buildReminderSwitcher() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          _localizations.paymentReminder,
          style: CustomTextStyles.titleMediumPrimary_1,
        ),
        CustomSwitch(
          value: _isReminderSet,
          onChange: (value) => setState(
            () => _isReminderSet = value,
          ),
        )
      ],
    );
  }

  Widget _buildSaveButton() {
    return CustomElevatedButton(
      text: _localizations.save,
      buttonStyle: isSaveButtonEnabled
          ? CustomButtonStyles.fillLightBlueA
          : CustomButtonStyles.fillOnPrimaryContainer,
      onPressed: isSaveButtonEnabled ? onSave : null,
    );
  }

  bool get isSaveButtonEnabled {
    return _category != null &&
        _nameController.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _subscription != widget.subscription;
  }

  SubscriptionModel get _subscription {
    return SubscriptionModel(
      id: widget.subscription?.id ?? MainRepository.uuid,
      name: _nameController.text,
      amount: _amountController.text.numberFormat,
      type: _type,
      startDate: _startDate.dateOnly,
      category: _category!,
      isReminderSet: _isReminderSet,
    );
  }

  void onSave() {
    MainRepository.saveSubscription(_subscription);
    Navigator.pop(context);
  }
}
