import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/productmodels.dart';
import '../models/productmodels.dart';
import 'package:http/http.dart' as http;

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductLoadedEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoadingState()) {
    on<ProductLoadedEvent>((event, emit) async {
      // TODO: implement event handler
      try{
        emit (ProductsLoadingState());
        var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

        if(response.statusCode==200)
          {
            emit(ProductLoadedState(productmodelFromJson(response.body)));
          }
        else
          {
            throw Exception("Failed to loadProducts");
          }

      }catch (e){
         emit (ProductErrorState(e.toString()));
      }


    });
  }
}
