import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1prac/provider/favourite_provider.dart';
import 'package:provider1prac/screen/favourite/myfavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  // List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    // final favouriteProvider = Provider.of<FavouriteProvider>(context,listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite App'),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyFavourite()));
                },
                child: const Icon(Icons.favorite)),
            const SizedBox(width: 28)
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 1000,
                  itemBuilder: (context, index) {
                    return Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                        return ListTile(
                            onTap: () {
                              value.selectedItem.contains(index)
                                  ? value.removeItem(index)
                                  : value.addItem(index);
                            },
                            title: Text('item$index'),
                            trailing: Icon(value.selectedItem.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_outline));
                      },
                    );
                  }),
            )
          ],
        ));
  }
}
