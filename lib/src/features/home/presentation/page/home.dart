import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jdphotomap/src/features/app/presentation/cubit/app_cubit.dart';
import 'package:jdphotomap/src/injection/injection.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = <String>[
      'Fotografía de aniversario',
      'Fotografía de cumpleaños',
      'Fotografía de bodas',
      'Fotografía pre-boda',
    ];

    final List<String> icons = <String>[
      'assets/images/logo1.png',
      'assets/images/birthday.jpg',
      'assets/images/wedding.jpg',
      'assets/images/prewedding.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ubicación actual',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              'New York, USA',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: const <Widget>[
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Qué estás buscando',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
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
                Text('Ver todo', style: TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 70,
                          height: 70,
                          color: Colors.grey.shade300,
                          child: Image.asset(
                            icons[index],
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) =>
                                const Icon(Icons.image_not_supported),
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
                child: Image.asset(
                  'assets/images/logo1.png',
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const Center(
                    child: Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
              ),
            ),
          Text(sl<AppCubit>().state.user?.email ?? 'No user logged in'),
            ElevatedButton(
              onPressed: () {
                sl<AppCubit>().signOut();
              },
              child: const Text('cerrar sesión'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        currentIndex:
            0, // Asegúrate de usar este valor dinámicamente si quieres cambiar la pestaña activa
        onTap: (int index) {
          switch (index) {
            case 0:
              context.go('/welcome'); // 🚀 Cambia a la ruta que necesites
              break;
            case 1:
              // Aquí podrías hacer otra navegación

              break;
            case 2:
              // Navegar a galería
              break;
            case 3:
              context.push('/photographer_profile');
              // Navegar al perfil
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.calendar),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Photos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
