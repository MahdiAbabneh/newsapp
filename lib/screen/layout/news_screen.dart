

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/screen/Screens/search_screen.dart';
import 'package:newsapp/screen/cubit/cubit.dart';
import 'package:newsapp/screen/cubit/states.dart';
import 'package:newsapp/widget/widget_file.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusiness(),
        child: BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              NewsCubit cubit = NewsCubit.get(context);
              return Scaffold(
               
                appBar: AppBar(
                  title: const Text(
                    "News App",
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                        navigateTo(context, SearchScreen());
                        },
                        icon: const Icon(Icons.search)),
                         IconButton(
                        onPressed: () {
                        NewsCubit.get(context).isDark();
                        },
                        icon: const Icon(Icons.brightness_4_outlined))
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                    items: cubit.bottomItem,
                    currentIndex: NewsCubit.get(context).count,
                    onTap: (index) {
                      NewsCubit.get(context).openBouton(index);  
                    }),
                body: cubit.screens[NewsCubit.get(context).count],
              );
            }));
  }
}
