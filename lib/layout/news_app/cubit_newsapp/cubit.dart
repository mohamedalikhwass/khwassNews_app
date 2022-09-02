import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwass_app/layout/news_app/cubit_newsapp/status.dart';
import 'package:khwass_app/modules/news_app/business/businese.dart';
import 'package:khwass_app/modules/news_app/sciences/csiences.dart';
import 'package:khwass_app/modules/news_app/settings/settings.dart';
import 'package:khwass_app/modules/news_app/sports/sports.dart';

import 'package:khwass_app/network/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStatus>
{
  NewsAppCubit() :super (NewsAppInitialState());

  static NewsAppCubit get(context)=>BlocProvider.of(context);
  int  currentIndex=0;

  List<Widget> screens=
      [
        NewsAppBusiness(),
        NewsAppSports(),
        NewsAppSciences(),
        NewsAppSettings(),

      ];

  List<BottomNavigationBarItem> bottomNavBar=
      [
        BottomNavigationBarItem(
            icon:Icon(
               Icons.business,
            ),
          label: 'Business'
        ),
        BottomNavigationBarItem(
            icon:Icon(
              Icons.sports,
            ),
            label: 'Sports'
        ),
        BottomNavigationBarItem(
            icon:Icon(
              Icons.science_outlined,
            ),
            label: 'Science'
        ),
        BottomNavigationBarItem(
            icon:Icon(
              Icons.settings,
            ),
            label: 'Settings'
        ),
      ];

  void changeBottomNavBar(index)
  {
    if(index==0)
      getBusiness();
    else if(index==1)
      getSports();
    else if(index==2)
      getScience();
    currentIndex=index;
    emit(NewsBottomNavState());
  }

  List< dynamic> business=[];

  void getBusiness()
  {
    if(business.length==0)
      {
        emit(NewsLoadingBusinessState());
        DioHelper.getDate(
          url: 'v2/top-headlines',
          query:{ 'country':'eg','category':'business','apiKey':'65f7f556ec76449fa7dc7c0069f040ca',},
        ).then((value)
        {

          business=value.data['articles'];
          print(business[0]['title']);
          emit(NewsGetBusinessSuccessState());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetBusinessErrorState(error.toString()));

        });
      }
    else
      emit(NewsGetBusinessSuccessState());
  }

  List< dynamic> sports=[];

  void getSports()
  {
    if(sports.length==0)
      {
        emit(NewsLoadingSportsState());
        DioHelper.getDate(
          url: 'v2/top-headlines',
          query:{ 'country':'eg','category':'sports','apiKey':'65f7f556ec76449fa7dc7c0069f040ca',},
        ).then((value)
        {

          sports=value.data['articles'];
          print(business[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));

        });

      }
      else
      emit(NewsGetSportsSuccessState());
  }

  List< dynamic> science=[];

  void getScience()
  {
    if(science.length==0)
      {
        emit(NewsLoadingScienceState());
        DioHelper.getDate(
          url: 'v2/top-headlines',
          query:{ 'country':'eg','category':'science','apiKey':'65f7f556ec76449fa7dc7c0069f040ca',},
        ).then((value)
        {

          science=value.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));

        });
      }
    else
      emit(NewsGetScienceSuccessState());


  }




  List< dynamic> search=[];

  void getSearch(String value)
  {

      emit(NewsLoadingSearchState());

      DioHelper.getDate(
        url: 'v2/everything',
        query:{ 'q':'$value','apiKey':'65f7f556ec76449fa7dc7c0069f040ca',},
      ).then((value)
      {

        search=value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));

      });



  }
}