// ignore_for_file: public_member_api_docs, sort_constructors_first

class ShoesType {
  static const ShoesType all = ShoesType._("all", "All");
  static const ShoesType ultraboost = ShoesType._("Ultraboost", "Ultraboost");
  static const ShoesType adilette = ShoesType._("Adilette", "Adilette");
  static const ShoesType superstars = ShoesType._("Superstars", "Superstars");
  static const ShoesType carbon = ShoesType._("Carbon", "Carbon");
  static const ShoesType coreBlack = ShoesType._("Core black", "Core black");
  static const ShoesType solarRed = ShoesType._("Solar Red", "Solar Red");

  final String name;
  final String filters;

  const ShoesType._(this.name, this.filters);

  static const values = [
    ShoesType.all,
    ShoesType.ultraboost,
    ShoesType.adilette,
    ShoesType.superstars,
    ShoesType.carbon,
    ShoesType.coreBlack,
    ShoesType.solarRed,
  ];
}
