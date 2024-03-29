import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:flutter/material.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                height: 400,
                width: 315,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: lightWhite,
                    boxShadow: boxShadow),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 310,
                          width: 315,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24)),
                            child: Image.asset(
                              "assets/images/news2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: purpleColor,
                                    fixedSize: const Size(24, 24),
                                    shape: const CircleBorder()),
                                child: const Icon(
                                  Icons.close,
                                  color: whiteColor,
                                )))
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          right: 16,
                          left: 16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hebat! Ini Brand Kecantikan Lokal yang Sudah Go International",
                              style: semiBold(
                                sizeFont: 14,
                                colorFont: blackColor,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "By: Aurelia Sukianto     |   11-07-2022",
                              style: reguler(
                                sizeFont: 10,
                                colorFont: blackColor,
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  """
Di tengah gejolak industri kecantikan global, ada satu cerita sukses dari tanah air yang perlu kita kenal. Brand kecantikan lokal, "NaturiBeauty," telah mencapai prestasi luar biasa dengan sukses go international, menarik perhatian pasar global dengan produk-produknya yang inovatif.\n\n"NaturiBeauty" yang berdiri di Surabaya beberapa tahun yang lalu dengan visi untuk menghadirkan kecantikan yang ramah lingkungan dan berkualitas tinggi kini telah melampaui batas-batas nasional.\n\nProduk-produk mereka yang berfokus pada bahan alami dan kemasan ramah lingkungan telah mendapatkan pengakuan di seluruh dunia. Dengan filosofi "Kecantikan yang Meresap dari Alam," "NaturiBeauty" telah berhasil membangun jaringan pelanggan yang kuat di berbagai negara. Mereka telah menerima penghargaan dan pujian dalam berbagai platform industri kecantikan, yang menjadikan mereka sebagai salah satu pemain utama dalam permainan global.\n\nCEO "Nina Wijaya," yang juga pendiri "NaturiBeauty," menyatakan, "Kami sangat bersyukur atas dukungan yang kami terima dari pelanggan kami di seluruh dunia. Ini adalah pencapaian yang luar biasa untuk tim kami dan juga untuk Indonesia sebagai negara penghasil produk kecantikan yang berkualitas tinggi." Kehadiran "NaturiBeauty" di pasar global bukan hanya tentang produk, tetapi juga tentang nilai-nilai yang mereka bawa. Mereka telah aktif berpartisipasi dalam inisiatif keberlanjutan dan memberikan kontribusi positif pada komunitas lokal di mana mereka beroperasi.\n\nDengan prestasi internasional mereka, "NaturiBeauty" membuktikan bahwa brand kecantikan lokal juga dapat bersaing dan menjadi pemimpin dalam panggung global. Keberhasilan mereka adalah inspirasi bagi brand-brand lokal lainnya untuk bermimpi lebih besar dan berani melangkah ke panggung dunia.
""",
                  style: reguler(
                    sizeFont: 14,
                    colorFont: blackColor,
                  ),
                  softWrap: true,
                  maxLines: null,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
