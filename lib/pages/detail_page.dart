import 'package:flutter/material.dart';
import 'package:masakan_ala_anak_kos/constants/custom_style.dart';
import 'package:masakan_ala_anak_kos/helper/dimension_helper.dart';
import 'package:masakan_ala_anak_kos/models/resep_masakan.dart';
import 'package:masakan_ala_anak_kos/widgets/custom_app_bar.dart';
import 'package:masakan_ala_anak_kos/widgets/favorite_button.dart';
import 'package:universal_html/html.dart' as html;

class DetailPage extends StatefulWidget {
  static String route = '/detail';
  final ResepMasakan resep;

  const DetailPage({required this.resep});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: widget.resep.name),
        body: getDetailScreen(context, widget.resep),
      ),
    );
  }

  Widget getDetailScreen(BuildContext context, ResepMasakan resep) =>
      DimensionHelper.isWeb(context)
          ? DetailScreenWeb(resep: resep)
          : DetailScreenMobile(resep: resep);
}

class DetailScreenWeb extends StatefulWidget {
  final ResepMasakan resep;

  const DetailScreenWeb({required this.resep});
  @override
  _DetailScreenWebState createState() => _DetailScreenWebState();
}

class _DetailScreenWebState extends State<DetailScreenWeb> {
  ScrollController _verticalScrollController = ScrollController();

  @override
  void dispose() {
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth,
                      height: constraints.maxWidth / 2,
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Hero(
                        tag: widget.resep.id,
                        child: Image.asset(
                          widget.resep.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 15,
                      child: ElevatedButton(
                        child: Text(
                          "Sumber",
                        ),
                        onPressed: () => html.window
                            .open(widget.resep.source, widget.resep.source),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 10,
                      child: FavoriteButton(
                        key: ValueKey(widget.resep.id),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Scrollbar(
                  controller: _verticalScrollController,
                  isAlwaysShown: true,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ListView(
                      controller: _verticalScrollController,
                      children: [
                        Text(
                          'Bahan-bahan',
                          style: kTitleStyle,
                        ),
                        SizedBox(height: 4.0),
                        Text(widget.resep.ingredients),
                        SizedBox(height: 8.0),
                        Text(
                          'Langkah-langkah',
                          style: kTitleStyle,
                        ),
                        SizedBox(height: 4.0),
                        ...widget.resep.steps
                            .asMap()
                            .map((idx, step) => MapEntry(
                                idx,
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text.rich(
                                    TextSpan(
                                      text: '$idx. ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '$step',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                )))
                            .values
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DetailScreenMobile extends StatefulWidget {
  final ResepMasakan resep;

  const DetailScreenMobile({required this.resep});
  @override
  _DetailScreenMobileState createState() => _DetailScreenMobileState();
}

class _DetailScreenMobileState extends State<DetailScreenMobile> {
  ScrollController _verticalScrollController = ScrollController();

  @override
  void dispose() {
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          controller: _verticalScrollController,
          isAlwaysShown: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
            child: ListView(
              controller: _verticalScrollController,
              children: [
                Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth,
                      height: constraints.maxWidth / 2,
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Hero(
                        tag: widget.resep.id,
                        child: Image.asset(
                          widget.resep.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 15,
                      child: ElevatedButton(
                        child: Text(
                          "Sumber",
                        ),
                        onPressed: () => html.window
                            .open(widget.resep.source, widget.resep.source),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      child: FavoriteButton(
                        key: ValueKey(widget.resep.id),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  'Bahan-bahan',
                  style: kTitleStyle,
                ),
                SizedBox(height: 4.0),
                Text(widget.resep.ingredients),
                SizedBox(height: 8.0),
                Text(
                  'Langkah-langkah',
                  style: kTitleStyle,
                ),
                SizedBox(height: 4.0),
                ...widget.resep.steps
                    .asMap()
                    .map((idx, step) => MapEntry(
                        idx,
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text.rich(
                            TextSpan(
                              text: '$idx. ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: '$step',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        )))
                    .values
                    .toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
