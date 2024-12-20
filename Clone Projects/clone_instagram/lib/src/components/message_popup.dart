import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopup extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? okCallback;
  final Function()? cancalCallback;
  const MessagePopup({
    super.key,
    required this.title,
    required this.message,
    required this.okCallback,
    this.cancalCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              width: Get.width * 0.7,
              child: Column(
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    message!,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: okCallback, child: Text('확인')),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: cancalCallback,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                        child: Text('취소'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
