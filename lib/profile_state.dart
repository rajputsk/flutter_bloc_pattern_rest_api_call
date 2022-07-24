part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSuccess extends ProfileState {
  final ProfileModel model;

  ProfileSuccess(this.model);

  @override
  List<Object> get props => [model];
}

class ProfileError extends ProfileState {
  final String msg;

  ProfileError(this.msg);

  @override
  List<Object> get props => [msg];
}
