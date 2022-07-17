import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/cubit/todo_kayit_cubit.dart';

class TodoKayitSayfa extends StatefulWidget {
  const TodoKayitSayfa({Key? key}) : super(key: key);

  @override
  _TodoKayitSayfaState createState() => _TodoKayitSayfaState();
}

class _TodoKayitSayfaState extends State<TodoKayitSayfa> {
  var tfYapilacakIs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yapılacak İş Kayıt"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfYapilacakIs,
                decoration: InputDecoration(
                    hintText: "Yapılacak İşi Girin:",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (tfYapilacakIs.text != "") {
                      context.read<TodoKayitCubit>().kayit(tfYapilacakIs.text);
                      setState(() {
                        tfYapilacakIs.text = "";
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("İşiniz Listeye Eklendi"),
                        backgroundColor: Colors.green,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("İşi Belirtmediniz!"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
