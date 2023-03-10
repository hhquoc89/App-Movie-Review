import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/commons/utils/app_colors.dart';

import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/search/cubit/search_cubit.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late SearchCubit searchCubit;
  List<Results> listResults = [];
  late MoviesResultModel moviesResultModel;

  bool isLoading = false;

  Future loadList(num page) async {
    try {
      final result =
          await SearchRepositories().getListMovie(searchController.text, page);
      isLoading = true;
      print(result!.page!);
      listResults.addAll(result.results ?? []);
      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    searchCubit = SearchCubit();
    moviesResultModel = MoviesResultModel();
    moviesResultModel.page = 1;
    loadList(1);
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        searchCubit.searchMovie(
            searchController.text.trim(), moviesResultModel.page!);
      }
    });
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        num? totalPage = await SearchRepositories()
            .getListMovie(searchController.text.trim(), 1)
            .then((value) => value!.totalPages);
        print(moviesResultModel.totalPages);
        if (totalPage != null &&
            moviesResultModel.page! < totalPage &&
            !isLoading) {
          moviesResultModel.page = moviesResultModel.page! + 1;
          print(moviesResultModel.page);
          loadList(moviesResultModel.page!);
        }
      }
    });
  }

  // void dispose() {
  //   searchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.darkBlue,
            title: Center(
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, RouteName.initial),
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 30,
                  height: 40,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
            // Text('Environment ${FlavorConfig.instance?.flavor.toString()}'),
            actions: [
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: const Icon(
                        Icons.person,
                        color: AppColors.white,
                      ),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (_) {},
                      items: <String>['Login', 'Sign Up', 'Setting']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
            ]),
        body: Column(
          children: [
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: TextField(
                    onEditingComplete: () {},
                    controller: searchController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.black,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            searchController.clear();
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: AppColors.black,
                          ),
                        ),
                        hintText: 'Search'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocConsumer(
                bloc: searchCubit,
                listener: (context, state) {
                  if (state is SearchSuccess) {
                    listResults = state.listResults;
                  }
                },
                builder: (context, state) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: listResults.length,
                      itemBuilder: (context, index) {
                        final results = listResults[index];
                        return InkWell(
                          onTap: () {
                            if (results.mediaType == 'movie') {
                              Navigator.pushNamed(
                                  context, RouteName.movieDetail,
                                  arguments: results);
                            }
                            Navigator.pushNamed(context, RouteName.movieDetail,
                                arguments: results);
                          },
                          child: ListTile(
                            title: Text(results.originalTitle ?? " "),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ));
  }
}
