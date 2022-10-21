
// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screen/cubit/cubit.dart';
import 'package:newsapp/widget/widget_file.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).sports;
    return ConditionalBuilder(
      fallback: (context) => Center(child: CircularProgressIndicator.adaptive()),
      condition:list.length>0,
       builder: (context)=>
        ListView.separated(
                separatorBuilder: (context,i){
                  return dvider();
                },
                itemCount:NewsCubit.get(context).sports.length ,
                itemBuilder: (context,i){
                  
                  return bulidArticleItem(list[i]);
                }),
       );
      
    
  }
}
