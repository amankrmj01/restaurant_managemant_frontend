import 'package:flutter/material.dart';
import 'package:restaurant_managemant_frontend/widgets/restaurant_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../datasources/model/restaurant_model.dart';
import 'my_dialog.dart';

class RestaurantList extends StatefulWidget {
  final List<Restaurant> restaurantList;

  const RestaurantList({super.key, required this.restaurantList});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60),
      height: 260,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.restaurantList.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.yellow.withAlpha((0.2 * 255).toInt()),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return MyDialog();
                      },
                    );
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 260,
                    width: 220,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox(
                            width: 180,
                            child: AspectRatio(
                              aspectRatio: 1.8,
                              child: Image.asset(
                                "assets/images/lureme.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Add A Restaurant!",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Share a restaurant that you like to everyone",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 45,
                            width: 45,
                            alignment: Alignment.center,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: RestaurantCard(
              onTap: () {},
              backgroundColor:
                  Colors.primaries[index % Colors.primaries.length],
              restaurant: widget.restaurantList[index - 1],
            ),
          );
        },
      ),
    );
  }
}

// return Container(
//       margin: EdgeInsets.only(left: 60),
//       height: 260,
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: restaurantList.length + 1,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 30.0),
//               child: Material(
//                 borderRadius: BorderRadius.circular(
//                   10.0,
//                 ),
//                 color: Colors.yellow.withOpacity(0.2),
//                 child: InkWell(
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return MyDialog();
//                       },
//                     );
//                   },
//                   borderRadius: BorderRadius.circular(
//                     10.0,
//                   ),
//                   child: Container(
//                     height: 260,
//                     width: 220,
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10.0),
//                           child: Container(
//                             width: 180,
//                             child: AspectRatio(
//                               aspectRatio: 1.8,
//                               child: Image.asset(
//                                 "assets/images/lureme.jpg",
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Spacer(),
//                         Text(
//                           "Add A Restaurant!",
//                           style: GoogleFonts.montserrat(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           "Share a restaurant that you like to everyone",
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.montserrat(
//                             fontSize: 10,
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Material(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(50),
//                           child: Container(
//                             height: 45,
//                             width: 45,
//                             alignment: Alignment.center,
//                             child: Icon(Icons.add),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }

//           return Padding(
//             padding: const EdgeInsets.only(right: 30.0),
//             child: RestaurantCard(
//               onTap: () {},
//               backgroundColor:
//                   Colors.primaries[index % Colors.primaries.length],
//               restaurant: restaurantList[index - 1],
//             ),
//           );
//         },
//       ),
//     );
