// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/cubit/cubit.dart';
import 'package:newsapp/widget/widget_file.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
       var list = NewsCubit.get(context).business;
    return ConditionalBuilder(
      fallback: (context) => Center(child: CircularProgressIndicator.adaptive()),
      condition:list.length>0,
       builder: (context)=>
        ListView.separated(
                separatorBuilder: (context,i){
                  return dvider();
                },
                itemCount:NewsCubit.get(context).business.length ,
                itemBuilder: (context,i){
                  
                  return bulidArticleItem(list[i]);
                }),
       );
      }
     
  }

/*
 return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state){
        return ListView.separated(
              separatorBuilder: (context,i){
                return Divider(color: Colors.blue,
                  thickness: 5,height: 2,);
              },
              itemCount:NewsCubit.get(context).business.length ,
              itemBuilder: (context,i){
                var list = NewsCubit.get(context).business;
                return bulidArticleItem(list[i]);
              });
      },
      listener: (context,state){}
    ); 
  }

*/