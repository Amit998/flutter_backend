import 'package:dio/dio.dart';
import 'package:e_book_app/controller/api.dart';
import 'package:e_book_app/model/ebook/model_ebook.dart';

Future<List<ModelEbook>> fetchEBook(List<ModelEbook> fetch) async {
  var request = await Dio()
      .get(APIConstant().baseUrl + APIConstant().api + APIConstant().latest);

  for (Map<String, dynamic> ebook in request.data) {
    fetch.add(ModelEbook(
      id: ebook["id"],
      title: ebook["title"],
      photo: ebook["photo"],
      description: ebook["description"],
      cat_id: ebook["cat_id"],
      status_news: ebook["status_news"],
      pdf: ebook["pdf"],
      date: ebook["date"],
      author_name: ebook["author_name"],
      publisher_name: ebook["publisher_name"],
      pages: ebook["pages"],
      language: ebook["language"],
      rating: ebook["rating"],
      free: ebook["free"],
    ));
  }

  return fetch;
}
