import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/utils/follow_child_cubit/follow_child_states.dart';

class FollowChildCubit extends Cubit<FollowChildStates> {
  FollowChildCubit() : super(FollowChildIitialState());
  static FollowChildCubit getInstance(context) => BlocProvider.of(context);

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void boardProgressSending(dynamic model, int index) async {
    emit(FollowChildLoadingState());
    try {
      await users
          .doc('following')
          .collection('educationBoard')
          .doc('levelOne')   
          .set(
        {
          'pic': model.shapes[index],
          'progress': (index + 1 ) / model.shapes.length,
          'category': model.activity
        },
      );
      emit(FollowChildSuccessState());
    } catch (e) {
      emit(FollowChildErrorState(error: e.toString()));
      rethrow;
    }
  }
}
