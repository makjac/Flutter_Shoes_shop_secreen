// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shoes_shop/models/shoe.dart';

class ShoesOption extends StatelessWidget {
  final Shoe shoe;
  const ShoesOption({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            optionImage(),
            const SizedBox(width: 20),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    optionTitle(),
                    const SizedBox(height: 5),
                    optionDetails(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget optionImage() {
    return Expanded(
      flex: 2,
      child: Image.network(
        shoe.shoeProfileImg,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget optionTitle() {
    return Text(
      shoe.featuresToString(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget optionDetails() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            children: [
              const Icon(
                Icons.call_missed_outgoing,
                size: 20,
              ),
              Text(
                "${shoe.number}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            "\$ ${shoe.price}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
