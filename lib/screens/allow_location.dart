import 'package:flutter/material.dart';
import 'package:rumailah/screens/select_locator.dart';

class AllowLocation extends StatefulWidget {
  const AllowLocation({super.key});

  @override
  State<AllowLocation> createState() => _AllowLocationState();
}

class _AllowLocationState extends State<AllowLocation> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    void onAllowPressed() async {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SelectLocator()),
        );
      }
    }

    void onSkipPressed() async {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SelectLocator()),
        );
      }
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 15,
            left: screenWidth * 0.5,
            child: Image.asset(
              "assets/images/createaccount/gray.png",
              width: 250,
              height: 250,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Image.asset("assets/images/allowlocation/location.png"),
                  const SizedBox(height: 10),
                  const Text(
                    "Allow Location",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4D5E47),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Allow Rumailah to access your location",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF7C7C83),
                    ),
                  ),
                  const SizedBox(height: 70),
                  SizedBox(
                    width: screenWidth * 0.85,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: const Color(0xFF4D5E47),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        onAllowPressed();
                      },
                      child: const Text(
                        "Allow",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed:() {
                      onSkipPressed();
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Color(0xFF7C7C83), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),),
                      child: CircularProgressIndicator(color: Colors.blue)),
                ),),),
        ],
      ),
    );
  }
}
