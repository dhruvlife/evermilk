import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milkride/feature/cart/presentation/cubit/cart/cart_cubit.dart';

class DeleteProductDialog extends StatelessWidget {
  final String cartId;
  const DeleteProductDialog({super.key, required this.cartId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete Confirmation"),
      content: Text("Are you sure you want to delete this item?"),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop(); // close dialog
          },
        ),
        TextButton(
          child: Text("Delete"),
          onPressed: () {
            context.read<CartPageCubit>().removeItemFromCart(cartId: cartId);
            Navigator.of(context).pop(); // close dialog
          },
        ),
      ],
    );
  }
}
