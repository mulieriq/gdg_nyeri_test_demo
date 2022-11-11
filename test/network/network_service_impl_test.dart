import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_nyeri_demo/network/network_service_impl.dart';

import '../mocks/mocks.dart';

const BASE_URL = 'someurl';
void main() {
  late MockRestClient mockRestClient;

  late NetworkServiceImpl networkServiceImpl;
  setUp(() {
    mockRestClient = MockRestClient();
    networkServiceImpl = NetworkServiceImpl(mockRestClient);
  });
  group('NetWork Service Test', () {
    group("Get Request Tests", () {
      test(
        """Ensure that gethttp is called
       and return data""",
        () async {
          // ARRANGE
          mockRestClient.mockGetSuccess(data: NetworkMockData.getData);

          // ACT
          final call = await networkServiceImpl.getHttp(BASE_URL);
          var dataReceivedMatched = call['data']['get'] == 'received';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.getData);
          expect(dataReceivedMatched, true);
        },
      );

      test(
        """Ensure that get call thtough an instance of dio error
       when create method getHttp throws dio error""",
        () async {
          //ARRANGE

          mockRestClient.mockGetError();

          // ACT
          final call = await networkServiceImpl.getHttp(BASE_URL);
          var dataReceivedMatched = call['data']['data']['get'] == 'received';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.getDataError);
          expect(dataReceivedMatched, true);
        },
      );

      test(
        """Ensure that get can handle custom errors when thrown
      """,
        () async {
          //ARRANGE

          mockRestClient.mockGetSuccess();

          // ACT
          final call = await networkServiceImpl.getHttp(BASE_URL);

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.customErrorData);
        },
      );
    });

    group("Post Request Tests", () {
      test(
        """Ensure that post is called
      and has payload """,
        () async {
          // ARRANGE
          mockRestClient.mockPostSuccess(data: NetworkMockData.postData);

          // ACT
          final call = await networkServiceImpl.postHttp(BASE_URL);
          var dataReceivedMatched = call['data']['post'] == 'posted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.postData);
          expect(dataReceivedMatched, true);
        },
      );
      test(
        """Ensure that postHttp is call throws an instance of dio error
      """,
        () async {
          //ARRANGE

          mockRestClient.mockPostError();

          // ACT
          final call = await networkServiceImpl.postHttp(BASE_URL);
          var dataReceivedMatched = call['data']['data']['post'] == 'posted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.postDataError);
          expect(dataReceivedMatched, true);
        },
      );

      test(
        """Ensure that post can handle custom errors when thrown
      """,
        () async {
          //ARRANGE

          mockRestClient.mockPostSuccess();

          // ACT
          final call = await networkServiceImpl.postHttp(BASE_URL);

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.customErrorData);
        },
      );
    });

    group("Put Request Tests", () {
      test(
        """Ensure that put is called
      and has payload """,
        () async {
          // ARRANGE
          mockRestClient.mockPutSuccess(data: NetworkMockData.putData);

          // ACT
          final call = await networkServiceImpl.putHttp(BASE_URL);
          var dataReceivedMatched = call['data']['put'] == 'updated';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.putData);
          expect(dataReceivedMatched, true);
        },
      );

      test(
        """Ensure that patch is called
      and has payload """,
        () async {
          // ARRANGE
          mockRestClient.mockPatchSuccess(data: NetworkMockData.putData);

          // ACT
          final call =
              await networkServiceImpl.putHttp(BASE_URL, isPatch: true);
          var dataReceivedMatched = call['data']['put'] == 'updated';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.putData);
          expect(dataReceivedMatched, true);
        },
      );
      test("""Ensure that putHttp is call throws an instance of dio error
      """, () async {
        //ARRANGE

        mockRestClient.mockPutError();

        // ACT
        final call = await networkServiceImpl.putHttp(BASE_URL);
        var dataReceivedMatched = call['data']['data']['put'] == 'updated';

        // assert

        expect(call, isA<Map<String, dynamic>>());
        expect(call, NetworkMockData.putDataError);
        expect(dataReceivedMatched, true);
      });

      test(
        """Ensure that put can handle custom errors when thrown
      """,
        () async {
          //ARRANGE

          mockRestClient.mockPutSuccess();

          // ACT
          final call = await networkServiceImpl.putHttp(BASE_URL);

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.customErrorData);
        },
      );
    });

    group("Delete Request Tests", () {
      test(
        """Ensure that delete is called
      and has payload """,
        () async {
          // ARRANGE
          mockRestClient.mockDeleteSuccess(data: NetworkMockData.deleteData);

          // ACT
          final call = await networkServiceImpl.deleteHttp(BASE_URL);
          var dataReceivedMatched = call['data']['delete'] == 'deleted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.deleteData);
          expect(dataReceivedMatched, true);
        },
      );
      test(
        """Ensure that delete is call throws an instance of dio error
      """,
        () async {
          //ARRANGE

          mockRestClient.mockDeleteError();

          // ACT
          final call = await networkServiceImpl.deleteHttp(BASE_URL);
          var dataReceivedMatched = call['data']['data']['delete'] == 'deleted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.deleteDataError);
          expect(dataReceivedMatched, true);
        },
      );

      test(
        """Ensure that delete can handle custom errors when thrown
      """,
        () async {
          //ARRANGE

          mockRestClient.mockDeleteSuccess();

          // ACT
          final call = await networkServiceImpl.deleteHttp(BASE_URL);

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.customErrorData);
        },
      );
    });

    group("Test Status Code Not Covered", () {
      test(
        """Ensure that Error 401 is tested
      """,
        () async {
          //ARRANGE

          mockRestClient.mockStatusCodeError(401);

          // ACT
          final call = await networkServiceImpl.deleteHttp(BASE_URL);
          var dataReceivedMatched = call['data']['data']['delete'] == 'deleted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.deleteDataError401);
          expect(dataReceivedMatched, true);
        },
      );

      test(
        """Ensure that Error 403 is tested
      """,
        () async {
          //ARRANGE

          mockRestClient.mockStatusCodeError(403);

          // ACT
          final call = await networkServiceImpl.deleteHttp(BASE_URL);
          var dataReceivedMatched = call['data']['data']['delete'] == 'deleted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.deleteDataError403);
          expect(dataReceivedMatched, true);
        },
      );

      test(
        """Ensure that Error 404 is tested
      """,
        () async {
          //ARRANGE

          mockRestClient.mockStatusCodeError(404);

          // ACT
          final call = await networkServiceImpl.deleteHttp(BASE_URL);
          var dataReceivedMatched = call['data']['data']['delete'] == 'deleted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.deleteDataError404);
          expect(dataReceivedMatched, true);
        },
      );

      test(
        """Ensure that Error 422 is tested
      """,
        () async {
          //ARRANGE

          mockRestClient.mockStatusCodeError(422);

          // ACT
          final call = await networkServiceImpl.deleteHttp(BASE_URL);
          var dataReceivedMatched = call['data']['data']['delete'] == 'deleted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.deleteDataError422);
          expect(dataReceivedMatched, true);
        },
      );
      test(
        """Ensure that Error 500 is tested
      """,
        () async {
          //ARRANGE

          mockRestClient.mockStatusCodeError(500);

          // ACT
          final call = await networkServiceImpl.deleteHttp(BASE_URL);
          var dataReceivedMatched = call['data']['data']['delete'] == 'deleted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.deleteDataError500);
          expect(dataReceivedMatched, true);
        },
      );

      test(
        """Ensure that Error above 500 are handled is tested
      """,
        () async {
          //ARRANGE

          mockRestClient.mockStatusCodeError(700);

          // ACT
          final call = await networkServiceImpl.deleteHttp(BASE_URL);
          var dataReceivedMatched = call['data']['data']['delete'] == 'deleted';

          // assert

          expect(call, isA<Map<String, dynamic>>());
          expect(call, NetworkMockData.deleteDataErrorUnknown);
          expect(dataReceivedMatched, true);
        },
      );
    });
  });
}
