import 'package:flutter/material.dart';
import 'package:masakan_ala_anak_kos/notifiers/favorite_notifier.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id = (this.key as ValueKey<String>).value;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) => ScaleTransition(
        child: child,
        scale: animation,
      ),
      child: context.watch<FavoriteNotifier>().getFavorites.contains(id)
          ? FavoriteIcon(
              key: Key('true'),
              isFavorite: true,
              callback: () {
                context.read<FavoriteNotifier>().removeFavorite(id);
              },
            )
          : FavoriteIcon(
              key: Key('false'),
              isFavorite: false,
              callback: () {
                context.read<FavoriteNotifier>().addFavorite(id);
              },
            ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback callback;

  const FavoriteIcon(
      {required Key key, required this.isFavorite, required this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: callback,
    );
  }
}
