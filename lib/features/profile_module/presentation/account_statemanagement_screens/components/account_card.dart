import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtaser/features/profile_module/data/models/account_model.dart';
import 'package:elmokhtaser/features/profile_module/presentation/account_statemanagement_screens/components/bill_item.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AccountCard extends StatelessWidget {
  final AccountModel accountModel;
  const AccountCard({Key? key, required this.accountModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BillItem(title: 'description'.tr(), info: accountModel.describtion),
            BillItem(title: 'type'.tr(), info: accountModel.type),
            BillItem(title: 'price'.tr(), info: accountModel.price),
            BillItem(title: 'status'.tr(), info: accountModel.state),
            BillItem(
                title: 'date'.tr(),
                info: DateFormat.yMd().format(accountModel.date) +
                    '\t\t\t' +
                    DateFormat.Hm().format(accountModel.date))
          ],
        ),
      ),
    );
  }
}
