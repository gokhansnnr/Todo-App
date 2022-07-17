import 'package:odev7/entity/todo.dart';
import 'package:odev7/sqlite/veritabani_yardimcisi.dart';

class ToDoDaoRepo {
  //-------------AnasayfaCubit----------------------
  Future<List<TodoList>> tumListeyiAl() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM TodoList");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return TodoList(
          todolist_id: satir["todolist_id"],
          yapilacak_is: satir["yapilacak_is"]);
    });
  }

  Future<void> yapilacakSil(int todolist_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db
        .delete("TodoList", where: "todolist_id=?", whereArgs: [todolist_id]);
  }

  Future<List<TodoList>> yapilacakAra(String arananKelime) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM TodoList WHERE yapilacak_is like '%$arananKelime%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return TodoList(
          todolist_id: satir["todolist_id"],
          yapilacak_is: satir["yapilacak_is"]);
    });
  }

  //-------------TodoKayitCubit----------------------

  Future<void> todoKayit(String yapilacak_is) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String, dynamic>();
    bilgiler["yapilacak_is"] = yapilacak_is;

    await db.insert("TodoList", bilgiler);
  }

  //-------------TodoDetayCubit----------------------

  Future<void> yapilacakGuncelle(int todolist_id, String yapilacak_is) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String, dynamic>();
    bilgiler["yapilacak_is"] = yapilacak_is;

    await db.update("TodoList", bilgiler,
        where: "todolist_id=?", whereArgs: [todolist_id]);
  }
}

//Arama Butonu
//Delete ile silme alınacak.
