import 'package:bloc_5/bloc/user_event.dart';
import 'package:bloc_5/bloc/user_state.dart';
import 'package:bloc_5/models/user.dart';
import 'package:bloc_5/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc(this.usersRepository) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: _loadedUserList));
      } catch (_) {
        emit(UserErrorState());
      }
    });

    on<UserDeleteEvent>((event, emit) {
      emit(UserEmptyState());
    });
  }

  // @override
  // Stream<UserState> mapEventToState(UserEvent event) async* {
  //   if (event is UserLoadEvent) {
  //     yield UserLoadingState();
  //     try {
  //       final List<User> _loadedUserList = await usersRepository.getAllUsers();
  //       yield UserLoadedState(loadedUser: _loadedUserList);
  //     } catch (_) {
  //       yield UserErrorState();
  //     }
  //   } else if (event is UserDeleteEvent) {
  //     yield UserEmptyState();
  //   }
  // }
}

// class UserBloc extends Bloc<UserEvent, UserState> {
//   final UsersRepository usersRepository;
//   UserBloc({required this.usersRepository}) : assert(usersRepository != null);

//   @override
//   UserState get initialState => UserEmptyState();

//   @override
//   Stream<UserState> mapEventToState(UserEvent event) async* {
//     if (event is UserLoadEvent) {
//       yield UserLoadingState();
//       try {
//         final List<User> _loadedUserList = await usersRepository.getAllUsers();
//         yield UserLoadedState(loadedUser: _loadedUserList);
//       } catch (_) {
//         yield UserErrorState();
//       }
//     } else if (event is UserDeleteEvent) {
//       yield UserEmptyState();
//     }
//   }
// }
