abstract class NewsAppStatus {}

class NewsAppInitialState extends NewsAppStatus{}

class NewsBottomNavState extends NewsAppStatus{}

class NewsLoadingBusinessState extends NewsAppStatus{}

class NewsGetBusinessSuccessState extends NewsAppStatus{}

class NewsGetBusinessErrorState extends NewsAppStatus
  {
     final String error;
    NewsGetBusinessErrorState(this.error);

  }

class NewsLoadingSportsState extends NewsAppStatus{}

class NewsGetSportsSuccessState extends NewsAppStatus{}

class NewsGetSportsErrorState extends NewsAppStatus
{
  final String error;
  NewsGetSportsErrorState(this.error);

}

class NewsLoadingScienceState extends NewsAppStatus{}

class NewsGetScienceSuccessState extends NewsAppStatus{}

class NewsGetScienceErrorState extends NewsAppStatus
{
  final String error;
  NewsGetScienceErrorState(this.error);

}



class NewsLoadingSearchState extends NewsAppStatus{}

class NewsGetSearchSuccessState extends NewsAppStatus{}

class NewsGetSearchErrorState extends NewsAppStatus
{
  final String error;
  NewsGetSearchErrorState(this.error);

}




