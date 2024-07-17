import 'package:app_p_81/core/models/category_type/category_type.dart';
import 'package:app_p_81/core/models/payments/payments.dart';
import 'package:app_p_81/core/repositories/main_repository.dart';
import 'package:app_p_81/presentation/calendar_page/widgets/calendar_widget.dart';
import 'package:app_p_81/presentation/calendar_page/widgets/payment_list_view.dart';
import 'package:app_p_81/presentation/subscriptions_page/widgets/category_filter_panel.dart';
import 'package:app_p_81/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_p_81/core/app_export.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  late AppLocalizations _localizations;

  CategoryType _selectedCategory = CategoryType.all;
  DateTime _selectedDate = DateTime.now();

  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarTitle(
          text: _localizations.calendar,
        ),
        body: Column(
          children: [
            CategoryFilterPanel(
              selectedCategory: _selectedCategory,
              onSelected: (category) =>
                  setState(() => _selectedCategory = category),
            ),
            SizedBox(height: 8.v),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: CalendarWidget(
                  selectedDate: _selectedDate,
                  onSelectDate: (date) => setState(() => _selectedDate = date),
                ),
              ),
            ),
            SizedBox(height: 20.v),
            Expanded(
              child: _buildActiveSubscriptions(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return Container(
      height: 50.v,
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          _localizations.activeSubscriptions,
          style: CustomTextStyles.titleLargeGray50,
        ),
      ),
    );
  }

  Widget _buildActiveSubscriptions() {
    return Container(
      decoration: AppDecoration.fillLightBlueA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderT20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeadline(),
          Expanded(
            child: Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillGray200.copyWith(
                borderRadius: BorderRadiusStyle.customBorderT20,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              child: ValueListenableBuilder(
                valueListenable: MainRepository.paymentBox.listenable(),
                builder: (context, box, child) {
                  final List<PaymentModel> payments =
                      MainRepository.filteredPayments(
                    _selectedDate,
                    _selectedCategory,
                  );

                  return payments.isNotEmpty
                      ? PaymentListView(
                          payments: payments,
                        )
                      : Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                            ),
                            child: Text(
                              _localizations.thereIsNoPayment,
                              style: CustomTextStyles.bodyLargeOnPrimary,
                            ),
                          ),
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
