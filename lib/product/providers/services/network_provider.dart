import 'package:assessment/core/service/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkProvider = Provider<INetworkService>((ref) => NetworkService(Dio()));
