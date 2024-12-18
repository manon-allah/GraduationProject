import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../domain/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;
  SearchCubit({
    required this.searchRepository,
  }) : super(SearchInitial());

  Future<void> searchUser(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    try {
      emit(SearchLoading());
      final users = await searchRepository.searchUser(query);
      emit(SearchSuccess(users));
    } catch (e) {
      emit(SearchError('Error getting search results: $e'));
    }
  }
}
