import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/country_model.dart';
import '../providers/country_provider.dart';

class SelectCountryScreen extends StatefulWidget {
  @override
  _SelectCountryScreenState createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Country> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<CountryProvider>(context, listen: false);
    filteredCountries = provider.countries;
  }

  void _search(String query) {
    final provider = Provider.of<CountryProvider>(context, listen: false);
    setState(() {
      filteredCountries = provider.searchCountries(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text("Select Your Country")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: _search,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Country",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                return ListTile(
                  leading: Text(country.flag, style: TextStyle(fontSize: 24)),
                  title: Text(country.name),
                  onTap: () {
                    provider.selectCountry(country.name);
                    Navigator.pop(context); // Go back with selection
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
