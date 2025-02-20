class StringUtil {
  static List<String> matchImageSrc(String srcImageStr) {
    List<String> result = [];
    RegExp exp = new RegExp(r"<(img|IMG)(.*?)(/>|></img>|>)");
    for (var item in exp.allMatches(srcImageStr)) {
      String? str_img = item.group(2); // 修改为 String?
      if (str_img != null && str_img.isNotEmpty) {
        RegExp p_src = new RegExp(r"""(src|SRC)=(\"|\')(.*?)(\"|\')""");
        var match = p_src.firstMatch(str_img);
        if (match != null) {
          result.add(match.group(3)!); // 断言 group(3) 不为 null
        }
      }
    }
    return result;
  }

  static String getSrcImagePath(String srcImageStr) {
    List<String> list = matchImageSrc(srcImageStr);
    String? path = list.isNotEmpty ? list.first : null; // 处理空列表的情况

    return path ?? ''; // 如果 path 为 null，则返回空字符串
  }
}