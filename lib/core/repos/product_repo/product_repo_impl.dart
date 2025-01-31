import 'package:dartz/dartz.dart';

import 'package:fruits_hub/core/entities/product_entity.dart';

import 'package:fruits_hub/core/errors/faluires.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';

import 'product_repo.dart';

class ProductsRepo implements ProductRepo {
  final DatabaseService databaseService;

  ProductsRepo(this.databaseService);

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFaluire('Failed to get products.'));
    }
  }
}
