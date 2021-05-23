import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Product {
  final String name;
  final String description;
  final String image;

  Product(this.name, this.description, this.image);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(Product("Polydactyl", "Let’s be real, polydactyl cats give the best high-fives. Errr, high-sixes. Also known as 'mitten cats' or 'thumb cats', polydactyls have a genetic mutation that gives them more than the usual number of toes on one or more feet.", "https://cdn.britannica.com/s:800x1000/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg"));
    items.add(Product("Snowshoe", "With its white muzzle and feet, dark 'points', and blue eyes. The Snowshoe looks like what it was bred from: a Siamese with white 'boots' that turned up in the litter of a Siamese breeder in Philadelphia in the 1960s.", "https://cdn.britannica.com/s:800x1000/68/160068-050-53FE2889/Snowshoe-cat.jpg"));
    items.add(Product("Calico", "It is impossible to clone a calico cat with the same markings. Because of the random activation of genes. The necessary traits for calico patterning are on the X-chromosome, therefore nearly all calico cats are female.", "https://cdn.britannica.com/s:800x1000/93/181393-050-9FC2E61A/cat-Alison-Eldridge-orange-Calico.jpg"));
    items.add(Product("British Shorthair", "The British Shorthair is known for both its looks and its typically easygoing personality. The appealing chunkiness of its face and body and its plush, thick fur match its sturdy temperament.", "https://cdn.britannica.com/s:800x1000/92/181392-050-08187DB5/cat-British-Shorthair-grey.jpg"));
    items.add(Product("Siamese", "The Siamese cat is one of the first distinctly recognized breeds of Asian cat. Who can resist the Siamese cat’s pretty blue eyes? These cats have been valued for their unique patterning and outspoken personalities for centuries. Long a status symbol, Siamese cats have been given to dignitaries as gifts. They made their U.S. debut in 1878 when one was given to President Rutherford B. Hayes and his wife by an American consul. These cats are especially known as being very vocal—their loud meows are sometimes mistaken for babies crying!", "https://cdn.britannica.com/s:800x1000/52/26252-004-B96CF4D0/Siamese-cat.jpg"));
    items.add(Product("Norwegian Forest Cat", "If you like hugging a cat who’s a big armload of fur and can take what you dish out. Then the Norwegian Forest Cat is for you. A big cat with big paws and lots of fur, the Norwegian is like a Maine Coon cat’s Viking cousin. The large, muscular, affectionate, and calm Norwegian has a dense and water-resistant double coat and tufted toes and ears, making it the perfect companion for snowshoeing, raiding neighboring countries, and standing atop the dragon head on the prow of a Viking ship.", "https://cdn.britannica.com/s:800x1000/45/7145-004-81C779CA/Norwegian-Forest-cat-tabby.jpg"));
    return items;
  }
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemograman Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'UTS Pemograman Mobile'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cute Cat Listing")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ProductBox(item: items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(item: items[index]),
                  ),
                );
              },
            );
          },
        ));
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({Key key, this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(this.item.image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(this.item.description),
                            RatingBox(),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }

  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(
                    Icons.star_border,
                    size: _size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 2
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(
                    Icons.star_border,
                    size: _size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 3
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(
                    Icons.star_border,
                    size: _size,
                  )),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.item}) : super(key: key);
  final Product item;

  Widget build(BuildContext context) {
    String desc = this.item.description;
    String desc2 = desc.substring(0, desc.indexOf('.'));
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(this.item.image,  width: 150),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(desc2 + '...'),
                            RatingBox(),
                          ],
                        )))
              ]),
        ));
  }
}
