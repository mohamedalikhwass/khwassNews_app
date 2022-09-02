import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwass_app/layout/news_app/cubit_newsapp/cubit.dart';
import 'package:khwass_app/layout/news_app/cubit_newsapp/status.dart';
import 'package:khwass_app/shaerd/components/components.dart';


// ignore: must_be_immutable
class NewsSearch extends StatelessWidget {

  var searchControl=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStatus>(

      listener:(context,state){} ,
      builder: (context,state)
      {
        var list =NewsAppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: defaultTextForm(
                    control: searchControl,
                    labelText: 'Search',
                    onTap: (){},
                    onChanged: (value)
                    {
                        NewsAppCubit.get(context).getSearch(value);
                    },
                    validat: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'Search must be not null';
                      }
                      return null;
                    },
                    icon: Icons.search
                ),
              ),
              Expanded(child: buildItemsArticlesNewsApp(list)),
            ],
          ),

        );
      } ,

    );
  }
}
