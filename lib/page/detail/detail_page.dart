import 'package:flutter/material.dart';
import 'package:test_big_io_mobile_dev/shared/theme.dart';

  Widget detail(context, name, species, gender, origin, location, image) {
    return Scaffold(
      backgroundColor: yellowColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            color: blackColor,
            size: 40,
          ),
        ),
        title: Text(
          'Detail',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 21,
                  fontWeight: semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                species.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 21,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                gender.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 21,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                origin.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 21,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                location.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 21,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: greenColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage(image.toString()))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

