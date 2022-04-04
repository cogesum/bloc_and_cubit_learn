abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<dynamic> loadUsers;

  UserLoadedState({required this.loadUsers}) : assert(loadUsers != null);
}

class UserErrorState extends UserState {}
