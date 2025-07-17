import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jdphotomap/src/core/constants/constants.dart';
import 'package:jdphotomap/src/features/home/presentation/widgets/current_user_location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> categories = <String>[
    'Fotografía de aniversario',
    'Fotografía de cumpleaños',
    'Fotografía de bodas',
    'Fotografía pre-boda',
  ];

  final List<String> icons = <String>[
    'https://vilaplana.com/wp-content/uploads/2022/06/DX1wpWnWkAALXol-1030x773.jpeg',
    'https://cdn.aarp.net/content/dam/aarpe/es/home/hogar-familia/familia-bienestar/info-2022/consejos-para-organizar-fiesta-de-cumpleanos/_jcr_content/root/container_main/container_body_main/container_body1/container_body_cf/container_image/articlecontentfragment/cfimage.coreimg.50.932.jpeg/content/dam/aarp/home-and-family/family-and-friends/2022/03/1140-birthday-cake-with-candles-esp.jpg',
    'https://photobymaug.com/wp-content/uploads/2021/01/Fotografo-de-Bodas-Cuantas-Horas-de-Cobertura-Necesito-para-mi-boda-Mauricio-Urena-Photography-1.jpg',
    'https://cdn0.matrimonios.cl/article-vendor/7439/original/1280/jpg/lente-35-111_8_127439-165819308769218.webp',
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          centerTitle: true,
          title: CurrentUserLocation(),
        ),
        SliverPadding(
          padding: Constants.contentPadding,
          sliver: SliverList.list(
            children: <Widget>[
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Qué estás buscando',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Explora nuestros servicios',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Ver todo',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 70,
                            height: 70,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: CachedNetworkImage(
                              imageUrl: icons[index],
                              progressIndicatorBuilder:
                                  (
                                    BuildContext context,
                                    String url,
                                    DownloadProgress progress,
                                  ) => Center(
                                    child: CircularProgressIndicator(
                                      value: progress.progress,
                                    ),
                                  ),

                              fit: BoxFit.cover,
                              errorWidget:
                                  (
                                    BuildContext context,
                                    String url,
                                    Object error,
                                  ) => const Icon(Icons.image_not_supported),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: 80,
                          child: Text(
                            categories[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 180,
                  color: Colors.grey.shade300,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://www.uauu.cat/wp-content/uploads/2024/04/tips-votos-boda.jpg',
                    fit: BoxFit.cover,
                    placeholder: (BuildContext context, String url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (BuildContext context, String url, Object error) =>
                            const Center(
                              child: Icon(Icons.image_not_supported, size: 50),
                            ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
