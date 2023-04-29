import 'package:flutter/material.dart';
import 'package:universities/extensions/context_extension.dart';
import 'package:universities/widgets/university_tile.dart';
import '../services/api_service.dart';
import '../widgets/custom_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  String university = '';
  String country = '';

  void init() async {
    var result = await apiService.searchUniversity(university, country);
    print(result);
  }

  void onSearch() {
    setState(() {
      university = universityController.text;
      country = countryController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            CustomInput(
              icon: Icons.school,
              hintText: 'Enter univerisity name',
              controller: universityController,
            ),
            const SizedBox(height: 5),
            CustomInput(
              icon: Icons.flag,
              hintText: 'Enter country name',
              controller: countryController,
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: context.screensize.width * 0.7,
              child: ElevatedButton.icon(
                onPressed: onSearch,
                icon: const Icon(Icons.search),
                label: const Text('Search'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.surfaceVariant,
                  foregroundColor: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Results showing from $country',
              style: const TextStyle(color: Colors.black38),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: FutureBuilder(
                future: apiService.searchUniversity(university, country),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }
                  var data = snapshot.data ?? [];
                  if (data.isEmpty) {
                    return const Center(child: Text('No results found'));
                  }

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) =>
                        UniversityListTile(data: data[index]),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
