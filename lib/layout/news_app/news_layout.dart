import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwass_app/modules/news_app/search/search.dart';
import 'package:khwass_app/network/remote/dio_helper.dart';
import 'package:khwass_app/shaerd/components/components.dart';
import 'cubit_newsapp/cubit.dart';
import 'cubit_newsapp/status.dart';



class NewsAppLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStatus>(
        listener: (context,state){},
        builder: (context,state)
        {
          NewsAppCubit cubit=NewsAppCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text(
                'Khwass News',
              ),
              actions: [

                IconButton(icon:Icon(Icons.search),
                  onPressed: ()
                  {
                    navigatorTo(context,NewsSearch());
                  },
                  iconSize: 30,
                ),
              ],

            ),
            bottomNavigationBar:BottomNavigationBar(
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);

              },
              type:BottomNavigationBarType.fixed ,
              items:cubit.bottomNavBar,
              currentIndex:cubit.currentIndex ,
            ) ,
            body: cubit.screens[cubit.currentIndex],
            );

        },

      );

  }
}
