import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:flutter/cupertino.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: RestaurantCard(
          image: Image.network(
            'https://play-lh.googleusercontent.com/iddTHl4b8M22v4AAEE3j-KOunXUjv9l3BYf8C4QbfdnVLVHy-aAuAN1SAGymOmD8wr4',
            fit: BoxFit.cover,
          ),
          name: '삼성생명 더퓨처 퍼펙트 보험 무배당 어쩌구 저쩌구',
          tags: ['보장성', '저축성', '갱신형'],
          ratingCount: 100,
          deliveryTime: 15,
          deliveryFee: 0,
          rating: 4.52,
        ),
      )),
    );
  }
}
