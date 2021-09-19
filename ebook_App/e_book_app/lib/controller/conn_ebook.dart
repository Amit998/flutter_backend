import 'package:dio/dio.dart';
import 'package:e_book_app/controller/api.dart';
import 'package:e_book_app/model/ebook/model_ebook.dart';

Future<List<ModelEbook>> fetchEBook(List<ModelEbook> fetch) async {
  var request = await Dio()
      .get(APIConstant().baseUrl + APIConstant().api + APIConstant().latest);

  for (Map<String, dynamic> ebook in request.data) {
    fetch.add(
      ModelEbook(
        id: ebook["id"],
        title;
        photo;
        description;
        cat_id;
        status_news;
        pdf;
        date;
        author_name;
        publisher_name;
        pages;
        language;
        rating;
        free;
        


    ));
  }

  return null;
}
