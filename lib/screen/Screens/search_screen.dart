import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/screen/cubit/cubit.dart';
import 'package:newsapp/screen/cubit/states.dart';
import 'package:newsapp/widget/widget_file.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(decoration: InputDecoration(border : OutlineInputBorder(),labelText:"Search" ),
                  onChanged: (value) => NewsCubit.get(context).getSearch(value),
                )
              ),
              Expanded(
                child:ConditionalBuilder(
      fallback: (context) => Center(child: CircularProgressIndicator.adaptive()),
      condition:list.length>0,
       builder: (context)=>
        ListView.separated(
                separatorBuilder: (context,i){
                  return dvider();
                },
                itemCount:10,
                itemBuilder: (context,i){
                  return bulidArticleItem(list[i]);
                }),
       )
              ),
            ],
          ),
        );
      },
    );
  }
}
