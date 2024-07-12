import 'package:flutter/material.dart';
import 'package:realestate/core/constanat/colors.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("Assets/images/beta.png",width: 150,height: 150,),
            const Text("تم التطوير من قبل"),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('عن الشركة'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'Assets/images/CoustomLogo.PNG',
                  color: AppColors.greencolor,
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '----   من نحن   ----',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Tejwal",
                  color: Colors.teal,
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 10),
              const Text(
                'نحن في شركة هاوس تك  نقدم أفضل الخدمات لعملائنا. نسعى دائمًا لتقديم الحلول المثلى في مجال العقارات سواء كان ذلك في بيع، شراء أو تأجير العقارات.',
                style: TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.end
                ,
              ),
              SizedBox(height: 20),
              const Text(
                '----   مهمتنا   ----',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'مهمتنا هي توفير خدمات عالية الجودة لعملائنا ومساعدتهم في تحقيق أحلامهم في تملك العقارات. نحن نؤمن بأهمية الشفافية والمصداقية في جميع تعاملاتنا.',
                style: TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.end

              ),
              const SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }
}
