part of 'modify_temp_cubit.dart';

abstract class ModifyTempState extends Equatable {
  const ModifyTempState();

  @override
  List<Object?> get props => [];
}

class ModifyTempInitial extends ModifyTempState {}

class ModifyTempLoading extends ModifyTempState {}
class ModifyTempError extends ModifyTempState {
  final String message;
  const ModifyTempError({required this.message});
}

class ModifyTemporarilyState extends ModifyTempState {
  final int quantity;
  final bool isSingleDay;
  final String selectedDate;
  final String toDate;

  const ModifyTemporarilyState({
    required this.quantity,
    required this.isSingleDay,
    required this.selectedDate,
    required this.toDate,
  });

  ModifyTemporarilyState copyWith({
    int? quantity,
    bool? isSingleDay,
    String? selectedDate,
    String? toDate,
  }) {
    return ModifyTemporarilyState(
      quantity: quantity ?? this.quantity,
      isSingleDay: isSingleDay ?? this.isSingleDay,
      selectedDate: selectedDate ?? this.selectedDate,
      toDate: toDate ?? this.toDate,
    );
  }

  @override
  List<Object?> get props => [quantity, isSingleDay, selectedDate, toDate];
}
