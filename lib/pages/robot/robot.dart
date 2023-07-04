import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_robot_app/global.dart';
import 'package:tax_robot_app/pages/robot/controller/robot.controller.dart';

class Robor extends StatelessWidget {
  Robor({super.key});
  final robotController = RobotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('税务知识问答'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: robotController.records.length, // 假设有20条信息
              itemBuilder: (context, index) {
                final record = robotController.records[index]; // 获取对应索引的记录
                final role = record['role'];
                final content = record['content'];
                Widget widgetItem;
                if (role == 'user') {
                  widgetItem = Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(content),
                      SvgPicture.asset(
                        AssetsSvg.iconAvatarUserSvg,
                        width: 12,
                      ),                   
                    ],
                  );
                } else {
                  widgetItem = Row(
                    children: [
                      Text(content),
                    ],
                  );
                }

                return widgetItem;
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '搜索',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
