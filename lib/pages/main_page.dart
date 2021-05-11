import 'package:flutter/material.dart';
import 'package:masakan_ala_anak_kos/helper/dimension_helper.dart';
import 'package:masakan_ala_anak_kos/models/resep_masakan.dart';
import 'package:masakan_ala_anak_kos/pages/detail_page.dart';
import 'package:masakan_ala_anak_kos/widgets/custom_app_bar.dart';
import 'package:masakan_ala_anak_kos/widgets/favorite_button.dart';

class MainPage extends StatelessWidget {
  static final String route = '/main';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Masakan Ala Anak Kost'),
        body: getMainScreen(context),
      ),
    );
  }

  Widget getMainScreen(BuildContext context) {
    switch (DimensionHelper.getScreenSize(context)) {
      case ScreenSize.large:
        return MainScreenMedium(
          gridCount: 6,
        );
      case ScreenSize.medium:
        return MainScreenMedium(
          gridCount: 4,
        );
      default:
        return MainScreenSmall();
    }
  }
}

class MainScreenMedium extends StatelessWidget {
  final int gridCount;

  const MainScreenMedium({this.gridCount = 4});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          childAspectRatio: 0.8,
          crossAxisCount: gridCount,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: resepMasakanList.map((resep) {
            return LayoutBuilder(builder: (context, constraints) {
              return InkWell(
                borderRadius: BorderRadius.circular(10.0),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(resep: resep),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxWidth,
                            child: Hero(
                              tag: resep.id,
                              child: Image.asset(
                                resep.imageAsset,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                resep.name,
                                style: TextStyle(
                                  fontFamily: 'Oxygen',
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: FavoriteButton(
                          key: ValueKey(resep.id),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }).toList(),
        ),
      ),
    );
  }
}

class MainScreenSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          childAspectRatio: 2.5,
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: resepMasakanList.map((resep) {
            return LayoutBuilder(builder: (context, constraints) {
              return InkWell(
                borderRadius: BorderRadius.circular(10.0),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(resep: resep),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: constraints.maxHeight,
                              height: constraints.maxHeight,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Hero(
                                  tag: resep.id,
                                  child: Image.asset(
                                    resep.imageAsset,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Expanded(
                              child: Text(
                                resep.name,
                                style: TextStyle(
                                  fontFamily: 'Oxygen',
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: FavoriteButton(
                            key: ValueKey(resep.id),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          }).toList(),
        ),
      ),
    );
  }
}
