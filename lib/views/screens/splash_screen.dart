import 'package:application/services/currency_sevices.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CurrencyServices controller = CurrencyServices();
  @override
  void initState() {
    initialDonwloader();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
    super.initState();
  }

  void initialDonwloader() async {
    generalCurrency = await controller.getAllCurrencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200.w,
            child: Image.asset("assets/load.gif", height: 500),
          ),
          SizedBox(height: 10.h),
          Text(
            "Currency",
            style: TextStyle(
                fontSize: 33.h,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
