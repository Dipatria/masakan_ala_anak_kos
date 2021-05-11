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
          ? FavoritedIcon(callback: () {
              context.read<FavoriteNotifier>().removeFavorite(id);
            })
          : UnfavoritedIcon(callback: () {
              context.read<FavoriteNotifier>().addFavorite(id);
            }),
    );
  }
}

// class FavouriteButton extends StatefulWidget {
//   const FavouriteButton({required Key key}) : super(key: key);

//   @override
//   _FavouriteButtonState createState() => _FavouriteButtonState();
// }

// class _FavouriteButtonState extends State<FavouriteButton> {
//   late Widget _icon;
//   late String id;

//   @override
//   void initState() {
//     id = (widget.key as ValueKey<String>).value;
//     super.initState();
//   }

//   void toggleFavorite() => setState(() {
//         context.read<FavoriteNotifier>().getFavorites.contains(id)
//             ? context.read<FavoriteNotifier>().removeFavorite(id)
//             : context.read<FavoriteNotifier>().addFavorite(id);
//       });

//   @override
//   Widget build(BuildContext context) {
//     _icon = context.watch<FavoriteNotifier>().getFavorites.contains(id)
//         ? FavoritedIcon(callback: toggleFavorite)
//         : UnfavoritedIcon(callback: toggleFavorite);

//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 500),
//       transitionBuilder: (child, animation) => ScaleTransition(
//         child: child,
//         scale: animation,
//       ),
//       child: _icon,
//     );
//   }
// }

class FavoritedIcon extends StatelessWidget {
  final VoidCallback callback;

  const FavoritedIcon({required this.callback});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      icon: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      onPressed: callback,
    );
  }
}

class UnfavoritedIcon extends StatelessWidget {
  final VoidCallback callback;

  const UnfavoritedIcon({required this.callback});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      icon: Icon(
        Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: callback,
    );
  }
}
