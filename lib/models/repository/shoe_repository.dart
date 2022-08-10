import 'package:shoes_shop/models/shoe.dart';
import 'package:shoes_shop/utils/shoes_type.dart';

class ShoeRepository {
  static List<Shoe> fetchShoes(List<Shoe> shoes, List<ShoesType> filters) {
    bool isAll = filters.contains(ShoesType.all);
    if (isAll) {
      return shoes;
    }
    List<Shoe> fShoes = [];
    for (var shoe in shoes) {
      if (filters.any((filter) => shoe.features.any((feature) =>
          filter.filters.toLowerCase() == feature.toLowerCase()))) {
        fShoes.add(shoe);
      }
    }
    return fShoes;
  }
}
