
import 'package:floor/floor.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/entities/article.dart';

@Entity(tableName: 'article',primaryKeys: ['id'])
class ArticleModel2 extends ArticleEntity {
  const ArticleModel2({
    int ? id,
    String ? author,
    String ? title,
    String ? description,
    String ? url,
    String ? urlToImage,
    String ? publishedAt,
    String ? content,
  }): super(
    id: id,
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  factory ArticleModel2.fromJson(Map < String, dynamic > map) {
    return ArticleModel2(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != "" ? map['urlToImage']:kDefaultImage2,
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }

  factory ArticleModel2.fromEntity(ArticleEntity entity) {
    return ArticleModel2(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content
    );
  }
}