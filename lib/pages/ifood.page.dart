import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class IFoodPage extends StatefulWidget {
  @override
  _IFoodPageState createState() => _IFoodPageState();
}

class _IFoodPageState extends State<IFoodPage> {
  int indexCarousel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: CustomScrollView(
          slivers: [
            buildAppBar(),
            buildFilters(),
            buildTypeFoods(),
            buildCarouselPromotions(),
            buildStores(title: 'Últimas lojas'),
            buildPromotion(),
            buildStores(title: 'Famosos no IFood'),
            buildTypeFoods(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return Text('Teste $index');
                },
                childCount: 150,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.black54,
        elevation: 10,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
            ),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter buildStores({required String title}) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ver mais...',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 115,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 5),
                      child: Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 35,
                            child: FlutterLogo(
                              size: 50,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('Lancheria X'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter buildPromotion() {
    return SliverToBoxAdapter(
      child: Container(
        height: 80,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/ifood-promotion.PNG'),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter buildCarouselPromotions() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 140,
                  disableCenter: true,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      indexCarousel = index;
                    });
                  }),
              items: List.generate(
                5,
                (index) {
                  return Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/ifood.PNG'),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) {
                  return Container(
                    width: 5,
                    height: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 2,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          indexCarousel == index ? Colors.black : Colors.grey,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTypeFoods() {
    return SliverToBoxAdapter(
      child: Container(
        height: 85,
        padding: const EdgeInsets.only(left: 10),
        child: ListView.builder(
          // shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Container(
              width: 90,
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: 30,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.primaries[Random.secure()
                                      .nextInt(Colors.primaries.length)],
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          Center(
                            child: FlutterLogo(
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: FittedBox(
                      child: Text([
                        'Mercado',
                        'Vale-refeição',
                        'Lanches',
                        'Vegetariano',
                        'Brasileira',
                      ][index]),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter buildFilters() {
    return SliverToBoxAdapter(
      child: Container(
        height: 35,
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 15,
          top: 20,
        ),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return false;
          },
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TextButton(
                  child: Row(
                    children: [
                      Text('Ordenar'),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(
                        width: .5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 7,
          ),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'R. Nome da Rua, 000',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.red,
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.qr_code_scanner_outlined,
            color: Colors.red,
          ),
          splashRadius: 25,
          onPressed: () {},
        ),
      ],
      floating: true,
      bottom: buildBottomBar(),
    );
  }

  PreferredSize buildBottomBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          // indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.grey,
          // indicatorColor: Colors.red,
          labelColor: Colors.red,
          isScrollable: true,
          tabs: [
            Align(
              alignment: Alignment.centerLeft,
              child: Tab(
                child: Text(
                  'Restaurantes',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Tab(
                child: Text(
                  'Mercados',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
