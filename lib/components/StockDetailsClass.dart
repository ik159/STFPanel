

class StockDetailsClass{
  String sId;
  String symbol;
  String assetType;
  String name;
  String description;
  String cIK;
  String exchange;
  String currency;
  String country;
  String sector;
  String industry;
  String address;
  String fullTimeEmployees;
  String fiscalYearEnd;
  String latestQuarter;
  String marketCapitalization;
  String eBITDA;
  String pERatio;
  String pEGRatio;
  String bookValue;
  String dividendPerShare;
  String dividendYield;
  String ePS;
  String revenuePerShareTTM;
  String profitMargin;
  String operatingMarginTTM;
  String returnOnAssetsTTM;
  String returnOnEquityTTM;
  String revenueTTM;
  String grossProfitTTM;
  String dilutedEPSTTM;
  String quarterlyEarningsGrowthYOY;
  String quarterlyRevenueGrowthYOY;
  String analystTargetPrice;
  String trailingPE;
  String forwardPE;
  String priceToSalesRatioTTM;
  String priceToBookRatio;
  String eVToRevenue;
  String eVToEBITDA;
  String beta;
  String sharesOutstanding;
  String sharesFloat;
  String sharesShort;
  String sharesShortPriorMonth;
  String shortRatio;
  String shortPercentOutstanding;
  String shortPercentFloat;
  String percentInsiders;
  String percentInstitutions;
  String forwardAnnualDividendRate;
  String forwardAnnualDividendYield;
  String payoutRatio;
  String dividendDate;
  String exDividendDate;
  String lastSplitFactor;
  String lastSplitDate;
  int iV;

  StockDetailsClass(
      {required this.sId,
     required this.symbol,
     required this.assetType,
    required  this.name,
    required  this.description,
    required  this.cIK,
    required  this.exchange,
    required  this.currency,
     required this.country,
     required this.sector,
     required this.industry,
     required this.address,
     required this.fullTimeEmployees,
     required this.fiscalYearEnd,
     required this.latestQuarter,
     required this.marketCapitalization,
     required this.eBITDA,
     required this.pERatio,
     required this.pEGRatio,
     required this.bookValue,
      required this.dividendPerShare,
     required this.dividendYield,
     required this.ePS,
     required this.revenuePerShareTTM,
     required this.profitMargin,
     required this.operatingMarginTTM,
     required this.returnOnAssetsTTM,
     required this.returnOnEquityTTM,
    required  this.revenueTTM,
    required  this.grossProfitTTM,
     required this.dilutedEPSTTM,
     required this.quarterlyEarningsGrowthYOY,
     required this.quarterlyRevenueGrowthYOY,
     required this.analystTargetPrice,
     required this.trailingPE,
    required  this.forwardPE,
    required  this.priceToSalesRatioTTM,
    required  this.priceToBookRatio,
     required this.eVToRevenue,
    required  this.eVToEBITDA,
    required  this.beta,
    required  this.sharesOutstanding,
    required  this.sharesFloat,
     required this.sharesShort,
     required this.sharesShortPriorMonth,
     required this.shortRatio,
      required this.shortPercentOutstanding,
     required this.shortPercentFloat,
    required  this.percentInsiders,
     required this.percentInstitutions,
     required this.forwardAnnualDividendRate,
     required this.forwardAnnualDividendYield,
     required this.payoutRatio,
     required this.dividendDate,
     required this.exDividendDate,
     required this.lastSplitFactor,
     required this.lastSplitDate,
     required this.iV});

 factory StockDetailsClass.fromJson(Map<String, dynamic> json) => 
    StockDetailsClass(
      sId :  json['_id'],
    symbol :  json['Symbol'],
    assetType :  json['AssetType'],
    name :  json['Name'],
    description :  json['Description'],
    cIK :  json['CIK'],
    exchange :  json['Exchange'],
    currency :  json['Currency'],
    country :  json['Country'],
    sector :  json['Sector'],
    industry :  json['Industry'],
    address :  json['Address'],
    fullTimeEmployees :  json['FullTimeEmployees'],
    fiscalYearEnd :  json['FiscalYearEnd'],
    latestQuarter :  json['LatestQuarter'],
    marketCapitalization :  json['MarketCapitalization'],
    eBITDA :  json['EBITDA'],
    pERatio :  json['PERatio'],
    pEGRatio :  json['PEGRatio'],
    bookValue :  json['BookValue'],
    dividendPerShare :  json['DividendPerShare'],
    dividendYield :  json['DividendYield'],
    ePS :  json['EPS'],
    revenuePerShareTTM :  json['RevenuePerShareTTM'],
    profitMargin :  json['ProfitMargin'],
    operatingMarginTTM :  json['OperatingMarginTTM'],
    returnOnAssetsTTM :  json['ReturnOnAssetsTTM'],
    returnOnEquityTTM :  json['ReturnOnEquityTTM'],
    revenueTTM :  json['RevenueTTM'],
    grossProfitTTM :  json['GrossProfitTTM'],
    dilutedEPSTTM :  json['DilutedEPSTTM'],
    quarterlyEarningsGrowthYOY :  json['QuarterlyEarningsGrowthYOY'],
    quarterlyRevenueGrowthYOY :  json['QuarterlyRevenueGrowthYOY'],
    analystTargetPrice :  json['AnalystTargetPrice'],
    trailingPE :  json['TrailingPE'],
    forwardPE :  json['ForwardPE'],
    priceToSalesRatioTTM :  json['PriceToSalesRatioTTM'],
    priceToBookRatio :  json['PriceToBookRatio'],
    eVToRevenue :  json['EVToRevenue'],
    eVToEBITDA :  json['EVToEBITDA'],
    beta :  json['Beta'],
    sharesOutstanding :  json['SharesOutstanding'],
    sharesFloat :  json['SharesFloat'],
    sharesShort :  json['SharesShort'],
    sharesShortPriorMonth :  json['SharesShortPriorMonth'],
    shortRatio :  json['ShortRatio'],
    shortPercentOutstanding :  json['ShortPercentOutstanding'],
    shortPercentFloat :  json['ShortPercentFloat'],
    percentInsiders :  json['PercentInsiders'],
    percentInstitutions :  json['PercentInstitutions'],
    forwardAnnualDividendRate :  json['ForwardAnnualDividendRate'],
    forwardAnnualDividendYield :  json['ForwardAnnualDividendYield'],
    payoutRatio :  json['PayoutRatio'],
    dividendDate :  json['DividendDate'],
    exDividendDate :  json['ExDividendDate'],
    lastSplitFactor :  json['LastSplitFactor'],
    lastSplitDate :  json['LastSplitDate'],
    iV : json['__v'],
    );
  

 
}