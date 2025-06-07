import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final dynamic snackModel;

  const DetailPage({super.key, required this.snackModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8e9da),
      appBar: AppBar(
        backgroundColor: const Color(0xfff8e9da),
        centerTitle: true,
        toolbarHeight: 100,
        leadingWidth: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xfff3f5e5),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff151414).withOpacity(0.3),
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                ),
              ],
            ),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        title: const Text(
          'Delicious',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            info(),
            const SizedBox(height: 4),
            orderButton(),
          ],
        ),
      ),
    );
  }

  Widget info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 105,
              height: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: widget.snackModel.colorBox,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(widget.snackModel.image),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.snackModel.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/priceRedSmolliconLabe.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.snackModel.price.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          widget.snackModel.description,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Species level',
          style: TextStyle(

            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Text(
                widget.snackModel.speciesLevel[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                ),
              );
            },
            separatorBuilder: (context, index) =>
            const SizedBox(width: 22),
            itemCount: widget.snackModel.speciesLevel.length,
          ),
        ),
      ],
    );
  }

  Widget orderButton() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              hintText: 'Input address...',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.home,
                color: Colors.black,
                size: 25,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () {},
            height: 55,
            minWidth: double.infinity,
            elevation: 0,
            color: const Color(0xff55cc6d),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Оформить заказ',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xfff3f3da),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
