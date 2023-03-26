import 'dart:convert';

import 'package:logging/logging.dart';

abstract class AppLogger {
  ///LOGGERS
  static const _general = 'TUA_LOG';
  static const _database = 'DATABASE';
  static const _seperator = '---------------------';
  static const isDev = true;

  static const JsonDecoder decoder = JsonDecoder();
  static const JsonEncoder encoder = JsonEncoder.withIndent('  ');

  static void init() {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  ///LOG EVENT METHODS
  ///
  /// verbose is visible at production
  static void public(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    Logger.root.info('[$_general] $message', error, stackTrace);
  }

  /// config
  static void config(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (isDev) Logger.root.info('❕[$_general] $message ❕', error, stackTrace);
  }

  /// debug
  static void dev(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (isDev) Logger.root.info('[$_general] $message', error, stackTrace);
  }

  static void database(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (isDev) Logger.root.info('[$_database] $message', error, stackTrace);
  }

  /// what a terrible failure
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (isDev) Logger.root.info('⁉️😂️ [$_general] $message', error, stackTrace);
  }

  /// what a terrible failure seperated with lines
  static void withSeperator(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (isDev) Logger.root.info('\n$_seperator\n⁉️😂️ [$_general] $message\n$_seperator\n', error, stackTrace);
  }

  /// error
  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (isDev) Logger.root.info('❌❌ [$_general] $message ❌❌', error, stackTrace);
  }

  static void errorDatabase(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (isDev) Logger.root.info('❌❌ [$_database] $message ❌❌', error, stackTrace);
  }

  /// print pretty json to the terminal
  /// also works on production
  static void prettyPrintJson(String input, [dynamic error, StackTrace? stackTrace]) {
    final object = decoder.convert(input);
    final prettyString = encoder.convert(object);
    String message = '';
    prettyString.split('\n').forEach((element) => message += '$element\n');

    Logger.root.info('[$_general]\n$_seperator\n$message\n$_seperator\n', error, stackTrace);
  }

  static void printDash() {
    Logger.root.info('------------------------');
  }
}
