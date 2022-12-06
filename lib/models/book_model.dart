import './author_model.dart';
import './data_list_model.dart';
import './data_model.dart';

class Book {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final Auther? auther;
  final DataList? data;

  Book({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.auther,
    required this.data,
  });

  factory Book.fromjson(Map<String, dynamic> jsonBook) {
    return Book(
      page: jsonBook["page"],
      perPage: jsonBook["per_page"],
      total: jsonBook["total"],
      totalPages: jsonBook["total_pages"],
      auther: jsonBook["author"] !=null 
      ? Auther.fromJson(jsonBook["author"]) 
      : null,
      data: jsonBook["data"] != null 
      ? DataList.fromjson(jsonBook["data"]) 
      : null,
    );
  }
}
