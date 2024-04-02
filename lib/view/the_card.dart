import 'package:flutter/material.dart';
import 'package:news_app/model/news_article_model.dart';

class TheNewsCard extends StatelessWidget {
  final ArticleModel articleObject;
  const TheNewsCard({super.key, required this.articleObject});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
        borderRadius: const BorderRadius.all(Radius.circular(15))
      ),
      child: Column(
        children: [
          (articleObject.imageUrl != null)? Image.network(articleObject.imageUrl!) : const SizedBox(height: 5,) ,
          const SizedBox(height: 15,),
          (articleObject.title != null)? Text(articleObject.title!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)) : const Text('See ....', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),) ,
          const SizedBox(height: 15,),
          (articleObject.description != null)? Text(articleObject.description!) : const Text('more ....') ,
          const SizedBox(height: 10,),
          (articleObject.author != null)? Row(
            children: [
              const Spacer(),
              Text('by ${articleObject.author}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),),
              const SizedBox(width: 15,)
            ],
          ) : const SizedBox(height: 5,) ,


        ],
      ),
    );
  }
}
