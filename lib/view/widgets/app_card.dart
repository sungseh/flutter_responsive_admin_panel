import 'package:flutter/material.dart'; 

class AppCard extends StatelessWidget {
  final String title;
  final int? number;

  const AppCard(
    this.title, 
    this.number, 
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(32),
        height: 180,
        width: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey[300]!, 
              blurRadius: 10, 
              offset: const Offset(3, 3)
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              height: 2,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(15)
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.trending_up,
                  size: 40,
                  color: Colors.deepPurpleAccent,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  number.toString(),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87
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

 