import 'package:flutter/material.dart';

import 'class.dart';

class GST extends StatefulWidget {
  const GST({super.key});

  @override
  State<GST> createState() => _GSTState();
}

class _GSTState extends State<GST> {
  bool _isShow = false;
  late int principal,interest,years,months;
  late int amount,gst;
  late double cost;
  late double SI;
  bool incl = false;

  TextEditingController amt = TextEditingController();
  TextEditingController cos = TextEditingController();
  TextEditingController cosinc = TextEditingController();
  TextEditingController net = TextEditingController();
  TextEditingController netinc = TextEditingController();
  TextEditingController gs = TextEditingController();


  List c =[ ];
  List lis =[ ];
  int? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Image.asset("assets/logo.png",fit: BoxFit.fill,)),
        ),
        backgroundColor: Colors.black,
        title: Text("GST Calculator",style: titlecol),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        onPressed: (){
                          setState(() {
                            amt.clear();
                            net.clear();
                            gs.clear();
                            cos.clear();
                            cosinc.clear();
                            netinc.clear();


                          });

                        }, child: Text("Clear",style: TextStyle(color: Colors.white),)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RadioListTile<int>(
                    title: Row(
                      children: [
                        const Text('Exclusive  ',style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 6,),
                        Expanded(child: const Text('(Select to calculate Exclusive GST tax)',style: TextStyle(fontSize: 12),)),
                      ],
                    ),
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _isShow = false;
                        selectedOption = value;
                        print("Selected Option: $selectedOption");
                      });
                    },
                  ),
                  SizedBox(width: 10,),
                  RadioListTile<int>(
                    title: Row(
                      children: [
                        const Text('Inclusive ',style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(width: 6,),
                        Expanded(child: const Text('(Select to calculate Exclusive GST tax)',style: TextStyle(fontSize: 12),)),
                      ],
                    ),
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _isShow = true;
                        selectedOption = value;
                        print("Selected Option: $selectedOption");
                      });
                    },
                  ),




                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 10),
                    child: Text("Enter Amount : ",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 10),
                    child: Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 2),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(controller: amt,

                          ),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 10),
                    child: Text("Enter GST%   :",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(top: 8.0,left: 25),
                     child: Container(
                        height: 40,
                        width: 140,
                         decoration: BoxDecoration(
                             border: Border.all(color: Colors.black,width: 2),
                             borderRadius: BorderRadius.circular(10)
                         ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(controller: gs,
                          ),
                        )),
                   ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(thickness: 10,color: Colors.black,),

              Visibility(
                visible: !_isShow,
                child: Container(
                  height: 270,

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Exclusive",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                              onPressed: (){
                            setState(() {
                              amount=int.parse(amt.text);
                              gst=int.parse(gs.text);
                              cost=(amount*gst)/100;
                              cos.text=cost.toStringAsFixed(2).toString();

                            });

                          }, child: Text("Gst amount",style: TextStyle(color: Colors.white),)),
                        ),
                        Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 2),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(

                                controller: cos,),
                            )),
                      ],),//
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                              onPressed: (){
                            setState(() {
                              var tot=cost+amount;
                              net.text=tot.toStringAsFixed(2).toString();

                            });

                          }, child: Text("Net amount",style: TextStyle(color: Colors.white),)),
                        ),
                        Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 2),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(controller: net,),
                            )),

                      ],),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Tax exclusive indicates that tax is not included in the line amount for this item."),
                      ),
                      Divider(thickness: 10,color: Colors.black,),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _isShow,
                child: Container(
                  height: 270,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Inclusive",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                              onPressed: (){
                            setState(() {
                              amount=int.parse(amt.text);
                              gst=int.parse(gs.text);
                              cost=(amount*gst)/(100+gst);
                              cosinc.text=cost.toStringAsFixed(2).toString();
                              print(cosinc);

                            });

                          }, child: Text("Gst amount",style: TextStyle(color: Colors.white),

                          )),
                        ),
                        Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 2),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                // decoration: InputDecoration(
                                //     border: OutlineInputBorder(
                                //
                                //     )
                                // ),
                                controller: cosinc,),
                            )),
                      ],),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                              onPressed: (){
                            setState(() {
                              var tot=amount-cost;
                              netinc.text=tot.toStringAsFixed(2).toString();

                            });

                          }, child: Text("Net amount",style: TextStyle(color: Colors.white),)),
                        ),

                        Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 2),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(

                                controller: netinc,
                                // decoration: InputDecoration(
                                //     border: OutlineInputBorder(
                                //
                                //     )
                                // ),
                              ),
                            )),

                      ],),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Tax inclusive indicates that the line amount for an item includes the tax for this item."),
                      ),
                      Divider(thickness: 10,color: Colors.black,),
                    ],
                  ),
                ),
              ),
              



            ],
          ),),
      ),
    );
  }
}
