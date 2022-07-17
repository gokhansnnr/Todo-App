import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/repo/tododao_repo.dart';

class TodoKayitCubit extends Cubit<void> {
  TodoKayitCubit() : super(0);

  var trepo = ToDoDaoRepo();

  Future<void> kayit(String yapilacak_is) async {
    await trepo.todoKayit(yapilacak_is);
  }
}

//Kayit Gelecek
