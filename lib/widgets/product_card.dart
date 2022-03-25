import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String text, imageDirectory;
  final double prevPrice, currentPrice, discount, creditVal;
  const ProductCard(this.text, this.prevPrice, this.currentPrice,
      this.discount, this.creditVal, this.imageDirectory);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.asset(
                    widget.imageDirectory,
                    height: 250,
                    width: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    // left: 120,
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      height: 20,
                      width: 80,
                      child: Center(
                        child: Text("${widget.discount}% OFF"),
                      ),
                    )),
                Positioned(
                    left: 10,
                    top: 10,
                    //   right: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      height: 20,
                      width: 60,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.asset(
                              "assets/images/coin.png",
                              height: 20,
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(widget.creditVal.toString()),
                        ],
                      ),
                    ))
              ],
            ),
            Text(widget.text),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Rs. ${widget.prevPrice}',
                    style: const TextStyle(decoration: TextDecoration.lineThrough)),
                Text("  Rs. ${widget.currentPrice}")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 100,
                ),
                SizedBox(
                  height: 30,
                  width: 120,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _itemCount != 0
                          ? IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => setState(() => _itemCount--),
                            )
                          : const SizedBox(
                              width: 60,
                            ),
                      Text(_itemCount.toString()),
                      IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => setState(() => _itemCount++)),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
