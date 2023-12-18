import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/dailyDealsModel.dart';
import 'package:flutter/material.dart';

dailyDealCard(DailyDealsModelList model, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Images.bestOffer,
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Column(
          children: [
            const SizedBox(
              height: size_8,
            ),
            Text(
              model.title,
              style: const TextStyle(
                  fontSize: size_16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                model.description,
                style: const TextStyle(
                    fontSize: size_8,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Row dailyDealListCard(
  BuildContext context,
  List<DailyDealsModelList> model,
) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: List.generate(
              model.length,
              (index) => dailyDealCard(model[index], context),
            ),
          ),
        )
      ],
    );
