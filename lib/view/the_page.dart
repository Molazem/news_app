import 'package:flutter/material.dart';
import 'package:news_app/controller/online_data_handler.dart';
import 'package:news_app/view/the_card.dart';

import '../model/news_article_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final OhMyData onlineData = OhMyData();
  late Future<List<ArticleModel>> myDataList;

  @override
  void initState() {
    // TODO: implement initState
    myDataList = onlineData.theData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('The News App', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 24 ),)) ,
      ),
      body: FutureBuilder(
        future: myDataList,
        builder: (context, snapshot){
          if(!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index){
                return TheNewsCard(articleObject: snapshot.data![index]);
              });
          }
        },
      ),
    );
  }
}

