import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/model/product_list/product_model.dart';
import 'package:domain/src/repository/product_repository/product_repository.dart';
import 'package:domain/src/usecase/get_product_list/get_product_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_product_list_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late GetProductListUseCase useCase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    useCase = GetProductListUseCase(mockProductRepository);
  });

  group('GetProductListUseCase', () {
    const testLimit = 10;
    final testParams = GetArticleParams(limit: testLimit);
    final testQueryMap = testParams.toJson;

    final mockProductList = [
      ProductModel(
        id: 1,
        title: 'Test Product 1',
        description: 'Test Description 1',
        category: 'Test Category',
        price: 99.99,
        discountPercentage: 10.5,
        rating: 4.5,
        stock: 50,
        brand: 'Test Brand',
        sku: 'TEST-SKU-001',
        weight: 1.5,
        thumbnail: 'https://example.com/thumb1.jpg',
      ),
      ProductModel(
        id: 2,
        title: 'Test Product 2',
        description: 'Test Description 2',
        category: 'Test Category',
        price: 149.99,
        discountPercentage: 15,
        rating: 4.8,
        stock: 30,
        brand: 'Test Brand',
        sku: 'TEST-SKU-002',
        weight: 2,
        thumbnail: 'https://example.com/thumb2.jpg',
      ),
    ];

    test(
      'should return list of products when repository call is successful',
      () async {
        when(
          mockProductRepository.getArticles(testQueryMap),
        ).thenAnswer((_) async => right(mockProductList));

        final result = await useCase.execute(testParams);

        result.fold(
          (error) => fail('Expected Right but got Left with error: $error'),
          (products) {
            expect(products, equals(mockProductList));
            expect(products.length, equals(2));
            expect(products[0].title, equals('Test Product 1'));
            expect(products[1].title, equals('Test Product 2'));
          },
        );

        verify(mockProductRepository.getArticles(testQueryMap)).called(1);
        verifyNoMoreInteractions(mockProductRepository);
      },
    );

    test(
      'should return empty list when repository returns empty list',
      () async {
        when(
          mockProductRepository.getArticles(testQueryMap),
        ).thenAnswer((_) async => right(const <ProductModel>[]));

        final result = await useCase.execute(testParams);

        result.fold(
          (error) => fail('Expected Right but got Left with error: $error'),
          (products) {
            expect(products, isEmpty);
          },
        );

        verify(mockProductRepository.getArticles(testQueryMap)).called(1);
      },
    );

    test('should return NetworkError when repository call fails', () async {
      const testError = NetworkError(
        httpError: 500,
        message: 'Internal Server Error',
      );

      when(
        mockProductRepository.getArticles(testQueryMap),
      ).thenAnswer((_) async => left(testError));

      final result = await useCase.execute(testParams);

      result.fold(
        (error) {
          expect(error, equals(testError));
          expect(error.code, equals(500));
          expect(error.message, equals('Internal Server Error'));
        },
        (products) =>
            fail('Expected Left but got Right with products: $products'),
      );

      verify(mockProductRepository.getArticles(testQueryMap)).called(1);
      verifyNoMoreInteractions(mockProductRepository);
    });

    test('should return NetworkError when network connection fails', () async {
      const testError = NetworkError(message: 'No internet connection');

      when(
        mockProductRepository.getArticles(testQueryMap),
      ).thenAnswer((_) async => left(testError));

      final result = await useCase.execute(testParams);

      result.fold((error) {
        expect(error, equals(testError));
        expect(error.message, equals('No internet connection'));
      }, (products) => fail('Expected Left but got Right'));

      verify(mockProductRepository.getArticles(testQueryMap)).called(1);
    });

    test('should pass correct query parameters to repository', () async {
      const differentLimit = 20;
      final differentParams = GetArticleParams(limit: differentLimit);
      final differentQueryMap = {'limit': differentLimit};

      when(
        mockProductRepository.getArticles(differentQueryMap),
      ).thenAnswer((_) async => right(mockProductList));

      await useCase.execute(differentParams);

      verify(mockProductRepository.getArticles(differentQueryMap)).called(1);
      verifyNever(mockProductRepository.getArticles(testQueryMap));
    });

    test('should handle 404 error correctly', () async {
      const notFoundError = NetworkError(
        httpError: 404,
        message: 'Products not found',
      );

      when(
        mockProductRepository.getArticles(testQueryMap),
      ).thenAnswer((_) async => left(notFoundError));

      final result = await useCase.execute(testParams);

      result.fold((error) {
        expect(error.code, equals(404));
        expect(error.message, equals('Products not found'));
      }, (_) => fail('Expected Left but got Right'));
    });
  });

  group('GetArticleParams', () {
    test('should create params with correct limit value', () {
      const testLimit = 15;
      final params = GetArticleParams(limit: testLimit);

      expect(params.limit, equals(testLimit));
    });

    test('should convert to JSON correctly', () {
      const testLimit = 25;
      final params = GetArticleParams(limit: testLimit);
      final json = params.toJson;

      expect(json, isA<Map<String, dynamic>>());
      expect(json['limit'], equals(testLimit));
      expect(json.length, equals(1));
    });

    test('should handle different limit values', () {
      final params1 = GetArticleParams(limit: 1);
      final params2 = GetArticleParams(limit: 100);

      expect(params1.toJson['limit'], equals(1));
      expect(params2.toJson['limit'], equals(100));
    });
  });
}
