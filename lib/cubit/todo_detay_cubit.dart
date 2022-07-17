import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/repo/tododao_repo.dart';

class TodoDetayCubit extends Cubit<void> {
  TodoDetayCubit() : super(0);

  var trepo = ToDoDaoRepo();
  Future<void> guncelle(int todolist_id, String yapilacak_is) async {
    await trepo.yapilacakGuncelle(todolist_id, yapilacak_is);
  }
}

//Güncelleme Gelecek
