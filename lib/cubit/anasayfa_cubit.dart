import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/entity/todo.dart';
import 'package:odev7/repo/tododao_repo.dart';

class AnasayfaCubit extends Cubit<List<TodoList>> {
  AnasayfaCubit() : super(<TodoList>[]);

  var trepo = ToDoDaoRepo();

  Future<void> listeyiYukle() async {
    var liste = await trepo.tumListeyiAl();
    emit(liste);
  }

  Future<void> sil(int todolist_id) async {
    await trepo.yapilacakSil(todolist_id);
    var liste = await trepo.tumListeyiAl();
    emit(liste);
  }

  Future<void> ara(String arananKelime) async {
    var liste = await trepo.yapilacakAra(arananKelime);
    emit(liste);
  }
}

//List Silme
//Arama yapma
