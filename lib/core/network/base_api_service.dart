import 'package:news_app/core/const/app_const.dart';

mixin BaseApiService {
  Map<String, String> header() => {
    "Authorization": "Bearer ${AppConst.apiKey}",
  };
}