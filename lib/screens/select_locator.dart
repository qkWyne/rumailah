import 'package:flutter/material.dart';
import 'package:rumailah/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLocator extends StatefulWidget {
  const SelectLocator({super.key});

  @override
  State<SelectLocator> createState() => _SelectLocatorState();
}

class _SelectLocatorState extends State<SelectLocator> {
  bool isLoading = false;
  int? selectedIndex;
  String? _storeAddress;
  String _searchQuery = "";
  final List<Map<String, dynamic>> stores = [
    {

      "name": "Rumailah Café - Corniche",
      "distance": "4 km",
      "address": "Al Corniche St - Al ‘Uwaid - Fujairah\nUnited Arab Emirates",
    },
    {

      "name": "Rumailah Café - Jumeirah",
      "distance": "4 km",
      "address":
      "809 Jumeirah St - Umm Suqeim-Umm Suqeim 3\nDubai - United Arab Emirates",
    },
    {

      "name": "Rumailah Café - Dibba",
      "distance": "4 km",
      "address": "Sambaraid -\nFujairah - United Arab Emirates",
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadSelectedStore();
  }

  _loadSelectedStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = prefs.getInt("selected_store");
    });
  }

  _saveSelectedStore(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("selected_store", index);
  }

  void onSelectPressed() async {
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
        MaterialPageRoute(builder: (context) => Home(storeAddress: _storeAddress!,)),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredStores = stores
        .where((store) =>
        store["name"].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child:Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: Container(
                color: Color(0xFFF7F6F6),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0))
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(
                              color: Color(0xFF4D5E47),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Select Locator",
                            style: TextStyle(
                              color: Color(0xFF4D5E47),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Please tell us your Favorite Location",
                            style: TextStyle(
                              color: Color(0xFF65656F),
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              width: 350,
                              height: 60,
                              child: TextField(
                                onChanged:  (value) {
                                  setState(() {
                                    _searchQuery = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "Search Store",
                                  hintStyle: TextStyle(color: Color(0xFF65656F)),
                                  prefixIcon:
                                  Icon(Icons.search, color: Color(0xFF65656F)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFF4D5E47)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xFFD5D5D5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: ListView.builder(
                            itemCount: filteredStores.length,
                            itemBuilder: (context, index) {
                              final store = filteredStores[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    _storeAddress = store["name"];
                                  });
                                  _saveSelectedStore(index);
                                  onSelectPressed();
                                },
                                child: Container(
                                  width: 300,
                                  height: 150,
                                  margin: EdgeInsets.only(bottom: 12),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2)),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Radio(
                                        value: index,
                                        groupValue: selectedIndex,
                                        activeColor: Color(0xFFEF6010),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedIndex = value;
                                            _storeAddress = store["name"];
                                          });
                                          _saveSelectedStore(index);
                                          onSelectPressed();
                                        },
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${store["name"]}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color(
                                                    0xFF4E5D3B), // Greenish color
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "${store["distance"]}",
                                              style: TextStyle(
                                                  color: Color(0xFF07074F),
                                                  fontSize: 14),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              store["address"].toString(),
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
