import 'package:flutter/material.dart';
import 'package:qlts/notification/notification_model.dart';

class MyNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyNotificationState();
}

class MyNotificationState extends State<MyNotification> {

  List<NotificationModel> notifications = [
    new NotificationModel(
        title: 'Thông báo cập nhật chức năng mới',
        content: 'Hệ thống quản lý tài sản đã thực hiện cập nhật tính năng.Hệ thống quản lý tài sản đã thực hiện cập nhật tính năng.Hệ thống quản lý tài sản đã thực hiện cập nhật tính năng.',
        time: '20/11/2020 10:11:22')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Danh sách thông báo'),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyDetailNotification(
                                  notifications[index].title)))
                    },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    // color: Colors.amber
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notifications[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          notifications[index].content,
                        ),
                      ),
                      Text(
                        notifications[index].time,
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}

class MyDetailNotification extends StatelessWidget {
  final title;

  MyDetailNotification(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(title))),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1.0)),
      ),
    );
  }
}
