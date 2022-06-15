

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HelwanStore extends StatefulWidget {
  const HelwanStore({Key? key}) : super(key: key);

  @override
  State<HelwanStore> createState() => _HelwanStoreState();
}

class _HelwanStoreState extends State<HelwanStore> {
  int appleCounter = 0;
  int bananaCounter = 0;
  int orangeCounter = 0;

  Socket? socket;

  String price = '0.0';


  @override
  void initState() {
    // TODO: implement initState
    initializeSocket();
    super.initState();
  }

  void initializeSocket() {
    socket = IO.io(
        'http://192.168.1.19:5000/',
        OptionBuilder().setTransports([
          "websocket",
        ]).build());
    socket?.onConnect((data) {
      print('connected');
    });
    print(socket);
  }

  void getResponse() {
    socket!.on('Server: Response',
            (data) {
      price = data.toString();
      print('$data');
      setState(() {
      });
        });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Helwan Store',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,


          ),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 10.0,),
                    Row(
                        children: [
                          Container(
                            height: 40.0,
                            width: 40.0,
                            child: const Image(image: AssetImage('assets/bananas.png',),),
                          ),
                          const SizedBox(width: 20.0,),
                          Column(
                            children: [
                              const Text(
                                'Bananas      30.00 L.E./kg',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),

                              Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: IconButton(
                                          onPressed: (){
                                            bananaCounter++;
                                            setState(() {

                                            });
                                          },
                                          alignment: Alignment.center,
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                    ),
                                    const SizedBox(width: 6.0,),
                                    Text('$bananaCounter'),
                                    const SizedBox(width: 6.0,),
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: IconButton(
                                          onPressed: (){
                                            bananaCounter--;
                                            if(bananaCounter==-1)
                                              {
                                                bananaCounter=0;
                                              }
                                            setState(() {

                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          )),
                                    ),

                                  ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(height: 16.0,),
                    Container(height: 1.0, color: Colors.black,),
                    const SizedBox(height: 16.0,),
                    Row(
                        children: [
                          Container(
                            height: 40.0,
                            width: 40.0,
                            child: const Image(image: AssetImage('assets/apple.png',),),
                          ),
                          const SizedBox(width: 20.0,),
                          Column(
                            children: [
                              const Text(
                                'Apples      20.00 L.E./kg',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),

                              Row(
                                  children: [
                                    const SizedBox(width: 16.0,),
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: IconButton(
                                          onPressed: (){
                                            appleCounter++;
                                            setState(() {

                                            });
                                          },
                                          alignment: Alignment.center,
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                    ),
                                    const SizedBox(width: 6.0,),
                                    Text('$appleCounter'),
                                    const SizedBox(width: 6.0,),
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: IconButton(
                                          onPressed: (){
                                            appleCounter--;
                                            if(appleCounter==-1)
                                            {
                                              appleCounter=0;
                                            }
                                            setState(() {

                                            });
                                          },
                                          alignment: Alignment.center,
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          )),
                                    ),

                                  ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(height: 16.0,),
                    Container(height: 1.0, color: Colors.black,),
                    const SizedBox(height: 16.0,),
                    Row(
                        children: [
                          Container(
                            height: 40.0,
                            width: 40.0,
                            child: const Image(image: AssetImage('assets/orange.png',),),
                          ),
                          const SizedBox(width: 20.0,),
                          Column(
                            children: [
                              const Text(
                                'Oranges      10.00 L.E./kg',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),

                              Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: IconButton(
                                          onPressed: (){
                                            orangeCounter++;
                                            setState(() {

                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                    ),
                                    const SizedBox(width: 6.0,),
                                    Text('$orangeCounter'),
                                    const SizedBox(width: 6.0,),
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: IconButton(
                                          onPressed: (){
                                            orangeCounter--;
                                            if(orangeCounter==-1){
                                              orangeCounter=0;
                                            }
                                            setState(() {

                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          )),
                                    ),

                                  ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(height: 16.0,),
                    Container(height: 1.0, color: Colors.black,),
                    const SizedBox(height: 16.0,),

                  ],
                ),
              ),
              const SizedBox(height: 40.0,),
              const Image(
                 image: AssetImage('assets/grocery-cart.png'),
                 height: 40.0,
                 width: 40.0,
              ),
              Center(
                child: MaterialButton(
                  color: Colors.blue,
                  height: 40.0,
                    onPressed: (){
                      socket!.emit("client: Calculate price",
                        {
                          "Apples":appleCounter,
                          "Bananas":bananaCounter,
                          "Oranges":orangeCounter,
                        },);
                      setState(() {

                      });
                    },
                child: const Text('Check out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,

                ),
                ),
                ),
              ),
              Text(
                'Total Price is $price',
              style: const TextStyle(
               fontSize: 20.0,
              ),
              ),
            ],
          ),
      ),

    );
  }
}
