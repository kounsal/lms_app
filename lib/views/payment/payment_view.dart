import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/controllers/payment_controlleer.dart';
import 'package:lms_app/models/purchase_model.dart';
import 'package:lms_app/utils/colors.dart';
import 'package:lms_app/utils/themes.dart';

class PaymentViewPage extends StatefulWidget {
  final PurchaseModel purchasee;
  const PaymentViewPage({super.key, required this.purchasee});

  @override
  State<PaymentViewPage> createState() => _PaymentViewPageState();
}

class _PaymentViewPageState extends State<PaymentViewPage> {
  final PaymentController controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment\'s Page'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
                height: 130,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black.withOpacity(.050),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Container(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth * .4,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            child: Image.network(
                              widget.purchasee.imageUrl ?? "",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/logo.webp',
                                  fit: BoxFit.contain,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.purchasee.name ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextFormat.extraSmall(
                                    text: widget.purchasee.description,
                                    opacity: .5,
                                  ),
                                  //  data.priceWithDiscount != null
                                  //         ? Row(
                                  //             children: [
                                  //               TextFormat.small(
                                  //                   text:
                                  //                       'Rs.${data.priceWithDiscount}',
                                  //                   textColor:
                                  //                       AppColors.primary,
                                  //                   fontWeight:
                                  //                       FontWeight.w700),
                                  //               const SizedBox(
                                  //                 width: 10,
                                  //               ),
                                  //               TextFormat.small(
                                  //                   text: 'Rs.${args.price}',
                                  //                   decoration: TextDecoration
                                  //                       .lineThrough),
                                  //             ],
                                  //           ) :
                                  TextFormat.small(
                                      text: 'Rs.${widget.purchasee.price}',
                                      textColor: AppColors.primary,
                                      fontWeight: FontWeight.w700),
                                ],
                              ),
                              // GestureDetector(
                              //   onTap: () async {
                              //     // await courseController
                              //     //     .getCourseDetails(data.id);
                              //   },
                              //   child: Container(
                              //     width: constraints.maxWidth * .5,
                              //     decoration: BoxDecoration(
                              //         border: Border.all(
                              //           color: AppColors.primary,
                              //         ),
                              //         borderRadius:
                              //             BorderRadius.circular(10)),
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //         horizontal: 15,
                              //         vertical: 5,
                              //       ),
                              //       child: Center(
                              //         child: data.isFree ?? false
                              //             ? Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment
                              //                         .spaceEvenly,
                              //                 children: [
                              //                   Icon(
                              //                     Icons.shopping_cart,
                              //                     size: 20,
                              //                     color: AppColors.primary,
                              //                   ),
                              //                   Text(
                              //                     'Enroll Now',
                              //                     style: GoogleFonts.poppins(
                              //                       color: AppColors.primary,
                              //                     ),
                              //                   ),
                              //                 ],
                              //               )
                              //             : Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment
                              //                         .spaceEvenly,
                              //                 children: [
                              //                   Icon(
                              //                     Icons.shopping_cart,
                              //                     size: 20,
                              //                     color: AppColors.primary,
                              //                   ),
                              //                   Text(
                              //                     'Buy Now',
                              //                     style: GoogleFonts.poppins(
                              //                       color: AppColors.primary,
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ))
                      ],
                    );
                  },
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                width: double.infinity,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs.${widget.purchasee.price}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await controller.makePayment(widget.purchasee);

                        // Get.to(()=> PaymentViewPage(
                        //   purchasee: PurchaseModel(
                        //     id: arg.id,
                        //     name: arg.title,
                        //     price: arg.price.toDouble(),
                        //     type: 'course',
                        //     imageUrl: arg.thumbnail,
                        //     description: arg.description,
                        //     email: "",
                        //     contact: "",
                        //   ),
                        // ));
                      },
                      color: AppColors.primary,
                      child: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Obx(() {
            if (controller.isPaymentProcessing.value) {
              return Container(
                color: Colors.black.withOpacity(.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const SizedBox();
            }
          })
        ],
      ),
    );
  }
}
