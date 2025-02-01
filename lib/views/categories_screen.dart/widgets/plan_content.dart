import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/models/plan_model.dart';
import 'package:lms_app/utils/colors.dart';

class PlanContentScreen extends StatefulWidget {
  final PlanModel plan;
  const PlanContentScreen({super.key, required this.plan});

  @override
  State<PlanContentScreen> createState() => _PlanContentScreenState();
}

class _PlanContentScreenState extends State<PlanContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.grey[300],
                      ),
                      child: CachedNetworkImage(
                        height: 200,
                        width: double.infinity,
                        imageUrl: widget.plan.thumbnail,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => SizedBox(
                          height: 200,
                          child: Center(
                            child: Icon(
                              Icons.broken_image_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                     Text(widget.plan.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500 , color: AppColors.primary)),
                   
                    Text("Validity : ${widget.plan.validity} Days", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500 , color: AppColors.primary),),
                            SizedBox(height: 10,),
                    Text("Description : ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400 , color: AppColors.primary)),
                    SizedBox(height: 4,),
                    Text(widget.plan.description, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400 , color: AppColors.primary)),
                  ],
                ),
              ),
            ),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            width: double.infinity,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                   Text('Rs.${widget.plan.price}', style: TextStyle(color: Colors.white , fontSize: 20, fontWeight: FontWeight.w500),),
                MaterialButton(onPressed: (){}, color: AppColors.primary, child: Text('Buy Now', style: TextStyle(color: Colors.white),),  ),
             
              ],
            ),
          ),
        
        ],
      ),
    );
  }
}
