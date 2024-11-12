import 'package:bloc/bloc.dart';
import 'package:instagram/core/services/firebase_auth_service.dart';
import 'package:instagram/features/edit_profile/data/models/add_user_model.dart';
import 'package:meta/meta.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  AddUserModel? addUserModel;

  AddUserModel get getUser => addUserModel!;

  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  Future<String> getRefreshData() async {
    String err = 'Something wrong';
    try {
      AddUserModel user = await firebaseAuthService.getUserData();
      addUserModel = user;
      err = 'Get Data Success';
      emit(GetDataSuccess());
    } catch (e) {
      err = e.toString();
      emit(GetDataFailure());
    }
    return err; 
  }
}
