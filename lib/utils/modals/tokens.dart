class Tokens {
  Data? data;
  bool? error;
  String? errorMessage;
  String? errorCode;

  Tokens({this.data, this.error, this.errorMessage, this.errorCode});

  Tokens.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
    errorMessage = json['error_message'];
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = error;
    data['error_message'] = errorMessage;
    data['error_code'] = errorCode;
    return data;
  }
}

class Data {
  String? address;
  String? updatedAt;
  String? nextUpdateAt;
  String? quoteCurrency;
  int? chainId;
  List<Items>? items;
  Null? pagination;

  Data(
      {this.address,
      this.updatedAt,
      this.nextUpdateAt,
      this.quoteCurrency,
      this.chainId,
      this.items,
      this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    updatedAt = json['updated_at'];
    nextUpdateAt = json['next_update_at'];
    quoteCurrency = json['quote_currency'];
    chainId = json['chain_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['updated_at'] = updatedAt;
    data['next_update_at'] = nextUpdateAt;
    data['quote_currency'] = quoteCurrency;
    data['chain_id'] = chainId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['pagination'] = pagination;
    return data;
  }
}

class Items {
  int? contractDecimals;
  String? contractName;
  String? contractTickerSymbol;
  String? contractAddress;
  List<String>? supportsErc;
  String? logoUrl;
  String? lastTransferredAt;
  bool? nativeToken;
  String? type;
  String? balance;
  String? balance24h;
  double? quoteRate;
  double? quoteRate24h;
  double? quote;
  double? quote24h;
  List<NftData>? nftData;

  Items(
      {this.contractDecimals,
      this.contractName,
      this.contractTickerSymbol,
      this.contractAddress,
      this.supportsErc,
      this.logoUrl,
      this.lastTransferredAt,
      this.nativeToken,
      this.type,
      this.balance,
      this.balance24h,
      this.quoteRate,
      this.quoteRate24h,
      this.quote,
      this.quote24h,
      this.nftData});

  Items.fromJson(Map<String, dynamic> json) {
    contractDecimals = json['contract_decimals'];
    contractName = json['contract_name'];
    contractTickerSymbol = json['contract_ticker_symbol'];
    contractAddress = json['contract_address'];
    supportsErc = json['supports_erc'].cast<String>();
    logoUrl = json['logo_url'];
    lastTransferredAt = json['last_transferred_at'];
    nativeToken = json['native_token'];
    type = json['type'];
    balance = json['balance'];
    balance24h = json['balance_24h'];
    quoteRate = json['quote_rate'];
    quoteRate24h = json['quote_rate_24h'];
    quote = json['quote'];
    quote24h = json['quote_24h'];
    if (json['nft_data'] != null) {
      nftData = <NftData>[];
      json['nft_data'].forEach((v) {
        nftData!.add(NftData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contract_decimals'] = contractDecimals;
    data['contract_name'] = contractName;
    data['contract_ticker_symbol'] = contractTickerSymbol;
    data['contract_address'] = contractAddress;
    data['supports_erc'] = supportsErc;
    data['logo_url'] = logoUrl;
    data['last_transferred_at'] = lastTransferredAt;
    data['native_token'] = nativeToken;
    data['type'] = type;
    data['balance'] = balance;
    data['balance_24h'] = balance24h;
    data['quote_rate'] = quoteRate;
    data['quote_rate_24h'] = quoteRate24h;
    data['quote'] = quote;
    data['quote_24h'] = quote24h;
    if (nftData != null) {
      data['nft_data'] = nftData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NftData {
  String? tokenId;
  String? tokenBalance;
  String? tokenUrl;
  List<String>? supportsErc;
  String? tokenPriceWei;
  String? tokenQuoteRateEth;
  String? originalOwner;
  ExternalData? externalData;
  String? owner;
  String? ownerAddress;
  bool? burned;

  NftData(
      {this.tokenId,
      this.tokenBalance,
      this.tokenUrl,
      this.supportsErc,
      this.tokenPriceWei,
      this.tokenQuoteRateEth,
      this.originalOwner,
      this.externalData,
      this.owner,
      this.ownerAddress,
      this.burned});

  NftData.fromJson(Map<String, dynamic> json) {
    tokenId = json['token_id'];
    tokenBalance = json['token_balance'];
    tokenUrl = json['token_url'];
    supportsErc = json['supports_erc'].cast<String>();
    tokenPriceWei = json['token_price_wei'];
    tokenQuoteRateEth = json['token_quote_rate_eth'];
    originalOwner = json['original_owner'];
    externalData = json['external_data'] != null
        ? ExternalData.fromJson(json['external_data'])
        : null;
    owner = json['owner'];
    ownerAddress = json['owner_address'];
    burned = json['burned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_id'] = tokenId;
    data['token_balance'] = tokenBalance;
    data['token_url'] = tokenUrl;
    data['supports_erc'] = supportsErc;
    data['token_price_wei'] = tokenPriceWei;
    data['token_quote_rate_eth'] = tokenQuoteRateEth;
    data['original_owner'] = originalOwner;
    if (externalData != null) {
      data['external_data'] = externalData!.toJson();
    }
    data['owner'] = owner;
    data['owner_address'] = ownerAddress;
    data['burned'] = burned;
    return data;
  }
}

class ExternalData {
  String? name;
  String? description;
  String? image;
  String? image256;
  String? image512;
  String? image1024;
  String? animationUrl;
  String? externalUrl;
  List<dynamic>? attributes;
  String? owner;

  ExternalData(
      {this.name,
      this.description,
      this.image,
      this.image256,
      this.image512,
      this.image1024,
      this.animationUrl,
      this.externalUrl,
      this.attributes,
      this.owner});

  ExternalData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    image256 = json['image_256'];
    image512 = json['image_512'];
    image1024 = json['image_1024'];
    animationUrl = json['animation_url'];
    externalUrl = json['external_url'];
    attributes = json['attributes'];
    owner = json['owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['image_256'] = image256;
    data['image_512'] = image512;
    data['image_1024'] = image1024;
    data['animation_url'] = animationUrl;
    data['external_url'] = externalUrl;
    data['attributes'] = attributes;
    data['owner'] = owner;
    return data;
  }
}
