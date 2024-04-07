import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testcryptoapp/crypto_coins_app';
import 'package:get_it/get_it.dart';
import 'package:testcryptoapp/repositories/crypto_coins/crypto_coin.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() => CryptoCoinsRepository(dio: Dio()));

  runApp(const CryptoApp());
}