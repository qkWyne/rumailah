import 'package:flutter/material.dart';
import 'package:rumailah/screens/select_order_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectStoreLocation extends StatefulWidget {
  const SelectStoreLocation({super.key});

  @override
  State<SelectStoreLocation> createState() => _SelectStoreLocationState();
}

class _SelectStoreLocationState extends State<SelectStoreLocation> {
  int? selectedIndex;
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Location",
            style: TextStyle(color: Color(0xFF6E7075)),
          ),
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
                        "Select Store",
                        style: TextStyle(
                          color: Color(0xFF4D5E47),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please tell us your Favorite Shop",
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
                        itemCount: stores.length,
                        itemBuilder: (context, index) {
                          final store = stores[index];
                          final storeName =store["name"];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              _saveSelectedStore(index);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectOrderMenu(storeName: storeName,)));

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
                                      });
                                      _saveSelectedStore(index);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectOrderMenu(storeName: storeName,)));
                                    },
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${stores[index]["name"]}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(
                                                0xFF4E5D3B), // Greenish color
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "${stores[index]["distance"]}",
                                          style: TextStyle(
                                              color: Color(0xFF07074F),
                                              fontSize: 14),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          stores[index]["address"].toString(),
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
    );
  }
}
