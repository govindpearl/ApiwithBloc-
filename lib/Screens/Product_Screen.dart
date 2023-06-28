import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({super.key});

  @override
  State<Productscreen> createState() => _ProductscreenState();


}
bool isProductSaved = false;
class _ProductscreenState extends State<Productscreen> {
  @override
  void initState() {
    // TODO: implement initState
    //..add(ProductLoadedEvent());
    if(!isProductSaved) {
      context.read<ProductsBloc>().add(ProductLoadedEvent());
      isProductSaved = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Products screen"),),

        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if(state is ProductsLoadingState){
              return Center(child: CircularProgressIndicator.adaptive(),);
            }

            else if (state is ProductLoadedState)
            {
              return ListView.builder(

                itemBuilder: (context, index) {
                  return  ListTile(

                    // isThreeLine: true,
                    leading:SizedBox(
                        height: 150,
                        width: 100,
                        child: Image.network(state.productmodel[index].image.toString())),
                    subtitle: Text(state.productmodel[index].rating!.rate.toString()),
                    title: Text(state.productmodel[index].category.toString()),
                    trailing: Text(state.productmodel[index].price.toString()),



                  );


                },
                itemCount:state.productmodel.length,

              );
            }
            else if (state is ProductErrorState)
            {
              return Center(child: Text(state.errorMessage),);
            }
            return SizedBox();



          },

        ));
  }
}
