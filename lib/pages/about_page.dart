import 'package:flutter/material.dart';
import 'package:masakan_ala_anak_kos/helper/dimension_helper.dart';
import 'package:masakan_ala_anak_kos/models/profile.dart';
import 'package:masakan_ala_anak_kos/widgets/custom_app_bar.dart';
import 'package:universal_html/html.dart' as html;

class AboutPage extends StatelessWidget {
  static final String route = '/about';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Tentang', removeActions: true),
        body: DimensionHelper.isWeb(context) ? WebPage() : MobilePage(),
      ),
    );
  }
}

class WebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1300,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(150.0),
              child: Image.asset(
                'images/profile.jpeg',
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: Text.rich(
                      TextSpan(
                        text: 'Johandi Patria',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '. Meskipun memiliki banyak julukan, entitas ini lebih sering dikenal dengan julukan Johan. Telah hidup di Jakarta hampir 2 tahun. Bekerja pada perusahaan penyedia jasa outsource. Ditempatkan sebagai Android Developer dengan bahasa pemrograman Kotlin. Tidak hanya Kotlin, beberapa bahasa pemrograman juga dipelajari oleh entitas ini. C untuk Arduino, Python untuk Artificial Intelligence, dan Flutter untuk membuat project ini. Hingga sekarang, entitas ini masih terus mengembangkan skill coding.',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: profileList.map((profile) {
                        return IconButton(
                          iconSize: 50.0,
                          splashRadius: 25.0,
                          icon: Image.network(
                            profile.imageUrl,
                            fit: BoxFit.cover,
                          ),
                          onPressed: () =>
                              html.window.open(profile.url, profile.url),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150.0),
              child: Image.asset(
                'images/profile.jpeg',
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            child: Text.rich(
              TextSpan(
                text: 'Johandi Patria',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                children: [
                  TextSpan(
                    text:
                        '. Meskipun memiliki banyak julukan, entitas ini lebih sering dikenal dengan julukan Johan. Telah hidup di Jakarta hampir 2 tahun. Bekerja pada perusahaan penyedia jasa outsource. Ditempatkan sebagai Android Developer dengan bahasa pemrograman Kotlin. Tidak hanya Kotlin, beberapa bahasa pemrograman juga dipelajari oleh entitas ini. C untuk Arduino, Python untuk Artificial Intelligence, dan Flutter untuk membuat project ini. Hingga sekarang, entitas ini masih terus mengembangkan skill coding.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 40.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: profileList.map((profile) {
                return IconButton(
                  splashRadius: 20.0,
                  icon: Image.network(
                    profile.imageUrl,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () => html.window.open(profile.url, profile.url),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
