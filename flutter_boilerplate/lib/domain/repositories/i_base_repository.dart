import 'package:rest_api_client/rest_api_client.dart';

abstract class Transportable<T> implements Serializable, Deserializable<T> {}

abstract class Serializable {
  Map<String, dynamic> toMap();
}

abstract class Deserializable<T> {
  T fromMap(Map<String, dynamic> map);
}

abstract class IBaseRepository<TModel, TSearchModel, TAddModel, TUpdateModel, TId> {
  Future<List<TModel>?> get(TSearchModel model);
  Future<TModel?> getById(TId id);
  Future<TAddModel> prepareForAdd();
  Future<TModel> add(TAddModel model);
  Future<TUpdateModel> prepareForUpdate({required TId id});
  Future<TModel> update(TUpdateModel model);
  Future<bool> delete(TId id);
}

class Routes {
  String? baseRoute;
  String getRoute;
  String getByIdRoute;
  String prepareForAddRoute;
  String addRoute;
  String prepareForUpdateRoute;
  String updateRoute;
  String deleteRoute;

  Routes({
    this.baseRoute,
    required this.getRoute,
    required this.getByIdRoute,
    required this.prepareForAddRoute,
    required this.addRoute,
    required this.prepareForUpdateRoute,
    required this.updateRoute,
    required this.deleteRoute,
  });

  String buildRoute(String route) => baseRoute != null ? '/$baseRoute/$route' : '/$route';
}

class Callbacks<TModel, TSearchModel extends Serializable, TAddModel extends Serializable, TUpdateModel extends Serializable, TId> {
  TModel Function(Map<String, dynamic> map) modelFromMap;

  Callbacks({
    required this.modelFromMap,
  });
}

class Options<TModel, TSearchModel extends Serializable, TAddModel extends Serializable, TUpdateModel extends Serializable, TId> {
  Routes routes;
  Callbacks callbacks;

  Options({
    required this.routes,
    required this.callbacks,
  });
}

class BaseRepository<TModel, TSearchModel extends Serializable, TAddModel extends Serializable, TUpdateModel extends Serializable, TId> implements IBaseRepository<TModel, TSearchModel, TAddModel, TUpdateModel, TId> {
  Options options;
  IRestApiClient restApiClient;

  BaseRepository({
    required this.options,
    required this.restApiClient,
  });

  @override
  Future<List<TModel>?> get(TSearchModel? model, {bool methodPost = true}) async {
    try {
      final response = await restApiClient.post(
        options.routes.buildRoute(options.routes.getRoute),
        data: model?.toMap(),
      );

      return response.data?.map<TModel>((map) => options.callbacks.modelFromMap(map))?.toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<TModel?> getById(TId id) async {
    try {
      final response = await restApiClient.get('${options.routes.buildRoute(options.routes.getByIdRoute)}/$id');

      return options.callbacks.modelFromMap(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<TAddModel> prepareForAdd() {
    // TODO: implement prepareForAdd
    throw UnimplementedError();
  }

  @override
  Future<TModel> add(TAddModel model) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<TUpdateModel> prepareForUpdate({required TId id}) {
    // TODO: implement prepareForUpdate
    throw UnimplementedError();
  }

  @override
  Future<TModel> update(TUpdateModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(TId id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
