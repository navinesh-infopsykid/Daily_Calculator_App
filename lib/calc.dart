import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'class.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(

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
        ),
        backgroundColor: Colors.black,
        title: Text("Calculator",style: titlecol),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(m,style: TextStyle(
                    fontSize: 50,fontWeight: FontWeight.w400,color: Colors.grey),),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w400),),
              ),
            ),
            Row(
              children: [
                numbutton("C"),
                numbutton("√"),
                numbutton("."),
                numbutton("/"),

              ],
            ),
            Row(
              children: [
                numbutton("7"),
                numbutton("8"),
                numbutton("9"),
                numbutton("x"),
              ],
            ),
            Row(
              children: [
                numbutton("4"),
                numbutton("5"),
                numbutton("6"),
                numbutton("-"),
              ],
            ),
            Row(
              children: [
                numbutton("1"),
                numbutton("2"),
                numbutton("3"),
                numbutton("+"),
              ],
            ),
            Row(
              children: [
                numbutton("⋀"),
                numbutton("0"),
                numbutton("="),
                numbutton("B"),

              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
  Widget numbutton(String v){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8,right: 5,left: 5),
        child: GestureDetector(
          onTap: ()=> btn(v),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text(v,style: TextStyle(fontSize: 45,color: Colors.black),))),
        ),
      ),
        // child: Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: OutlinedButton(onPressed: ()=> btn(v),
        //
        //       child: Text(v,style: TextStyle(fontSize: 45),)),
        // )
    );
  }
  String op="";
  String m="";
  String txt = "";
  String res = "";
  int a = 0; int b=0;
  int s=0;
  List B=[];
  int index=0;

  void btn(String bt){
    if(bt == 'C'){
      res="";
      txt='';
      m="";
      a=0;
      b=0;

    }else if(bt=='⋀'){
      a=int.parse(txt);
      res=(a * a).toString();
    }
    else if(bt =='+' ||
        bt =='-' ||
        bt =='x' ||
        bt =='/')
    {
      if(op=='+'){
        res=(a + b).toString();
      }
      if(op=='-'){
        res=(a - b).toString();
      }
      if(op=='x'){
        res=(a * b).toString();
      }
      if(op=='/'){
        res=(a / b).toString();

      }
      a=int.parse(txt);
      res="";
      op=bt;
      m=txt+op;
      // res=txt+bt;
    }else if(bt=='√'){
      a=int.parse(txt);
      res =Math.sqrt(a).toString();

    }else if (bt=='B'){
      // B.add(txt);
      // res=B.removeLast();
      a = txt.length;
      var ba=txt.substring(0,a-1);


      res=ba.toString();
    }
    else if (bt=='='){
      b=int.parse(txt);
      if(op=='+'){
        res=(a + b).toString();
      }
      if(op=='-'){
        res=(a - b).toString();
      }
      if(op=='x'){
        res=(a * b).toString();
      }
      if(op=='/'){
        res=(a / b).toString();

      }
    }else{
      res=txt+bt;
      B.add(txt);
      index=B.length;
      m=txt+bt;
    }
    setState(() {
      txt=res;

    });
  }
}

