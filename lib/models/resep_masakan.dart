class ResepMasakan {
  String id;
  String name;
  String ingredients;
  List<String> steps;
  String source;
  String imageAsset;

  ResepMasakan({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.steps,
    required this.source,
    required this.imageAsset,
  });
}

final List<ResepMasakan> resepMasakanList = [
  ResepMasakan(
    id: '0001',
    name: 'Nasi Goreng',
    ingredients: '''3 porsi nasi putih
3 butir telur

Bahan Iris :
5 siung bawang putih, cincang
3 siung bawang merah, iris tipis
15 lembar daun jeruk, iris tipis
4 buah cabai merah keriting, iris kecil
5 buah cabai rawit merah, iris kecil

Bumbu Penyedap :
1 sdm garam
1 sdm masako
1/2 sdm gula pasir
1/2 sdm merica bubuk''',
    steps: [
      'Siapkan bahan.',
      'Masak orak arik telur, lalu sisihkan ke pinggir wajan. Tambahkan minyak, lalu tumis bawang merah dan bawang putih hingga harum.',
      'Kemudian masukkan daun jeruk dan cabai²an. Masak hingga daun layu dan aduk rata.',
      'Masukkan nasi dan bumbu penyedap. Aduk rata dan koreksi rasa. Nasi goreng siap disajikan.',
    ],
    source:
        'https://cookpad.com/id/resep/14084371-nasi-goreng-daun-jeruk-anak-kost-masuk',
    imageAsset: 'images/nasi_goreng.webp',
  ),
  ResepMasakan(
    id: '0002',
    name: 'Ifumi',
    ingredients: '''1 bungkus mie goreng instant (me: indomie goreng)
Sayur / toping sesuai selera (me: wortel,telur,sawi putih, baso)
secukupnya Minyak goreng''',
    steps: [
      'Rebus mie instant, jangan terlalu matang. Asal lunak saja kurang lebih 1 menit. Tiriskan.',
      'Panaskan minyak goreng, goreng mie instant dengan api kecil sampai kering.',
      'Siapkan bahan-bahan toping potong-potong sesuai selera',
      'Tumis toping, tambahkan bumbu-bumbu mie instant, tambahkan air sedikit. Masak hingga sayuran lunak.',
      'Tuangkan toping yang sudah dimasak ke atas mie instant yang sudah digoreng kering.',
      'Voilaaa ifumi lezat siap dinikmati.',
    ],
    source:
        'https://cookpad.com/id/resep/13684247-ifumi-simple-mi-instant-ala-anak-kost-3-bahan',
    imageAsset: 'images/ifumi.webp',
  ),
  ResepMasakan(
    id: '0003',
    name: 'Nugget Ayam Wortel',
    ingredients: '''Ayam dada
3 buah wortel
1 butir telur
3 siung bawang putih
5 sdm tepung terigu
3 sdm tepung tapioka
1 sdt baking powder (optional)
Garam dan royco
Bumbu celup :
3 sdm Tepung maizena
1 butir telur (skip)
Sedikit air
tepung panir''',
    steps: [
      'Siapkan semua bahan',
      'Parut wortel, giling ayam menggunakan blender mini, haluskan bawang putih',
      'Campurkan telur, baking powder dan tepung aduk rata, lalu taruh di wadah yg sudah di alasi plastik bawahnya',
      'Panaskan panci lalu masukan nugget ayam selama -+ 25 menit',
      'Setelah matang, tunggu hingga dingin, lalu potong2 sesuai selera, siapkan bahan celup masukan satu persatu',
      'Boleh simpan dalam kulkas',
      'Lalu goreng di minyak panas dengan api kecil, nugget ayam siap di sajikan 😊',
    ],
    source:
        'https://cookpad.com/id/resep/7851982-nugget-ayam-wortel-ala-anak-kos',
    imageAsset: 'images/nugget_ayam_wortel.webp',
  ),
  ResepMasakan(
    id: '0004',
    name: 'Bubur',
    ingredients: '''4 genggam beras
150 gr paha atas ayam
750 ml air
1 ikat bayam
1 buah wortel
2 lembar daun salam
1 siung bawang putih
secukupnya Garam
secukupnya Kaldu jamur totole''',
    steps: [
      'Potong ayam, wortel dan bayam, cuci bersih semua bahan.',
      'Rebus ayam, untuk membuat kaldu.',
      'Masukan beras, daun salam, air kaldu dan ayamnya. Posisi magiccom dalam cook seperti menanak nasi biasa',
      'Sekitar 15 menit buka magicom masukan wortel, garam dan totolenya koreksi rasa. 30 menit kemudian masukkan bayam sambil aduk terus',
      'Aduk bubur sampai mendapat tekstur yang di inginkan jika mau bubur yang lebih halus tambahkan air aduk sampai tekstur yang di inginkan.',
      'Jika sudah mendapatkan tekstur yang di inginkan posisi kan pada warm untuk tetap menghangatkan bubur, siap disajikan',
    ],
    source: 'https://cookpad.com/id/resep/11648138-4bubur-ala-anak-kos',
    imageAsset: 'images/bubur.webp',
  ),
  ResepMasakan(
    id: '0005',
    name: 'Sawi Bakso',
    ingredients: '''1 ikat sayur sawi hijau
10 biji bakso daging
1 siung bawang putih
2 siung bawang merah
2 buah cabai rawit
Secukupnya lada, penyedap rasa, garam dan gula
Secukupnya minyak goreng
Secukupnya air''',
    steps: [
      'Potong sawi lali cuci sampai bersih',
      'Potong bakso menjadi 3 bagian',
      'Kupas bawang putih dan bawang merah lalu cuci bersih bersama cabai rawit, kemudian iris tipis',
      'Panaskan sedikit minyak dengan menggunakan api sedang, tumis bawang putih, bawang merah dan cabai rawit hingga harum',
      'Masukkan potongan bakso lalu tumis sebentar',
      'Masukkan sayur sawi tumis hingga layu',
      'Tambahkan air secukupnya, kemudian tambahkan lada, penyedap rasa, garam dan gula secukupnya',
      'Aduk hingga rata dan koreksi rasa',
      'Makanan siap dihidangkan',
    ],
    source:
        'https://cookpad.com/id/resep/13613397-sawi-bakso-kuah-simpel-ala-anak-kos',
    imageAsset: 'images/sawi_bakso.webp',
  ),
  ResepMasakan(
    id: '0006',
    name: 'Nasi Goreng Rendang',
    ingredients: '''sepiring Nasi
Rendang sepotong sesuai selera
2 bawang merah
2 bawang putih
sesuai selera Cabe rawit/merah
Timun (jika ada)
Lada
Garam
Penyedap rasa
Kecap''',
    steps: [
      'Potong bawang putih, bawang merah dan cabe. Lalu tumis bahan hingga harum',
      'Jika sudah harus aromanya, masukan nasi. Aduh hingga rata lalu masukan lada, garam dan penyedap rasa.',
      'Setelah nasi dirasa hampir matang dan rasa sudah pas masukan rendang dengan bumbunya yang daging rendangnya sudah dipotong menjadi bagian2 kecil. Masukan kecap (jika suka). Tunggu hingga bumbu rendang merata lalu selesai.',
      'Selamat mencoba 🙏',
    ],
    source:
        'https://cookpad.com/id/resep/14148313-25-nasi-goreng-rendang-nasi-goreng-ala-anak-kost',
    imageAsset: 'images/nasi_goreng_rendang.webp',
  ),
  ResepMasakan(
    id: '0007',
    name: 'Gulai Ikan',
    ingredients: '''2 ekor Ikan sale
8 buah Cabai rawit
4 siung Bawang merah
1 siung Bawang putih
1 buah Tomat kecil
1 kotak Santan
secukupnya Kunyit bubuk
Garam
Totole
''',
    steps: [
      'Siapkan bahan2 yg diperlukan. Di sini saya memakai bahan2 instan seperti kunyit bubuk, santan kemasan, dan cabai goreng yang memang digunakan sebagai stock harian biar proses memasak bisa lebih cepat. Maklum anak kosan mengutamakan cepat dan enak, hehehe..',
      'Resep bumbu halusnya terdiri dari cabai rawit 8 buah, tomat kecil 1 buah, bawang merah 4 siung, bawang putih 1 siung. Haluskan semuanya, lebih bagus lagi ditambahkan jahe. Tapi tanpa jahe pun tetap enak kok. Kemudian goreng/tumis bumbu halus hingga wangi.',
      'Kemudian tambahkan santan secukupnya sesuai selera. Karna saya suka banyak kuah saya masukkan 1 kotak santan (ukuran 125 ml kalo gak salah). Jangan lupa masukkan juga kunyit 1 sdt dan aduk2.',
      'Setelah agak mendidih, masukkan ikan sale yang sudah dicuci bersih terlebih dahulu. Aduk perlahan agar santan tidak pecah.',
      'Koreksi masakan dengan garam dan totole sesuai selera. Masak selama kurang lebih 30 menit, jangan sampai ikannya hancur.',
      'Masakan siap dihidangkan!',
    ],
    source:
        'https://cookpad.com/id/resep/14581730-gulai-ikan-sale-simpel-ala-anak-kos',
    imageAsset: 'images/gulai_ikan.webp',
  ),
  ResepMasakan(
    id: '0008',
    name: 'Sate Taichan',
    ingredients: '''1/2 kg dada ayam
Bumbu marinasi ayam
Garam
Lada
Minyak wijen (boleh skip)
Bawang putih powder atau uleg (bebas)
Sambal
Cabe rawit (sesuai selera)
1-2 biji cabe merah besar
2-3 siung Bawang putih
1-2 siung bawang merah
Garam (sesuai selera)
Gula (sesuai selera)
Kaldu bubuk (sesuai selera)
Jeruk nipis (sesuai selera)''',
    steps: [
      'Fillet ayam lalu potong dadu',
      'Marinasi ayam dengan bumbu-bumbu (garam, lada, bawang putih powder, minyak wijen) selama kurleb 30 menit',
      'Tusuk tusuk ayam yang sudah dimarinasi dengan tusuk sate kemudian panggang menggunakan teflon atau pemanggang',
      'Kemudian setelah itu rebus bawang putih, cabe rawit, cabe merah besar, bawang merah kurleb 2-3 menit',
      'Haluskan bahan yang direbus tadi (boleh diblender atau diuleg) Tambahkan garam, gula, kaldu bubuk, dan jeruk nipis',
      'Tumis sambal yang sudah dihaluskan tadi dengan sedikit minyak, kemudian tambahkan air sisa rebusan cabe sesuai selera',
      'Koreksi rasa, kemudian sajikan🤍',
    ],
    source: 'https://cookpad.com/id/resep/14146878-sate-taichan-anak-kos',
    imageAsset: 'images/sate_taichan.webp',
  ),
];
