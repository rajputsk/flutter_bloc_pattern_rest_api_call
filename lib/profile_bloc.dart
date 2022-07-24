import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api_call/webservices.dart';

import 'ProfileModel.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _service = WebServices();

  ProfileBloc() : super(ProfileInitial()) {
    on<ButtonClicked>((event, emit) => _callApi(event, emit));
  }

  _callApi(ButtonClicked event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    var response = await _service.callProfileApi();
    if (response == null) {
      emit(ProfileError('Error'));
    } else {
      var body = jsonDecode(response.body);
      print('body- $body');
      var data = ProfileModel.fromJson(body);
      print(data);
      emit(ProfileSuccess(data));
    }
  }
}
