import 'package:get/get.dart';

class RobotController extends GetxController {
  RobotController();

  final List<Map<String, dynamic>> records = [
    {
      'role': 'user',
      'content': '你好',
    },
    {
      'role': 'assistant',
      'content': '请问你有什么问题',
    },
  ];

  final _problem = ''.obs;
  set problem(value) => this._problem.value = value;
  get problem => this._problem.value;

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
