part of 'modify_permenant_cubit.dart';


abstract class ModifyPermenantState extends Equatable {
  const ModifyPermenantState();
  @override
  List<Object?> get props => [];
}

class ModifyPermenantInitial extends ModifyPermenantState {}
class ModifyPermenantLoading extends ModifyPermenantState {}

class ModifyPermanentlyLoaded extends ModifyPermenantState {
  final int quantity;
  final String frequencyType;
  const ModifyPermanentlyLoaded({
    required this.quantity,
    required this.frequencyType,
  });

  ModifyPermanentlyLoaded copyWith({
    int? quantity,
    String? frequencyType,
  }) {
    return ModifyPermanentlyLoaded(
      quantity: quantity ?? this.quantity,
      frequencyType: frequencyType ?? this.frequencyType,
    );
  }
  @override
  List<Object> get props => [quantity, frequencyType];
}
class ModifyPermanentError extends ModifyPermenantState {
  final String message;
  const ModifyPermanentError({required this.message});
}

