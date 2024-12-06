import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class KaloriTakibi extends StatelessWidget {
  const KaloriTakibi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 28, 28),
      appBar: AppBar(
        title: const Text('Kalori Takibi'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
      ),

      // Body içerik
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Ekranı yukarı ve aşağıya böler
        children: [
          // Diğer içerikler burada olabilir (Animasyon vs.)
          Expanded(
            child: Center(
              child: DotLottieLoader.fromAsset(
                "assets/motions/yemek.lottie", // Lottie animasyonu
                frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                  if (dotlottie != null) {
                    return Lottie.memory(dotlottie.animations.values.single);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),

          // Ekranın alt kısmına yazı ekleyebilirsiniz
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bugün 2500 KCAL BESLENDINIZ. KALAN 400 KCAL .', // Burada istediğiniz metni yazabilirsiniz
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Yazıyı ortalayacak
            ),
          ),
        ],
      ),
    );
  }
}
