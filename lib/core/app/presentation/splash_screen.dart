import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scrollable: false,
      useSafeArea: true,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppInfo.appName.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                letterSpacing: 6,
              ),
            ),
            const SizedBox(height: 60),
            
            const SpinKitFoldingCube(
              color: Colors.blueAccent, 
              size: 40.0,
            ),
            
            const SizedBox(height: 60),
            
            const Opacity(
              opacity: 0.4,
              child: Text(
                'SYSTEM VERSION ${AppInfo.appVersion}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Monospace',
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}