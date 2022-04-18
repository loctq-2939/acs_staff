import 'package:acs_staff/history/order_detail.dart';
import 'package:acs_staff/schedule/schedule_today.controller.dart';
import 'package:acs_staff/styles/acs_colors.dart';
import 'package:acs_staff/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
            child: Column(
              children: [
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Get.to(() => OrderDetailScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: ACSColors.primary),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: Text('Trạng thái:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: changeStatus(2),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Text('Tên khách hàng:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text('Lưu Phương Uyên',
                                  style: ACSTyphoghraphy.orderDetail),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Text('Điện thoại:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text('037828556',
                                  style: ACSTyphoghraphy.orderDetail),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Text('Địa chỉ:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text('68 Bến Nghé, An Lạc, Bình Tân',
                                  style: ACSTyphoghraphy.orderDetail),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Text('Thời gian:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text('20/04/2022',
                                  style: ACSTyphoghraphy.orderDetail),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => OrderDetailScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: ACSColors.primary),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: Text('Trạng thái:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: changeStatus(4),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Text('Tên khách hàng:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text('Lưu Phương Uyên',
                                  style: ACSTyphoghraphy.orderDetail),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Text('Điện thoại:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text('037828556',
                                  style: ACSTyphoghraphy.orderDetail),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Text('Địa chỉ:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text('68 Bến Nghé, An Lạc, Bình Tân',
                                  style: ACSTyphoghraphy.orderDetail),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Text('Thời gian:',
                                  style: ACSTyphoghraphy.order),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text('20/04/2022',
                                  style: ACSTyphoghraphy.orderDetail),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget changeStatus(int index) {
    if (index == 1) {
      return Text(
        'Đã từ chối',
        style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.red),
      );
    } else if (index == 2) {
      return Text(
        'Đã duyệt',
        style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.orange),
      );
    } else if (index == 3) {
      return Text(
        'Đã nhận',
        style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.blue),
      );
    }
    return Text(
      'Đã hoàn thành',
      style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.green),
    );
  }
}
