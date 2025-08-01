import 'package:isar/isar.dart';
import '../../global/value.dart';
part 'article.g.dart';

@Collection()
class Article{
  Id id=Isar.autoIncrement;
  String title;
  String author;//通常是nickName
  String label1;
  String label2;
  String label3;
  String label4;
  String label5;
  DateTime time;
  String txt;
  int viewCount;
  int visiblePermission;
  String coverPic;
  String accountsID;
  Article({
    required this.title,
    required this.author,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
    required this.label5,
    required this.time,
    required this.viewCount,
    required this.visiblePermission,
    required this.txt,
    required this.coverPic,
    required this.accountsID,
  }
  );
}
Future<Isar?> loadArticle() async{
  return await Isar.open([ArticleSchema], directory:  webArticleDir,name: webArticleIsarName);
}
