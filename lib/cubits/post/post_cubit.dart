

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/models/post/post_model.dart';
import 'package:flutter_boilerplate/repositories/post/post_repository.dart';
import 'package:flutter_boilerplate/utils/dio_error_util.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _postRepository;

  PostCubit(this._postRepository) : super(PostInitial());

  void loadPosts() async {
    emit(PostLoading());
    try {
      List<PostModel> records = await _postRepository.getPosts();
      emit(PostLoaded(postList: records));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
