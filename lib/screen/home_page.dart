import 'package:shoes_shop/models/repository/shoe_repository.dart';
import 'package:shoes_shop/models/shoe.dart';
import 'package:shoes_shop/utils/random_color.dart';
import 'package:shoes_shop/utils/shoes.dart';
import 'package:shoes_shop/utils/shoes_type.dart';
import 'package:shoes_shop/widgets/search_action.dart';
import 'package:shoes_shop/widgets/shoes_option.dart';
import 'package:shoes_shop/widgets/shoes_thumbnail.dart';
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shoe> shoes = Shoes.shoes;
  List<ShoesType> filterOptions = [ShoesType.all];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: homeFloatingButton(),
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeShoesThumbnails(),
            homeOptionsCounter(),
            homeOptionList(),
          ],
        ),
      ),
    );
  }

  Widget homeShoesThumbnails() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Shoes.shoes.map((shoe) {
          return ShoesThumbnail(
            shoe: shoe,
            backgroundColor: RandomColor.listRandom(),
          );
        }).toList(),
      ),
    );
  }

  Widget homeOptionsCounter() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        "${shoes.length} OPTIONS",
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          color: Color.fromARGB(255, 105, 105, 105),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  Widget homeOptionList() {
    return Column(
      children: shoes.map((shoe) => ShoesOption(shoe: shoe)).toList(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 77,
      leadingWidth: 100,
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Shoes",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
            showSearch(context: context, delegate: SearchAction());
          },
        ),
      ],
      bottom: buildAppBarBottom(),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  PreferredSizeWidget buildAppBarBottom() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ShoesType.values.map((filter) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FilterChip(
                label: SizedBox(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      filter.name.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                selected: filterOptions.contains(filter),
                onSelected: (isSelected) {
                  setState(() {
                    if (isSelected) {
                      filterOptions.add(filter);
                    } else {
                      filterOptions.remove(filter);
                    }
                    shoes =
                        ShoeRepository.fetchShoes(Shoes.shoes, filterOptions);
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                pressElevation: 0,
                selectedColor: const Color.fromARGB(255, 87, 87, 87),
                backgroundColor: const Color.fromARGB(255, 186, 186, 186),
                showCheckmark: false,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  FloatingActionButton homeFloatingButton() {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 0,
      highlightElevation: 0,
      backgroundColor: Colors.transparent,
      child: const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
    );
  }
}
