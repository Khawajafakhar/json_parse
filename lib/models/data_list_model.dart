import './data_model.dart';

class DataList {
  List<Data> dataList;

  DataList({
    required this.dataList,
  });

  factory DataList.fromjson(List<dynamic> jsondata) {
    List<Data> listData = jsondata.map((data) => Data.fromJson(data)).toList();

    return DataList(
      dataList: listData,
    );
  }
}
