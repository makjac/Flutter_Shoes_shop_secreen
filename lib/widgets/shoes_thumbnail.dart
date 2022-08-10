// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:shoes_shop/models/shoe.dart';

class ShoesThumbnail extends StatelessWidget {
  final Shoe shoe;
  Color? backgroundColor = Colors.deepOrange;
  ShoesThumbnail({
    Key? key,
    required this.shoe,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 310,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20)),
            height: 300,
            width: 280,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thumbnailHeader(),
                  const SizedBox(height: 10),
                  thumbnailNumber(),
                  const SizedBox(height: 5),
                  thumbnailBody(),
                ],
              ),
            ),
          ),
          thumbnailImage(),
        ],
      ),
    );
  }

  //Header: title, rating stars, features
  Widget thumbnailHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                shoe.title.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            RatingBar(
              initialRating: shoe.rating,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 12,
              glow: false,
              ignoreGestures: true,
              ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 10,
                ),
                half: const Icon(
                  Icons.star_half,
                  color: Colors.white,
                  size: 10,
                ),
                empty: const Icon(
                  Icons.star_border,
                  color: Colors.white,
                  size: 10,
                ),
              ),
              onRatingUpdate: (value) {},
            )
          ],
        ),
        Text(
          shoe.featuresToString(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget thumbnailNumber() {
    return Row(
      children: [
        const Icon(
          Icons.call_missed_outgoing,
          size: 15,
        ),
        Text(
          shoe.number.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  //Body: line, price
  Widget thumbnailBody() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 7),
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
        //PRICE
        child: Container(
          margin: const EdgeInsets.only(top: 35, left: 5),
          child: Text(
            "\$ ${shoe.price}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }

  Widget thumbnailImage() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        margin: const EdgeInsets.only(top: 50, left: 30),
        width: 280,
        height: 260,
        child: Image.network(
          shoe.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
