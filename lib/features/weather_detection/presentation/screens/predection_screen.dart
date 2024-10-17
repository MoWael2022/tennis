import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/constant/image_path_manager.dart';
import 'package:weather_app/core/utilies/color_manager.dart';
import 'package:weather_app/features/weather_detection/presentation/controller/get_prediction_cubit.dart';
import 'package:weather_app/features/weather_detection/presentation/controller/get_prediction_state.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/routers/routers.dart';


class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: BlocBuilder<GetPredictionCubit, GetPredictionState>(
              builder: (context, state) {
            if (state is PredictionLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PredictionLoadedState) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5.h,bottom: 2.h,right: 3.w ,left: 3.w),
                    child: Text(
                      textWidthBasis: TextWidthBasis.longestLine,
                      textAlign: TextAlign.center,
                      state.data,
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Lottie.asset(state.lottie),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pushNamed(Routers.layoutPagesScreen);
                  }, child:const Text("check another weather"))
                ],
              );

            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}
