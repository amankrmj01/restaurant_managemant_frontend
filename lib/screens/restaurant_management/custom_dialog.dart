import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../../datasources/model/restaurant_model.dart';
import '../../datasources/service/restaurant_service_contract.dart';
import '../../di/get_it.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/restaurant_card.dart';

class CustomDialog extends StatefulWidget {
  final String dialogTitle;
  final String buttonText;
  final VoidCallback onTap;
  final Restaurant restaurant;

  const CustomDialog({
    super.key,
    required this.restaurant,
    required this.dialogTitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final restaurantService = getIt<IRestaurantService>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: SizedBox(
          width: 750,
          // height: 700,
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.dialogTitle,
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: kdefaultPadding),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DetailInfo(
                                title: "ID",
                                info: widget.restaurant.id!,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      "Image",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(2.0),
                                    child: SizedBox(
                                      width: 250,
                                      child: AspectRatio(
                                        aspectRatio: 1.8,
                                        child: CachedNetworkImage(
                                          imageUrl: widget.restaurant.imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              DetailInfo(
                                title: "Category",
                                info: widget.restaurant.resType,
                              ),
                              DetailInfo(
                                title: "Rating",
                                info: widget.restaurant.rating,
                              ),
                              DetailInfo(
                                title: "Price",
                                info: widget.restaurant.price,
                              ),
                              DetailInfo(
                                title: "Distance",
                                info: widget.restaurant.distance,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 50),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors
                              .primaries[int.parse(widget.restaurant.id!) %
                                  Colors.primaries.length]
                              .withAlpha((255 * 0.2).toInt()),
                          child: Container(
                            height: 275,
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
                                      child: CachedNetworkImage(
                                        imageUrl: widget.restaurant.imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      widget.restaurant.name,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      widget.restaurant.resType,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 50,
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star, size: 14),
                                            const SizedBox(height: 10),
                                            Text(
                                              widget.restaurant.rating,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        CustomDivider(height: 40),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                CurrencyIcon(size: 10),
                                                CurrencyIcon(
                                                  size: 10,
                                                  color: Colors.grey.shade600,
                                                ),
                                                CurrencyIcon(
                                                  size: 10,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              widget.restaurant.price,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        CustomDivider(height: 40),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "km",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              widget.restaurant.distance,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        text: widget.buttonText,
                        onTap: widget.onTap,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailInfo extends StatelessWidget {
  final String title;
  final String info;

  const DetailInfo({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(info, style: GoogleFonts.montserrat(fontSize: 15)),
        ],
      ),
    );
  }
}
