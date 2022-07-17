import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/cubit/anasayfa_cubit.dart';
import 'package:odev7/entity/todo.dart';
import 'package:odev7/views/todo_detay_sayfa.dart';
import 'package:odev7/views/todo_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapilis = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().listeyiYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapilis
            ? TextField(
                decoration: InputDecoration(hintText: "Arama Yap"),
                onChanged: (aramaSonucu) {
                  context.read<AnasayfaCubit>().ara(aramaSonucu);
                },
              )
            : Text("Yapılacaklar Listesi"),
        actions: [
          aramaYapilis
              ? IconButton(
                  onPressed: () {
                    context.read<AnasayfaCubit>().listeyiYukle();
                    setState(() {
                      aramaYapilis = false;
                    });
                  },
                  icon: Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapilis = true;
                    });
                  },
                  icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<TodoList>>(
          builder: (context, todoListesi) {
        if (todoListesi.isNotEmpty) {
          return ListView.builder(
              itemCount: todoListesi.length,
              itemBuilder: (context, indeks) {
                var yapilacak = todoListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodoDetaySayfa(
                                  yapilacak: yapilacak,
                                ))).then((_) {
                      context.read<AnasayfaCubit>().listeyiYukle();
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "> ${yapilacak.yapilacak_is}",
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("İş silinsin mi?"),
                                  action: SnackBarAction(
                                      label: "EVET",
                                      onPressed: () {
                                        context
                                            .read<AnasayfaCubit>()
                                            .sil(yapilacak.todolist_id);
                                      }),
                                ));
                              },
                              icon: Icon(Icons.delete_outline,
                                  color: Colors.black54))
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: Text(
              "Alan Boş! Ekleme Yapabilirsin.",
              style: TextStyle(fontSize: 20),
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Ekle", style: TextStyle(fontSize: 18)),
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TodoKayitSayfa()))
              .then((_) {
            context.read<AnasayfaCubit>().listeyiYukle();
          });
        },
      ),
    );
  }
}
