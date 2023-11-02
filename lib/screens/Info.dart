import 'package:doctor_appointment_app/screens/Tips.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  List<String> displayText = [
    'Colon cancer is a type of cancer that begins in the large intestine (colon). The colon is the final part of the digestive tract.',
    'Colon cancer typically affects older adults, though it can happen at any age. It usually begins as small, noncancerous (benign) clumps of cells called polyps that form on the inside of the colon. Over time some of these polyps can become colon cancers.',
    'Colon cancer is sometimes called colorectal cancer, which is a term that combines colon cancer and rectal cancer, which begins in the rectum.',
  ];
  int selectedButton = 0;

  void changeText(List<String> newText, int buttonIndex) {
    setState(() {
      displayText = newText;
      selectedButton = buttonIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Page'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'main');
          },
          color: Colors.grey,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      changeText(
                        [
                          'Colon cancer is a type of cancer that begins in the large intestine (colon). The colon is the final part of the digestive tract.',
                          'Colon cancer typically affects older adults, though it can happen at any age. It usually begins as small, noncancerous (benign) clumps of cells called polyps that form on the inside of the colon. Over time some of these polyps can become colon cancers.',
                          'Colon cancer is sometimes called colorectal cancer, which is a term that combines colon cancer and rectal cancer, which begins in the rectum.',
                        ],
                        0,
                      );
                    },
                    child: Text(
                      'Overview',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary:
                          selectedButton == 0 ? Colors.purple : Colors.grey,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      changeText(
                        [
                          'Signs and symptoms of colon cancer include:',
                          '1- Unexplained weight loss',
                          '2- Rectal bleeding or blood in your stool',
                          '3- A feeling that your bowel doesn\'t empty completely',
                          '4- Persistent abdominal discomfort, such as cramps, gas, or pain',
                          '5- A persistent change in your bowel habits, including diarrhea or constipation or a change in the consistency of your stool',
                          '6- Many people with colon cancer experience no symptoms in the early stages of the disease. When symptoms appear, they\'ll likely vary, depending on the cancer\'s size and location in your large intestine.',
                        ],
                        1,
                      );
                    },
                    child: Text(
                      'Symptoms',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary:
                          selectedButton == 1 ? Colors.purple : Colors.grey,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      changeText(
                        [
                          'If your signs and symptoms indicate that you could have colon cancer, your doctor may recommend one or more tests and procedures, including:',
                          '1- Using a scope to examine the inside of your colon (colonoscopy). Colonoscopy uses a long, flexible, and slender tube attached to a video camera and monitor to view your entire colon and rectum. If any suspicious areas are found, your doctor can pass surgical tools through the tube to take tissue samples (biopsies) for analysis and remove polyps.',
                          '2- Blood tests. No blood test can tell you if you have colon cancer. But your doctor may test your blood for clues about your overall health, such as kidney and liver function tests.',
                          'If you\'ve been diagnosed with colon cancer, your doctor may recommend tests to determine the extent (stage) of your cancer. Staging helps determine what treatments are most appropriate for you.',
                          'Staging tests may include imaging procedures such as abdominal, pelvic, and chest CT scans. In many cases, the stage of your cancer may not be fully determined until after colon cancer surgery.',
                          'The stages of colon cancer are indicated by Roman numerals that range from 0 to IV, with the lowest stages indicating cancer that is limited to the lining of the inside of the colon. By stage IV, the cancer is considered advanced and has spread (metastasized) to other areas of the body.',
                        ],
                        2,
                      );
                    },
                    child: Text(
                      'Cancer',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary:
                          selectedButton == 2 ? Colors.purple : Colors.grey,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Flexible(
                    child: ElevatedButton(
                  onPressed: () {
                    changeText(
                      [
                        'Surgery is the most common treatment for colon cancer. The type of surgery depends on the stage and location of the cancer.',
                        '1- Surgery for early-stage colon cancer: If your colon cancer is very small, your doctor may recommend a minimally invasive approach to surgery.',
                        '2- Surgery for more advanced colon cancer: If the cancer has grown into or through your colon, your surgeon may recommend a partial colectomy. During this procedure, the surgeon removes the part of your colon that contains the cancer, along with a margin of normal tissue on either side of the cancer. Lymph node removal is also performed to check for the spread of cancer.',
                        '3- Surgery for advanced cancer: If your cancer is very advanced or your overall health is poor, your surgeon may recommend an operation to relieve symptoms caused by a blockage, bleeding, or pain. This surgery aims to improve your quality of life rather than curing the cancer.',
                      ],
                      3,
                    );
                  },
                  child: Text(
                    'Surgery',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: selectedButton == 3 ? Colors.purple : Colors.grey,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )),
                Flexible(
                    child: ElevatedButton(
                  onPressed: () {
                    changeText(
                      [
                        'The treatment options for colon cancer include chemotherapy and radiation therapy.',
                        '1- Chemotherapy: It involves the use of drugs to kill cancer cells. Chemotherapy may be given after surgery to eliminate any remaining cancer cells and reduce the risk of recurrence. It can also be used before surgery to shrink large tumors or to relieve symptoms in advanced cases.',
                        '2- Radiation therapy: It uses high-energy beams to destroy cancer cells. Radiation therapy is often used before surgery to shrink tumors or after surgery to kill remaining cancer cells. It can also be used to alleviate symptoms in advanced cases when surgery is not possible.',
                      ],
                      4,
                    );
                  },
                  child: Text(
                    'Treatment',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: selectedButton == 4 ? Colors.purple : Colors.grey,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )),

              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: displayText.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[200],
                    margin: EdgeInsets.only(bottom: 8),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        displayText[index],
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
