class LivePriceModel {
  List<LivePrices>? livePrices;
  Margins? margins;

  LivePriceModel({this.livePrices, this.margins});

  LivePriceModel.fromJson(Map<String, dynamic> json) {
    if (json['live_prices'] != null) {
      livePrices = <LivePrices>[];
      json['live_prices'].forEach((v) {
        livePrices!.add(new LivePrices.fromJson(v));
      });
    }
    margins =
    json['margins'] != null ? new Margins.fromJson(json['margins']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.livePrices != null) {
      data['live_prices'] = this.livePrices!.map((v) => v.toJson()).toList();
    }
    if (this.margins != null) {
      data['margins'] = this.margins!.toJson();
    }
    return data;
  }
}

class LivePrices {
  String? description;
  String? sellKg;
  String? buyOzPrice;
  String? sellOzPrice;
  String? buyKgPrice;
  String? sellKgPrice;
  String? currency;

  LivePrices(
      {this.description,
        this.sellKg,
        this.buyOzPrice,
        this.sellOzPrice,
        this.buyKgPrice,
        this.sellKgPrice,
        this.currency});

  LivePrices.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    sellKg = json['SellKg'];
    buyOzPrice = json['BuyOzPrice'];
    sellOzPrice = json['SellOzPrice'];
    buyKgPrice = json['BuyKgPrice'];
    sellKgPrice = json['SellKgPrice'];
    currency = json['Currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Description'] = this.description;
    data['SellKg'] = this.sellKg;
    data['BuyOzPrice'] = this.buyOzPrice;
    data['SellOzPrice'] = this.sellOzPrice;
    data['BuyKgPrice'] = this.buyKgPrice;
    data['SellKgPrice'] = this.sellKgPrice;
    data['Currency'] = this.currency;
    return data;
  }
}

class Margins {
  String? goldOzSelling;
  String? goldOzBuying;
  String? goldKgSelling;
  String? goldKgBuying;
  String? silverOzSelling;
  String? silverOzBuying;
  String? silverKgSelling;
  String? silverKgBuying;
  String? platinumOzSelling;
  String? platinumOzBuying;
  String? platinumKgSelling;
  String? platinumKgBuying;
  String? palladiumOzSelling;
  String? palladiumOzBuying;
  String? palladiumKgSelling;
  String? palladiumKgBuying;

  Margins(
      {this.goldOzSelling,
        this.goldOzBuying,
        this.goldKgSelling,
        this.goldKgBuying,
        this.silverOzSelling,
        this.silverOzBuying,
        this.silverKgSelling,
        this.silverKgBuying,
        this.platinumOzSelling,
        this.platinumOzBuying,
        this.platinumKgSelling,
        this.platinumKgBuying,
        this.palladiumOzSelling,
        this.palladiumOzBuying,
        this.palladiumKgSelling,
        this.palladiumKgBuying});

  Margins.fromJson(Map<String, dynamic> json) {
    goldOzSelling = json['gold_oz_selling'];
    goldOzBuying = json['gold_oz_buying'];
    goldKgSelling = json['gold_kg_selling'];
    goldKgBuying = json['gold_kg_buying'];
    silverOzSelling = json['silver_oz_selling'];
    silverOzBuying = json['silver_oz_buying'];
    silverKgSelling = json['silver_kg_selling'];
    silverKgBuying = json['silver_kg_buying'];
    platinumOzSelling = json['platinum_oz_selling'];
    platinumOzBuying = json['platinum_oz_buying'];
    platinumKgSelling = json['platinum_kg_selling'];
    platinumKgBuying = json['platinum_kg_buying'];
    palladiumOzSelling = json['palladium_oz_selling'];
    palladiumOzBuying = json['palladium_oz_buying'];
    palladiumKgSelling = json['palladium_kg_selling'];
    palladiumKgBuying = json['palladium_kg_buying'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gold_oz_selling'] = this.goldOzSelling;
    data['gold_oz_buying'] = this.goldOzBuying;
    data['gold_kg_selling'] = this.goldKgSelling;
    data['gold_kg_buying'] = this.goldKgBuying;
    data['silver_oz_selling'] = this.silverOzSelling;
    data['silver_oz_buying'] = this.silverOzBuying;
    data['silver_kg_selling'] = this.silverKgSelling;
    data['silver_kg_buying'] = this.silverKgBuying;
    data['platinum_oz_selling'] = this.platinumOzSelling;
    data['platinum_oz_buying'] = this.platinumOzBuying;
    data['platinum_kg_selling'] = this.platinumKgSelling;
    data['platinum_kg_buying'] = this.platinumKgBuying;
    data['palladium_oz_selling'] = this.palladiumOzSelling;
    data['palladium_oz_buying'] = this.palladiumOzBuying;
    data['palladium_kg_selling'] = this.palladiumKgSelling;
    data['palladium_kg_buying'] = this.palladiumKgBuying;
    return data;
  }
}
