import '../../domain/entities/quotations.dart';


abstract class QuotationsDatasource {
  Future<Quotations> call();
}

class QuotationsDatasourceImplementation implements QuotationsDatasource {
  QuotationsDatasourceImplementation();

  @override
  Future<Quotations> call() async {
    throw UnimplementedError();
  }
}
