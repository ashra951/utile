import 'package:flutter/material.dart';

class Messenger extends StatefulWidget {
  const Messenger({Key? key}) : super(key: key);

  @override
  State<Messenger> createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 15,
        elevation: 0.0,

        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
              radius: 15,
              child: Icon(
                Icons.camera_alt,color: Colors.black,

              )
          ),
          SizedBox(width: 10,),
          CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 15,
              child: Icon(Icons.edit,color: Colors.black,)),
          SizedBox(
            width: 15,
          )
        ],
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png"),
            radius: 20,
          ),
            SizedBox(width: 5,),
            Text(
              "Chats",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black
              ),
            ),
          ],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                      borderRadius:BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search"
                        )

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 100,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>first() , separatorBuilder: (context, index) => SizedBox(width: 20,), itemCount: 10)),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return second();
                    },
                     separatorBuilder: (context,index){
                      return SizedBox(
                      height: 20,
                      );
      }
                    , itemCount: 20)
              ],

            ),
          ),
        ),
      ),

    );
  }
  Widget first(){
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 25,
          backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(
              bottom: 3,
              right: 3
          ),
          child: CircleAvatar(
            radius: 5,
            backgroundColor: Colors.green,
          ),
        ),
      ],
    );
  }
  Widget second(){
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 25,
          backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png"),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ashraf hesham ahmed "
              ),
              Text(
                "welcome back to this app .we hope to ejoy with us please notify us if u have any probelm ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )

            ],
          ),
        )

      ],
    );

  }
}
