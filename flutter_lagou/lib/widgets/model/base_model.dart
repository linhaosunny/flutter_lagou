class BaseModel {
  String module_name;
  List content;

  BaseModel.fromJson(Map data,String modelName,void callback(Map data)) {
    module_name = data['module_name'];
    
    if (module_name == modelName) {
      content = data['content'];
      content.forEach((data) {
        callback(data);
      });
    }
  }

  BaseModel.fromJsonToNormalData(Map data,String modelName,void callback(T)) {
    module_name = data['module_name'];
    if (module_name == modelName) {
      callback(data['content']);
    }
  }

  BaseModel.fromJsonToNormal(Map data,String modelName,void callback(Map data)) {
    module_name = data['module_name'];
    if (module_name == modelName) {
      Map userContent = data['content'];
      callback(userContent);
    }
  }

  BaseModel.fromJsonToNormalArray(Map data,String modelName,void callback(T)) {
    module_name = data['module_name'];
    
    if (module_name == modelName) {
      content = data['content'];

      content.forEach((data) {
        callback(data);
      });
    }
  }
}