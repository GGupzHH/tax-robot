import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tax_robot_app/common/utils/index.dart';
import 'package:tax_robot_app/global.dart';
import 'package:tax_robot_app/pages/robot/controller/robot.controller.dart';

class RobotPage extends StatelessWidget {
  RobotPage({Key? key}) : super(key: key);

  final robotController = RobotController();
  final List<String> dropdownOptions = ['税务师', '律师'];
  String? selectedOption; // 定义 selectedOption 变量，初始值为 null

  @override
  void initState() {
    selectedOption = dropdownOptions[0]; // 将初始值设置为第一个选项
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('标题'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: robotController.records.length,
              itemBuilder: (context, index) {
                final record = robotController.records[index];
                final role = record['role'];
                final content = record['content'];

                return _buildMessage(role, content);
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // 下拉组件交互逻辑
                  },
                  child: Container(
  padding: const EdgeInsets.all(10),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      DropdownButton<String>(
        value: selectedOption, // 当前选中的选项
        onChanged: (String? newValue) {
          // 下拉选项变化时的处理逻辑
          // 更新选中的选项
          selectedOption = newValue;
        },
        items: dropdownOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
      ),
    ],
  ),
),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffEFF1F4), // 设置背景颜色
                      borderRadius: BorderRadius.circular(4.0), // 设置圆角
                    ),
                    // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // 设置内边距
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '请输入您希望了解的问题',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff909399),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4.0),
                Container(
                  width: 54,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffF37021), // 设置背景颜色
                    borderRadius: BorderRadius.circular(4.0), // 设置圆角
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      AssetsSvg.iconButtonSvg,
                      width: 20,
                    ),
                    onPressed: () {
                      // 自定义按钮点击事件
                    },
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget _buildMessage(String role, String content) {
    final isUser = role == 'user';

    return Row(
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUser)
          SvgPicture.asset(
            AssetsSvg.iconAvatarRobotSvg,
            width: 36,
          ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isUser ? GlobalColor.themeColor : Colors.white,
          ),
          child: Text(
            content,
            style: TextStyle(
              color: isUser ? Colors.white : createMaterialColor(const Color(0xff303133)),
            ),
          ),
        ),
        if (isUser)
          SvgPicture.asset(
            AssetsSvg.iconAvatarUserSvg,
            width: 36,
          ),
      ],
    );
  }
}
