import 'package:flutter/material.dart';
import 'package:odev6/app_theme.dart';
import 'package:odev6/data/entity/category_model.dart';
import 'package:odev6/data/repo/campaigns_repo.dart';
import 'package:odev6/data/repo/product_repo.dart';
import 'package:odev6/extansions/build_context_Extansion.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  final Color appColor = AppColor.primaryColor;
  final List<String> campaigns = CampaignsRepo().getCampaigns();
  final List<Category> categories = CategoriesRepo().getCategories();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: context.height * 0.15,
            width: context.width,
            color: appColor,
            child: Column(
              children: [
                buildTopWidgets(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                height: context.height * 0.82,
                width: context.width,
                color: Colors.white,
                child: Column(
                  children: [
                    buildShopInfoText(),
                    buildCampaigns(context),
                    buildIndexViewer(context),
                    buildCategoriesList()
                  ],
                ),
              ),
            ),
          ),
          buildSearchTextField(),
        ],
      ),
    );
  }

  Padding buildTopWidgets() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 23, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 13,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                color: appColor,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 30,
                width: 160,
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "15 - 20 dakika içinde",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              )
            ],
          ),
          const Spacer(),
          CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite_border_outlined,
                color: appColor,
              )),
        ],
      ),
    );
  }

  Container buildSearchTextField() {
    return Container(
      margin: const EdgeInsets.only(top: 75, left: 10, right: 10),
      height: 55,
      child: Card(
        elevation: 2,
        child: TextField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Ürün veya Kategori Ara',
              hintStyle: const TextStyle(fontSize: 13),
              prefixText: ' ',
              prefixIcon: Icon(
                Icons.search,
                color: appColor,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            )),
      ),
    );
  }

  Padding buildShopInfoText() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 16, top: 15),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: appColor,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Mağaza Bilgileri",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
          ),
          const Spacer(),
          Text(
            "Görüntüle",
            style: TextStyle(
                color: appColor, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  SizedBox buildCampaigns(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 175,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          index = value;
          setState(() {});
        },
        itemCount: campaigns.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            campaigns[i],
                          ),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox buildIndexViewer(BuildContext context) {
    return SizedBox(
      height: 10,
      width: context.width,
      child: Row(
        children: [
          const Spacer(),
          Flexible(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: campaigns.length,
              itemBuilder: (context, i) {
                return Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: index == i ? appColor : Colors.grey,
                  ),
                );
              },
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }

  Flexible buildCategoriesList() {
    return Flexible(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 75,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(categories[index].image),
                    ),
                    borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  categories[index].name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
