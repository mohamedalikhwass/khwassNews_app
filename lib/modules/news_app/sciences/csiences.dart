import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwass_app/layout/news_app/cubit_newsapp/cubit.dart';
import 'package:khwass_app/layout/news_app/cubit_newsapp/status.dart';
import 'package:khwass_app/shaerd/components/components.dart';

class NewsAppSciences extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<NewsAppCubit,NewsAppStatus>(
          listener:(context,state){} ,
          builder: (context,state){

            var list =NewsAppCubit.get(context).science;

            return buildItemsArticlesNewsApp(list);

          }

      );
  }
}
