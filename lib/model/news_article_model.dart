class ArticleModel{
  final String? title;
  final String? author;
  final String? imageUrl;
  final String? description;

  ArticleModel({required this.title, required this.author, required this.description, required this.imageUrl});


  factory ArticleModel.fromJson(Map<String, dynamic> json){
    return ArticleModel(
        title: json['title'],
        author: json['author'],
        description: json['description'],
        imageUrl: json['urlToImage']);
  }


}