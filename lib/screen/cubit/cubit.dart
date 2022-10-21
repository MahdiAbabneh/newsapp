import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/dio_helper.dart';
import 'package:newsapp/screen/Screens/business_screen.dart';
import 'package:newsapp/screen/Screens/science_screen.dart';
import 'package:newsapp/screen/Screens/sport_screen.dart';
import 'package:newsapp/screen/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = const [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
  ];

  List<String> title = [
    "Business",
    "Science",
    "Sport",
  ];

  int count = 0;
  void openBouton(index) {
    count = index;
    if(index==1){getScienc();}
    if(index==2){getSports();}
    emit(NewsBottomNavState());
  }

  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Scieness"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
  ];

    List<dynamic> business=[];

    void  getBusiness()
    {
        DioHelper.getData(url: 'v2/top-headlines', query: {
                            'country': 'eg',
                            'category': 'business',
                            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
                          }).then((value) {
                            business=value.data['articles']; 
                            if (kDebugMode) {
                              print(business[0]['title']);
                            }
                            emit(NewsGetBusinessSuccessState());
                          }).catchError((error) {
                            if (kDebugMode) {
                              print(error.toString());
                            }
                            emit(NewsGetBusinessErrorState(error.toString()));
                          });

    }

     List<dynamic> sports=[];

    void  getSports()
    {
        DioHelper.getData(url: 'v2/top-headlines', query: {
                            'country': 'eg',
                            'category': 'sports',
                            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
                          }).then((value) {
                            sports=value.data['articles']; 
                            if (kDebugMode) {
                              print(sports[0]['title']);
                            }
                            emit(NewsGetSportsSuccessState());
                          }).catchError((error) {
                            if (kDebugMode) {
                              print(error.toString());
                            }
                            emit(NewsGetSportsErrorState(error.toString()));
                          });

    }

     List<dynamic> science=[];

    void  getScienc()
    {
        DioHelper.getData(url: 'v2/top-headlines', query: {
                            'country': 'eg',
                            'category': 'science',
                            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
                          }).then((value) {
                            science=value.data['articles']; 
                            if (kDebugMode) {
                              print(science[0]['title']);
                            }
                            emit(NewsGetScienceSuccessState());
                          }).catchError((error) {
                            if (kDebugMode) {
                              print(error.toString());
                            }
                            emit(NewsGetScienceErrorState(error.toString()));
                          });

    }


 List<dynamic> search = [];

  void getSearch(String value)
  {

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
     

      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

      bool dark=false;

    void isDark()
    {
      dark=!dark;
      emit(NewsThemModeState());
      
    }
}