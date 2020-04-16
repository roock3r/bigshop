//import 'package:bigshop/common/helpers/cartBloc.dart';
import 'package:bigshop/common/providers/cart.dart';
import 'package:bigshop/common/widgets/pleaseWaitWidget.dart';
import 'package:bigshop/models/json/appShopItemModel.dart';
import 'package:bigshop/models/json/appShopModel.dart';
import 'package:bigshop/common/widgets/badge.dart';
import 'package:bigshop/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  int _itemId;
  String _itemName;
  Shop shop;
  Item item;

  ItemPage(this._itemId,this._itemName,this.shop, this.item);

  @override
  _ItemPageState createState() => _ItemPageState(this._itemId,this._itemName,this.shop, this.item);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PleaseWaitWidget _pleaseWaitWidget = PleaseWaitWidget(key: ObjectKey("pleaseWaitWidget"));
}

class _ItemPageState extends State<ItemPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _itemId;
  String _itemName;
  Shop shop;
  Item item;
  int qty = 0;

  _ItemPageState(this._itemId,this._itemName,this.shop,this.item);


  @override
  Widget build(BuildContext context) {
//    var bloc = Provider.of<CartBloc>(context);
//    int totalCount = 0;
//    if (bloc.cart.length > 0) {
//      totalCount = bloc.cart.values.reduce((a, b) => a + b);
//    }
    // TODO: implement build
    final cart = Provider.of<Cart>(context, listen: false);
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
    theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      }
      assert(false);
      return null;
    }

    IconData _add_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
      }
      assert(false);
      return null;
    }
    IconData _sub_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.remove_circle;
        case TargetPlatform.iOS:
          return Icons.remove_circle;
      }
      assert(false);
      return null;
    }
    return new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(_backIcon()),
            alignment: Alignment.centerLeft,
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: FittedBox(child: Text('${shop.name} | ${ item.name}',)),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                height: 150.0,
                width: 30.0,
                child: new GestureDetector(
                  onTap: () {
                    /*Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder:(BuildContext context) =>
                      new CartItemsScreen()
                  )
              );*/
                  },
                  child: Stack(
                    children: <Widget>[
//                      Consumer<Cart>(
//                        builder: (_, cart, ch) => Badge(
//                          child: ch,
//                          value: cart.itemCount.toString(),
//                        ),
//                        child: IconButton(
//                          icon: new Icon(
//                            Icons.shopping_cart,
//                            color: Colors.black,
//                          ),
//                          onPressed: (){
//                            //Navigator.push(context, MaterialPageRoute(builder: (context) =>Checkout()));
//                            Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
//                          }),
//                      ),
                      new IconButton(
                          icon: new Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          ),
                          onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) =>Checkout()));
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
                          }),
                      cart.itemCount == 0
                          ? new Container()
                          : new Positioned(
                          child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.orange.shade500),
                              new Positioned(
                                  top: 4.0,
                                  right: 5.5,
                                  child: new Center(
                                    child: new Text(
                                      cart.itemCount.toString(),
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        body: Container(
            padding: const EdgeInsets.all(8.0),

            child:SingleChildScrollView(

                child: Column(
                    children: <Widget>[

                      Card(
                        elevation: 4.0,
                        child:Container(
                          color: Colors.white,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // photo and title
                                SizedBox(
                                  height: 250.0,

                                  child: Stack(
                                    alignment: Alignment.center,

                                    children: <Widget>[
                                      new Container(
                                        child: Image.network('${item.image}'),
//                                        child: new Carousel(
//                                          images: [
//                                            new AssetImage(
//                                              'images/apple.jpg',
//                                              // package: destination.assetPackage,
//                                            ),
//                                            new AssetImage(
//                                              'images/tomato.jpg',
//                                              // package: destination.assetPackage,
//                                            ),
//                                            new AssetImage(
//                                              'images/lemons.jpg',
//                                              // package: destination.assetPackage,
//                                            ),
//                                            new AssetImage(
//                                              'images/kiwi.jpg',
//                                              // package: destination.assetPackage,
//                                            ),
//                                            new AssetImage(
//                                              'images/guava.jpg',
//                                              // package: destination.assetPackage,
//                                            ),
//                                            new AssetImage(
//                                              'images/grapes.jpg',
//                                              // package: destination.assetPackage,
//                                            ),
//                                          ],
//                                          boxFit: BoxFit.scaleDown,
//                                          showIndicator: false,
//
//                                          autoplay: false,
//                                        ),
                                      )
                                    ],
                                  ),

                                ),
                              ]),
                        ),
                      ),

                      Container(
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                          child: DefaultTextStyle(
                              style: descriptionStyle,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // three line description
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      item.name,
                                      style: descriptionStyle.copyWith(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Price \$ ${item.price}',
                                      style: descriptionStyle.copyWith(
                                          fontSize: 20.0,
                                          color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.all(10.0),
                          child: Card(
                              child: Container(
                                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                                  child: DefaultTextStyle(
                                      style: descriptionStyle,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          // three line description
                                          Row(
                                            children: <Widget>[
                                              new IconButton(
                                                icon: Icon(_add_icon(),color: Colors.amber.shade500),
                                                onPressed: () {

                                                  qty = qty + 1;

                                                },
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left:2.0),
                                              ),
                                              Text(
                                                qty.toString(),
                                                style: descriptionStyle.copyWith(
                                                    fontSize: 20.0,
                                                    color: Colors.black87),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(right:2.0),
                                              ),
                                              new IconButton(
                                                icon: Icon(_sub_icon(),color: Colors.amber.shade500),
                                                onPressed: () {
                                                  if(qty<0){

                                                  }
                                                  else{
                                                    qty = qty -1;
                                                  }
                                                },
                                              ),
                                            ],
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 8.0),
                                            child:  Container(
                                              alignment: Alignment.center,
                                              child: OutlineButton(
                                                  borderSide: BorderSide(color: Colors.amber.shade500),
                                                  child: const Text('Add'),
                                                  textColor: Colors.amber.shade500,
                                                  onPressed: () {
                                                   // bloc.addToCart(item.id, item.id.toString(), item.price, item.name);
                                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart_screen()));
                                                    cart.addItem(item.id.toString(), shop.id, item.price, item.name);
                                                    _scaffoldKey.currentState.hideCurrentSnackBar();
//                                                    Scaffold.of(context).hideCurrentSnackBar();
                                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                                      content: Text('Add item to cart'),
                                                      duration: Duration(seconds: 2),
                                                      action: SnackBarAction(
                                                        label: 'UNDO',
                                                        onPressed: () {
                                                          cart.removeSingleItem(item.id.toString());
                                                        },
                                                      ),
                                                    ));
//                                                    Scaffold.of(context).showSnackBar(SnackBar(
//                                                      content: Text('Add item to cart'),
//                                                      duration: Duration(seconds: 2),
//                                                      action: SnackBarAction(
//                                                        label: 'UNDO',
//                                                        onPressed: () {
//                                                          cart.removeSingleItem(item.id.toString());
//                                                        },
//                                                      ),
//                                                    ));
                                                  },
                                                  shape: new OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(30.0),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      )
                                  )
                              )
                          )
                      ),

                      Container(
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                          child: DefaultTextStyle(
                              style: descriptionStyle,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // three line description
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Details',
                                      style: descriptionStyle.copyWith(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              )
                          )
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),

                          child: Text("${item.shortDescription}",
                              maxLines: 10,
                              style: TextStyle(fontSize: 13.0,color: Colors.black38)
                          )
                      ),

                    ]
                )
            )
        )
    );

    //return Container();
  }
}