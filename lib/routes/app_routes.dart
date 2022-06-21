import 'package:get/get.dart';
import 'package:my_bili/common/constants.dart';
import 'package:my_bili/common/utils/loading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppRoutes {
  /// 登录
  static const String login = "/login";

  /// 注册
  static const String registration = "/registration";

  /// 框架启动
  static const String frame = "/frame";

  /// 视频详情
  static const String videoDetail = "/videoDetail";

  /// 通知
  static const String notice = "/notice";

  //GetX的路由跳转参考
  // https://github.com/jonataslaw/getx/blob/master/documentation/zh_CN/route_management.md#navigation-with-named-routes
  // 导航到下一个页面
  // Get.toNamed("/NextScreen");

  // 浏览并删除前一个页面。
  // Get.offNamed("/NextScreen");

  // 浏览并删除所有以前的页面。
  // Get.offAllNamed("/NextScreen");

  /// 跳转视频详情
  static void toVideoDetail(String vid) {
    Get.toNamed(videoDetail, arguments: {Constants.VID: vid}, preventDuplicates: false);
  }

  /// 跳转登录
  static void toLogin() {
    Get.toNamed(login);
  }

  /// 跳转首页
  static void toMain() {
    Get.offNamed(frame);
  }

  /// 通过url执行相关操作,例如浏览器打开网页
  static void toUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      launchUrlString(url);
    } else {
      Loading.showError("链接跳转失败");
    }
  }
}
