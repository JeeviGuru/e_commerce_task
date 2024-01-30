import 'dart:async';

import 'package:e_commerce_app/store/book_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

FutureOr<void> registerDependencies() {
  getIt.registerSingleton<BookStore>(
    BookStore(),
  );
}
