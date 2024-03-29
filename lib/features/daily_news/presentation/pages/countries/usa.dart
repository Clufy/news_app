import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/article.dart';
import '../../bloc/article/remote/remote_article_bloc2.dart';
import '../../bloc/article/remote/remote_articles_state2.dart';
import '../../widgets/article_tile2.dart';

class Usa extends StatelessWidget{
  const Usa({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody() ,
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'NEWS',
        style: TextStyle(
            color: Colors.black
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc2,RemoteArticlesState2> (
      builder: (_,state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemBuilder: (context,index){
              return ArticleWidget2(
                article: state.articles![index] ,
                onArticlePressed: (article) => _onArticlePressed(context,article),
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }

}