import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Heart extends StatefulWidget {

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Heart'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://images-prod.healthline.com/hlcmsresource/images/AN_images/berry-almond-salad-1296x728.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Leafy Green Vegetables",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 15.0,
                        ),
                      ),
                      ),
                    
                                       
                ],
                
                
              ),
            
            ),
          ),
            new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://static01.nyt.com/images/2020/03/17/well/askwell-wholegrains/askwell-wholegrains-mediumSquareAt3X.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Whole Grains",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
            new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://images.unsplash.com/photo-1474480109237-15a7ca8f0685?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Berries",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                      new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://www.verywellhealth.com/thmb/dFmKvt9jP4QzC1ddY9U4UbvP8mw=/2077x1443/filters:fill(87E3EF,1)/avocadosGettyImages-961101662-5b9eda1bc9e77c0050a7fafa.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Avocados",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                      new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://omegaquant.com/wp-content/uploads/2019/04/omega-3s-in-fish-and-fish-oil.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Fatty Fish and Fish Oil",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 15.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                      new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://www.healthline.com/hlcmsresource/images/AN_images/AN378-Walnuts-Hands-732x549-thumb.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Walnuts",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                   new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://www.gracefullittlehoneybee.com/wp-content/uploads/2014/09/Slow-Cooker-Pinto-Beans-3.jpg',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Beans",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
                   new Container(
            child: Card(
              elevation: 10.0,
              child: Column(
                children:[
                  Image.network(
                    'https://i1.wp.com/www.eatthis.com/wp-content/uploads/2017/10/dark-chocolate-bar-squares.jpg?fit=1024%2C750&ssl=1',
                    fit: BoxFit.cover,
                    height: 140.0,
                    width: 200.0,
                    ),
                    SizedBox(height: 5.0),

                    Padding(
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Text(
                        "Dark Chocolates",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20.0,
                        ),
                      ),
                      ),                                     
                ],      
              ),
            ),
          ),
        ],
        ),
    );
  }
}