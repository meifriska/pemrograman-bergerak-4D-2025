import 'package:flutter/material.dart';
import 'detail_page.dart'; 
import 'tambah_wisata_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar wisata yang akan ditampilkan
  final List<Map<String, String>> hotPlaces = [
    {
      'image': 'assets/images/gambar1.jpeg',
      'title': 'Pulou Kelor ',
      'location': 'Nusa Tenggara Timur',
    },
    {
      'image': 'assets/images/gambar2.jpeg',
      'title': 'Air Terjun Tumpak Sewu',
      'location': 'Jawa Timur',
    },
    {
      'image': 'assets/images/gambar3.jpeg',
      'title': 'Bukit Teletubbies',
      'location': 'Jawa Timur',
    },
    {
      'image': 'assets/images/gambar4.jpeg',
      'title': 'Gunung Prau',
      'location': 'Jawa Tengah',
    },
    {
      'image': 'assets/images/gambar5.jpeg',
      'title': 'Prambanan',
      'location': 'Jogyakarta',
    },
    {
      'image': 'assets/images/gambar6.jpeg',
      'title': 'Borobudur',
      'location': 'Jawa Tengah',
    },
  ];

  final List<Map<String, String>> bestHotels = [
    {
      'image': 'assets/images/gambar1.jpeg',
      'title': 'Pulou Kelor ',
      'desc': 'Pulau Kelor adalah sebuah pulau kecil yang terletak di Kepulauan Seribu, tidak jauh dari pesisir Jakarta. Meskipun ukurannya hanya sekitar 1,5 hektare, pulau ini menyimpan pesona sejarah dan keindahan alam yang unik. Salah satu daya tarik utama Pulau Kelor adalah Benteng Martello, peninggalan kolonial Belanda dari abad ke-17 yang dulunya berfungsi sebagai benteng pertahanan. Pulau ini memiliki pantai berpasir putih, air laut yang jernih, dan suasana yang tenang—cocok untuk liburan singkat, berkemah, atau sekadar menikmati sunset. \n\nKarena lokasinya yang cukup dekat dari Jakarta, Pulau Kelor sering dijadikan destinasi wisata sehari (one day trip), terutama bagi mereka yang ingin melepas penat dari hiruk-pikuk kota. Akses ke Pulau Kelor bisa ditempuh dengan perahu dari Pelabuhan Kali Adem (Muara Angke) atau dari Marina Ancol. ',
    },
    {
      'image': 'assets/images/gambar2.jpeg',
      'title': 'Air Terjun Tumpak Sewu',
      'desc': 'Air Terjun Tumpak Sewu adalah salah satu destinasi wisata alam paling menakjubkan di Indonesia, yang terletak di perbatasan Kabupaten Lumajang dan Malang, Jawa Timur. Nama "Tumpak Sewu" sendiri berarti "seribu air terjun", mengacu pada bentuk aliran airnya yang melebar dan tampak seperti tirai raksasa. Dengan ketinggian sekitar 120 meter, air terjun ini memiliki bentuk setengah melingkar yang unik dan eksotis, menjadikannya salah satu air terjun terindah di Asia Tenggara. Air terjun ini dialiri oleh Sungai Glidik yang berhulu di Gunung Semeru, gunung tertinggi di Pulau Jawa. \n\nPengunjung akan disambut oleh pemandangan hijau nan asri serta udara yang sejuk khas pegunungan. Untuk mencapai dasar air terjun, pengunjung harus menyusuri jalur yang menantang berupa jalan setapak, tangga bambu, dan bebatuan yang licin—namun semuanya akan terbayar dengan panorama luar biasa yang menanti di bawah. ',
    },
    {
      'image': 'assets/images/gambar3.jpeg',
      'title': 'Bukit Teletubbies',
      'desc': 'Bukit Teletubbies adalah destinasi wisata alam yang unik dan memesona, terkenal karena lanskapnya yang menyerupai latar serial anak-anak "Teletubbies". Bukit ini sebenarnya merujuk ke beberapa lokasi di Indonesia, namun yang paling populer terletak di kawasan Gunung Bromo, Jawa Timur. \n\nBukit Teletubbies Bromo menawarkan hamparan perbukitan hijau dengan kontur yang lembut dan bergelombang. Saat musim hujan, bukit ini diselimuti padang rumput yang subur, menciptakan suasana seperti negeri dongeng yang tenang dan fotogenik. Keindahannya sangat cocok untuk bersantai, berfoto, atau sekadar menikmati udara segar khas pegunungan.',
    },
    {
      'image': 'assets/images/gambar4.jpeg',
      'title': 'Gunung Prau',
      'desc': 'Gunung Prau adalah salah satu destinasi pendakian paling populer di Jawa Tengah, terletak di kawasan Dataran Tinggi Dieng. Dengan ketinggian sekitar 2.565 hingga 2.590 meter di atas permukaan laut (mdpl), gunung ini menjadi tapal batas alami antara empat kabupaten: Wonosobo, Temanggung, Kendal, dan Batang .​ \n\nGunung Prau tidak hanya menawarkan keindahan alam, tetapi juga kaya akan nilai budaya dan mitos. Masyarakat setempat meyakini bahwa gunung ini adalah tempat bersemayamnya para dewa, dan sering dikaitkan dengan ritual adat seperti pemotongan rambut gimbal pada anak-anak di kawasan Dieng .​',
    },
    {
      'image': 'assets/images/gambar5.jpeg',
      'title': 'Prambanan',
      'desc': 'Candi Prambanan adalah kompleks candi Hindu terbesar dan termegah di Indonesia, terletak di perbatasan antara Yogyakarta dan Jawa Tengah. Dibangun pada abad ke-9 Masehi, kompleks ini didedikasikan untuk Trimurti—tiga dewa utama dalam agama Hindu: Brahma (pencipta), Vishnu (pemelihara), dan Shiva (perusak). Dari ketiganya, Candi Shiva-lah yang menjadi bangunan utama dan tertinggi, menjulang hingga 47 meter.\n\nKeindahan arsitektur Prambanan terlihat dari susunan candi-candinya yang simetris dan penuh dengan relief cerita Ramayana yang diukir secara rinci di dinding-dindingnya. Tidak hanya sebagai tempat ibadah, Prambanan juga menjadi bukti kejayaan peradaban masa lampau yang kaya akan nilai seni, spiritualitas, dan ilmu pengetahuan.',
    },
    {
      'image': 'assets/images/gambar6.jpeg',
      'title': 'Borobudur',
      'desc': 'Candi Borobudur adalah candi Buddha terbesar di dunia dan salah satu keajaiban arkeologi paling mengesankan yang pernah dibangun oleh manusia. Terletak di Magelang, Jawa Tengah, candi ini didirikan pada abad ke-8 hingga ke-9 Masehi oleh dinasti Syailendra, pada masa kejayaan Kerajaan Mataram Kuno.\n\nCandi ini memiliki struktur megah berupa stupa raksasa bertingkat, yang terdiri dari tiga tingkatan utama: Kamadhatu (alam dunia), Rupadhatu (alam bentuk), dan Arupadhatu (alam tanpa bentuk), melambangkan perjalanan spiritual menuju pencerahan. Di setiap dinding dan pagar langkan, terdapat lebih dari 2.600 panel relief yang menggambarkan kisah-kisah Buddha serta kehidupan masyarakat pada masa itu. Terdapat pula 504 arca Buddha dan 72 stupa berlubang di puncak yang menjadi ikon Borobudur.',
    },
  ];

  // Menambahkan wisata baru ke dalam daftar
  void _addNewWisata(Map<String, String> newWisata) {
    setState(() {
      hotPlaces.add(newWisata);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 220, 220),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hi, Priska", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/gambarA.jpeg"),
                    )
                  ],
                ),
                SizedBox(height: 16),
                // Hot Places Section
                sectionTitle("Places"),
                SizedBox(
                  height: 82,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotPlaces.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12),
                    itemBuilder: (context, index) => hotPlaceCard(context, hotPlaces[index]),
                  ),
                ),
                SizedBox(height: 16),
                // Best Hotels Section
                sectionTitle("Description"),
                ListView.builder(
                  itemCount: hotPlaces.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => bestHotelCard(context, hotPlaces[index]),
                ),
              ],
            ),
          ),
        ),
      ),
      // Floating Action Button untuk tambah wisata
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Arahkan ke halaman TambahWisataPage dan tunggu hasilnya
          final Map<String, String>? newWisata = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahWisataPage()),
          );

          // Jika ada data yang dikembalikan, tambah wisata baru ke dalam list
          if (newWisata != null) {
            _addNewWisata(newWisata);
          }
        },
        backgroundColor: const Color.fromARGB(255, 15, 77, 172),
        child: Icon(Icons.add, color: const Color.fromARGB(255, 255, 255, 255)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("See All", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget hotPlaceCard(BuildContext context, Map<String, String> place) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(place: place),
          ),
        );
      },
      child: Container(
        width: 250,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Tengah secara vertikal
          children: [
            // Gambar kiri
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                place['image'] ?? '',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),    
            SizedBox(width: 10),
            // Tulisan kanan (tengah)
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min, // supaya tinggi sesuai konten
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place['title'] ?? '',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          place['location'] ?? '',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bestHotelCard(BuildContext context, Map<String, String> hotel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(place: hotel),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                hotel['image']!,
                height: 80,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hotel['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(
                    hotel['desc'] ?? 'Deskripsi tidak tersedia',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
