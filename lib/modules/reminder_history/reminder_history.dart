import 'package:flutter/material.dart';
import 'package:project/components/custom_color.dart';
import 'package:project/modules/home/home_screen.dart';
import 'package:project/modules/reminder/reminder.dart';

class PrescriptionHistory extends StatelessWidget {
  const PrescriptionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: CustomColor.blue11,
          ),
          onPressed: ()
          {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
        title: Text(
          'Prescription History',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 350.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: Offset.zero,
                )
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: CustomColor.blue11,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: CustomColor.blue11,
                    ),
                    onPressed: ()
                    {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PrescriptionScreen(),
                        ),
                      );
                    },
                  )
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 1 / 1.3,
              children: List.generate(
                  20, (index) => const PrescriptionHistoryComponent()),
            ),
          ),
        ],
      ),
    );
  }
}

class PrescriptionHistoryComponent extends StatelessWidget {
  const PrescriptionHistoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          children: [
            Container(
              child: const Image(
                image: AssetImage(
                    'assets/images/reminder/rosheta.png'
                ),
                width: 90,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    'Title  : Heart Diseases',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    'Date :  ${DateTime.now().toString().substring(0, 10)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}