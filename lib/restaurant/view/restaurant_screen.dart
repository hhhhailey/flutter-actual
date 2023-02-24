import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../common/const/data.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Future<List> paginateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get('http://$ip/restaurant',
        options: Options(headers: {
          'authorization': 'Bearer $accessToken',
        }));

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder(
                future: paginateRestaurant(),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  // print(snapshot.error);
                  // print(snapshot.data);
                  return RestaurantCard(
                    image: Image.network(
                      'https://play-lh.googleusercontent.com/iddTHl4b8M22v4AAEE3j-KOunXUjv9l3BYf8C4QbfdnVLVHy-aAuAN1SAGymOmD8wr4',
                      fit: BoxFit.cover,
                    ),
                    name: '삼성생명 더퓨처 퍼펙트 보험 무배당 어쩌구 저쩌구',
                    tags: ['보장성', '저축성', '갱신형'],
                    ratingsCount: 100,
                    deliveryTime: 15,
                    deliveryFee: 0,
                    ratings: 4.52,
                  );
                },
              ))),
    );
  }
}
