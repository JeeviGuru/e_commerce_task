import 'package:e_commerce_app/api.dart';
import 'package:e_commerce_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BookStore {
  final _api = ApiClass();
  // Observable<ObservableFuture<List<ModelClass>> dataList = Observable(null);
Observable<ObservableFuture<List<ModelClass>>> dataList = Observable(ObservableFuture.value([]));


   Future<void> fetchAllData() async {
    try {
      runInAction(
        () {
          dataList.value = ObservableFuture(_api.getData());
             
        },
      );
     
    } catch (e) {
      debugPrint('Storeerror $e');
      rethrow;
    }
  }
}
