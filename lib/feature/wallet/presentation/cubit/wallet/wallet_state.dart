part of 'wallet_cubit.dart';
abstract class WalletState extends Equatable {
  const WalletState();
  @override
  List<Object> get props => [];
}

class WalletInitial extends WalletState {}
class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {
  final WalletResponse walletResponse;
  const WalletLoaded({required this.walletResponse});
  @override
  List<Object> get props => [walletResponse];
}

class WalletError extends WalletState {
  final String message;
  const WalletError({required this.message});
  @override
  List<Object> get props => [message];
}
