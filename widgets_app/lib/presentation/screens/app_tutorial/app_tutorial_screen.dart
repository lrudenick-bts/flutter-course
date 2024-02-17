import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);

}

final slides = <SlideInfo>[
  SlideInfo('Search for food', 'Aliquip cupidatat veniam dolor ipsum magna occaecat sunt laborum do.', 'assets/images/1.png'),
  SlideInfo('Fast delivery', 'Pariatur ut voluptate aliquip ad irure dolore laboris deserunt ex sit adipisicing.', 'assets/images/2.png'),
  SlideInfo('Enjoy your meal', 'Sint commodo laboris amet cupidatat velit.', 'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final pageController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if(!endReached && page > slides.length - 1.5) {
        endReached = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: 
              slides.map(
                (slideInfo) => _Slide(
                  title: slideInfo.title,
                  caption: slideInfo.caption,
                  imageUrl: slideInfo.imageUrl,
                )
              ).toList()
            ,
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () => context.pop(),
            )
          ),

          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              duration: const Duration(seconds: 1),
              child: FilledButton(
                child: const Text('Start'),
                onPressed: () => context.pop(),
              ),
            )
          ) : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}