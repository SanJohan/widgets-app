import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);

}


final slide = <SlideInfo>[
    SlideInfo('Busca la comida', 'Culpa mollit proident amet cillum enim mollit laboris esse esse consequat.', 'assets/Images/1.png'),
    SlideInfo('Entrega rápida', 'Culpa mollit proident amet cillum enim mollit laboris esse esse consequat.', 'assets/Images/2.png'),
    SlideInfo('Disfruta la comida', 'Culpa mollit proident amet cillum enim mollit laboris esse esse consequat.', 'assets/Images/3.png'),
];


class AppTutorialScreen extends StatefulWidget {

  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageviewController.addListener(() {

      final page = pageviewController.page ?? 0;

      if(!endReached && page >= (slide.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }

      //print('${pageviewController.page}');
    },);
  }


  @override
  void dispose() {
    pageviewController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slide.map(
              (slideData) => _Slide(title: slideData.title, caption: slideData.caption, imageUrl: slideData.imageUrl)
            ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),

          endReached ?
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Comenzar'),
                ),
              ),
            ) : const SizedBox(),

          
        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({required this.title, required this.caption, required this.imageUrl});


  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10,),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),
    );
  }
}