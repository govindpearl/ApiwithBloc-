part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}
class ProductsLoadingState extends ProductsState{}

class ProductLoadedState extends ProductsState{
   final List<Productmodel> productmodel;

  const ProductLoadedState(this.productmodel);

   @override
   List<Object> get props => [productmodel];

}
class ProductErrorState extends ProductsState{
  final String errorMessage;

  const ProductErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
