import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/cubit/todo_detay_cubit.dart';
import 'package:odev7/entity/todo.dart';

class TodoDetaySayfa extends StatefulWidget {
  TodoList yapilacak;

  TodoDetaySayfa({required this.yapilacak});

  @override
  _TodoDetaySayfaState createState() => _TodoDetaySayfaState();
}

class _TodoDetaySayfaState extends State<TodoDetaySayfa> {
  var tfYapilacakIs = TextEditingController();

  @override
  void initState() {
    super.initState();
    var yapilacak = widget.yapilacak;
    tfYapilacakIs.text = yapilacak.yapilacak_is;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yapılacak İş Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfYapilacakIs,
                decoration: InputDecoration(
                    hintText: "Yapılacak İş",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<TodoDetayCubit>().guncelle(
                        widget.yapilacak.todolist_id, tfYapilacakIs.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Güncelleme Başarılı"),
                      backgroundColor: Colors.green,
                    ));
                  },
                  child: Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}
