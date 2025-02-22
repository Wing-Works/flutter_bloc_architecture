abstract class BaseLayerDataTransformer<F, T> {
  F restore(T data);

  T transform();
}
