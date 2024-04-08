import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<SuperModel> personList = [
    SuperModel(name: null),
    SuperModel(name: 'sarrrrr'),
    SuperModel(name: 'sarrrrr')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Map<String , dynamic> data = {
            'name' : "sarwar",
          };

          SuperModel model = SuperModel.fromJson(data);
          print(model.name.toString());
          SuperModel superModel = SuperModel(name: 'sawar');
          SuperModel superModel1 = SuperModel(name: 'sawar');
          print(superModel.hashCode.toString());
          print(superModel1.hashCode.toString());
          print(superModel == superModel1);

          print(model.name.toString());
          model = model.copyWith(name: 'seeerwar');
          print(model.name.toString());
        },
      ),
      body: ListView.builder(
          itemCount: personList.length ,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(personList[index].name.toString()),
        );
      }),
    );
  }
}
class SuperModel{
  String? name;
  SuperModel({this.name});

  @override
  bool operator == (Object other)=> identical(this, other)||
  other is SuperModel &&
  runtimeType == other.runtimeType && name ==other.name;
  @override
  int get hashCode => name.hashCode;
  SuperModel.fromJson(Map<String , dynamic> json){
    name = json['name'];
  }
  Map<String , dynamic> toJson(){
    final Map <String , dynamic> data = new Map<String , dynamic>();
    data['name'] = this.name;
    return data;
  }
  SuperModel copyWith({
    String? name,
}){
    return SuperModel(
      name: name?? name
    );
  }
}

