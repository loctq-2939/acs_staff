import 'package:acs_staff/styles/acs_colors.dart';
import 'package:acs_staff/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailScreen extends StatefulWidget {
  OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ACSColors.background,
      appBar: AppBar(
        backgroundColor: ACSColors.primary,
        title:
            const Text('Chi tiết đơn hàng', style: ACSTyphoghraphy.titleAppbar),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ACSColors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Thông tin khách hàng',
                    style: ACSTyphoghraphy.confirmTitle.copyWith(
                      fontFamily: 'CrimsonPro-Bold',
                      fontSize: 20,
                      color: ACSColors.secondaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Divider(color: ACSColors.background, thickness: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Tên khách hàng',
                          style: ACSTyphoghraphy.order,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Chị Uyên',
                          style: ACSTyphoghraphy.orderDetail,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Số điện thoại',
                          style: ACSTyphoghraphy.order,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '0378285566',
                          style: ACSTyphoghraphy.orderDetail,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Địa chỉ',
                          style: ACSTyphoghraphy.order,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Số 123 đường S11 - Phường An Lạc - Quận Bình Tân',
                          style: ACSTyphoghraphy.orderDetail,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ACSColors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2. Nội dung sửa chữa',
                    style: ACSTyphoghraphy.confirmTitle.copyWith(
                      fontFamily: 'CrimsonPro-Bold',
                      fontSize: 20,
                      color: ACSColors.secondaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Divider(color: ACSColors.background, thickness: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text('Trạng thái', style: ACSTyphoghraphy.order),
                      ),
                      Expanded(
                        flex: 2,
                        child: changeStatus(3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child:
                            Text('Ngày sửa chữa', style: ACSTyphoghraphy.order),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('07/01/2022',
                            style: ACSTyphoghraphy.orderDetail),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child:
                            Text('Tổng số máy', style: ACSTyphoghraphy.order),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('4', style: ACSTyphoghraphy.orderDetail),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text('Tình trạng', style: ACSTyphoghraphy.order),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Hư bộ phận bơm ga, bụi bẩn',
                          style: ACSTyphoghraphy.order,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nội dung sửa chữa',
                          style: ACSTyphoghraphy.title),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                height: 313,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text('Chọn dịch vụ',
                                        style: ACSTyphoghraphy.title),
                                    const SizedBox(height: 10),
                                    Container(
                                      width: double.infinity,
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: ACSColors.primary, width: 1),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<dynamic>(
                                          items: items
                                              .map((e) => buildMenuItem(e))
                                              .toList(),
                                          icon: Image.asset(
                                              'assets/icons/arrow-down.png'),
                                          elevation: 0,
                                          isExpanded: true,
                                          value: items[0],
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text('Giá tiền',
                                        style: ACSTyphoghraphy.title),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 30,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: ACSColors.primary, width: 1),
                                      ),
                                      child: const Text(
                                        '245.000 VNĐ',
                                        style: ACSTyphoghraphy.detail,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text('Miêu tả lý do',
                                        style: ACSTyphoghraphy.title),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      minLines: 2,
                                      maxLines: 3,
                                    ),
                                    const SizedBox(height: 14),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                          onPressed: () => Get.back(),
                                          child: Text(
                                            'Đóng',
                                            style: ACSTyphoghraphy.buttonTitle
                                                .copyWith(color: Colors.red),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Xác nhận',
                                            style: ACSTyphoghraphy.buttonTitle
                                                .copyWith(
                                                    color: ACSColors.primary),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text('Thêm'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text('Tên service: giá tiền VNĐ'),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                content: SizedBox(
                                  height: 180,
                                  width: 180,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/no-image.jpg',
                                        width: 120,
                                        height: 120,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Thêm ảnh'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.camera),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Hoàn thành',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text(
            'Hoàn thành',
            style: ACSTyphoghraphy.buttonTitle,
          ),
          style: ElevatedButton.styleFrom(
              primary: ACSColors.primary,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(item, style: ACSTyphoghraphy.heading1),
        value: item,
      );

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
