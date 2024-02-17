import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {

  final int pageIndex;

  static const name = 'home-screen';

  const HomeScreen({super.key, required this.pageIndex});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

//* Este Mixin es necesario para mantener el estado en el PageView
class _HomeScreenState extends ConsumerState<HomeScreen> with AutomaticKeepAliveClientMixin {

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      keepPage: true
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget> [
    HomeView(),
    PopularView(),
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    if ( pageController.hasClients ) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration( milliseconds: 250),
      );
    }

    return Scaffold(
      body: PageView(
        // * Esto evitará que rebote
        // physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        // index: pageIndex,
        children: viewRoutes,
        onPageChanged: (value) => context.go('/home/$value'),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: widget.pageIndex
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
