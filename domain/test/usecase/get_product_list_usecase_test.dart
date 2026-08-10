import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/model/product_list/product_model.dart';
import 'package:domain/src/repository/product_repository/product_repository.dart';
import 'package:domain/src/usecase/get_product_list/get_product_list_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:twofold/twofold.dart';

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
      const ProductModel(
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
      const ProductModel(
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
        ).thenAnswer((_) async => Twofold.success(mockProductList));

        final result = await useCase.execute(testParams);

        result.when(
          onSuccess: (products) {
            expect(products, equals(mockProductList));
            expect(products.length, equals(2));
            expect(products[0].title, equals('Test Product 1'));
            expect(products[1].title, equals('Test Product 2'));
          },
          onError: (error) => fail('Expected success but got error: $error'),
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
        ).thenAnswer((_) async => Twofold.success(const <ProductModel>[]));

        final result = await useCase.execute(testParams);

        result.when(
          onSuccess: (products) {
            expect(products, isEmpty);
          },
          onError: (error) => fail('Expected success but got error: $error'),
        );

        verify(mockProductRepository.getArticles(testQueryMap)).called(1);
      },
    );

    test('should return NetworkError when repository call fails', () async {
      final testError = NetworkError(
        httpError: 500,
        message: 'Internal Server Error',
        cause: Exception('Internal Server Error'),
      );

      when(
        mockProductRepository.getArticles(testQueryMap),
      ).thenAnswer((_) async => Twofold.error(testError));

      final result = await useCase.execute(testParams);

      result.when(
        onSuccess: (products) =>
            fail('Expected error but got success with products: $products'),
        onError: (error) {
          expect(error, equals(testError));
          expect(error.code, equals(500));
          expect(error.message, equals('Internal Server Error'));
        },
      );

      verify(mockProductRepository.getArticles(testQueryMap)).called(1);
      verifyNoMoreInteractions(mockProductRepository);
    });

    test('should return NetworkError when network connection fails', () async {
      final testError = NetworkError(
        message: 'No internet connection',
        cause: Exception('No internet connection'),
      );

      when(
        mockProductRepository.getArticles(testQueryMap),
      ).thenAnswer((_) async => Twofold.error(testError));

      final result = await useCase.execute(testParams);

      result.when(
        onSuccess: (products) => fail('Expected error but got success'),
        onError: (error) {
          expect(error, equals(testError));
          expect(error.message, equals('No internet connection'));
        },
      );

      verify(mockProductRepository.getArticles(testQueryMap)).called(1);
    });

    test('should pass correct query parameters to repository', () async {
      const differentLimit = 20;
      final differentParams = GetArticleParams(limit: differentLimit);
      final differentQueryMap = {'limit': differentLimit};

      when(
        mockProductRepository.getArticles(differentQueryMap),
      ).thenAnswer((_) async => Twofold.success(mockProductList));

      await useCase.execute(differentParams);

      verify(mockProductRepository.getArticles(differentQueryMap)).called(1);
      verifyNever(mockProductRepository.getArticles(testQueryMap));
    });

    test('should handle 404 error correctly', () async {
      final notFoundError = NetworkError(
        httpError: 404,
        message: 'Products not found',
        cause: Exception('Products not found'),
      );

      when(
        mockProductRepository.getArticles(testQueryMap),
      ).thenAnswer((_) async => Twofold.error(notFoundError));

      final result = await useCase.execute(testParams);

      result.when(
        onSuccess: (_) => fail('Expected error but got success'),
        onError: (error) {
          expect(error.code, equals(404));
          expect(error.message, equals('Products not found'));
        },
      );
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
