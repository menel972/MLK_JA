// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlk_ja/common/connectivity_service.dart';

class HomeBloc extends Cubit<ConnectivitySate> {
  HomeBloc() : super(const ConnectivitySate()) {
    initConnectionState();
    ConnectivityService().listenConnectionChanged().onData((changes) {
      connectionChanged(changes);
    });
  }

  void changeView(int index) => emit(state.copyWith(index: index));

  void connectionChanged(ConnectivityResult changes) =>
      emit(state.copyWith(connection: changes));

  Future<void> initConnectionState() async => emit(state.copyWith(
      connection: await ConnectivityService().currentConnectivity()));
}

class ConnectivitySate extends Equatable {
  final ConnectivityResult? connection;
  final int index;
  const ConnectivitySate({
    this.connection,
    this.index = 0,
  });
  @override
  List<Object?> get props => [connection, index];

  ConnectivitySate copyWith({
    ConnectivityResult? connection,
    int? index,
  }) {
    return ConnectivitySate(
      connection: connection ?? this.connection,
      index: index ?? this.index,
    );
  }
}
