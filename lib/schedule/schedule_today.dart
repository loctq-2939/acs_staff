import 'package:acs_staff/@core/repository/models/Order.dart';
import 'package:acs_staff/@share/utils/util.dart';
import 'package:acs_staff/history/order_detail.dart';
import 'package:acs_staff/schedule/schedule_today.controller.dart';
import 'package:acs_staff/styles/acs_colors.dart';
import 'package:acs_staff/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import '../@share/router/pages.dart';

class ScheduleToday extends GetWidget<ScheduleTodayController> {
  const ScheduleToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ACSColors.background,
        appBar: AppBar(
          backgroundColor: ACSColors.primary,
          title: Text(DateFormat('dd-MM-yyyy').format(DateTime.now()),
              style: ACSTyphoghraphy.titleAppbar),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Obx(
                () => ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.listOrder.length,
                    itemBuilder: (BuildContext context, int index) {
                      return itemOrder(order: controller.listOrder[index])
                          .onTap(() {
                        goTo(
                            screen: ROUTE_ORDER_DETAIL,
                            argument: [controller.listOrder[index]]);
                      });
                    }),
              )),
        ),
      ),
    );
  }

  TextSpan changeStatus(int index) {
    if (index == 1) {
      return TextSpan(
          text: 'Đã từ chối',
          style: ACSTyphoghraphy.detail.copyWith(color: Colors.red));
    } else if (index == 2) {
      return TextSpan(
        text: 'Đã duyệt',
        style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.orange),
      );
    } else if (index == 3) {
      return TextSpan(
        text: 'Đã nhận',
        style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.blue),
      );
    }
    return TextSpan(
      text: 'Đã hoàn thành',
      style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.green),
    );
  }

  Widget itemOrder({required Order order}) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ACSColors.primary),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Trạng thái: ',
                style: ACSTyphoghraphy.detail,
                children: [
                  changeStatus(order.orderStatus ?? 0),
                ],
              ),
            ),
            Text('Tên khách hàng: ${order.fullName}',
                style: ACSTyphoghraphy.listTitle),
            const SizedBox(height: 8),
            Text('Số điện thoại: ${order.phone}',
                style: ACSTyphoghraphy.listTitle),
            const SizedBox(height: 8),
            Text('Địa chỉ: ${order.address}', style: ACSTyphoghraphy.listTitle),
            const SizedBox(height: 8),
            Text('Thời gian dự kiến: ${order.date}',
                style: ACSTyphoghraphy.listTitle),
          ],
        ),
      );
}
