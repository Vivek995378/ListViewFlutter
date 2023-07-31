import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Contact{
  late String name;
  late String phone;

  Contact({
    this.name = "",
    this.phone = "",
  });
}

class _MyHomePageState extends State<MyHomePage> {

  List? apiData;
  Map? mapResponse;

  List<Contact> listOfContacts = [ Contact(name: "Ritika", phone: "xxxxxx1000"), Contact(name: "Yatin Batra", phone: "xxxxxx1001"), Contact(name: "Vaibhav Bansal", phone: "xxxxxx1002"),
                         Contact(name: "Ankit Rana", phone: "xxxxxx1003"), Contact(name: "Maharash Patel", phone: "xxxxxx1004"), Contact(name: "Raghav", phone: "xxxxxx1005"),
                         Contact(name: "Vivek", phone: "xxxxxx1006"), Contact(name: "Rahul", phone: "xxxxxx1007"), Contact(name: "Sahil Dhiraan", phone: "xxxxxx1008"),
                         Contact(name: "Rohit Gahlot", phone: "xxxxxx1009"), Contact(name: "Om Mehta", phone: "xxxxxx1010"), Contact(name: "Akash Kanojia", phone: "xxxxxx1011"),
                         Contact(name: "Bhavna Goel", phone: "xxxxxx1012"), Contact(name: "Vibhor Aggarwal", phone: "xxxxxx1013"), Contact(name: "Aakash Choudhary", phone: "xxxxxx1014"),
                         Contact(name: "Ritika", phone: "xxxxxx1000"), Contact(name: "Yatin Batra", phone: "xxxxxx1001"), Contact(name: "Vaibhav Bansal", phone: "xxxxxx1002"),
                         Contact(name: "Ankit Rana", phone: "xxxxxx1003"), Contact(name: "Maharash Patel", phone: "xxxxxx1004"), Contact(name: "Raghav", phone: "xxxxxx1005"),
                         Contact(name: "Vivek", phone: "xxxxxx1006"), Contact(name: "Rahul", phone: "xxxxxx1007"), Contact(name: "Sahil Dhiraan", phone: "xxxxxx1008"),
                         Contact(name: "Rohit Gahlot", phone: "xxxxxx1009"), Contact(name: "Om Mehta", phone: "xxxxxx1010"), Contact(name: "Akash Kanojia", phone: "xxxxxx1011"),
                         Contact(name: "Bhavna Goel", phone: "xxxxxx1012"),Contact(name: "Vibhor Aggarwal", phone: "xxxxxx1013"), Contact(name: "Aakash Choudhary", phone: "xxxxxx1014")];

  Future apiCall()async{
    http.Response apiResponse;
  //  apiResponse = await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
    apiResponse = await http.get(Uri.parse("https://randomuser.me/api/?results=100"));
    if(apiResponse.statusCode==200){
      setState(() {
        mapResponse = json.decode(apiResponse.body);
      //  apiData = mapResponse["data"];
        apiData = mapResponse!["results"];
      });
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: SafeArea(
        /* Data From Api Source 2 */
        child: apiData==null? CircularProgressIndicator() : ListView.builder(
            itemCount: apiData?.length,
            itemBuilder: (context, index){
              Map userName = apiData?[index]["name"];
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(apiData![index]["picture"]["medium"].toString()),
                ),
                title: Text(userName["title"]+" "+userName["first"]+" "+userName["last"]),
                subtitle: Text(apiData![index]["phone"].toString()),
                trailing: Text(apiData![index]["gender"][0].toString().toUpperCase()+apiData![index]["gender"].toString().substring(1)),
              );
            }),
        /* Data From Api Source 1 */
        // child: ListView.builder(
        //     itemCount: apiData == null?0:apiData.length,
        //     itemBuilder: (context, index){
        //       return ListTile(
        //         leading: CircleAvatar(
        //           child: Image.network(apiData[index]["avatar"].toString()),
        //         ),
        //         title: Text(apiData[index]["first_name"].toString()),
        //         subtitle: Text(apiData[index]["last_name"].toString()),
        //         trailing: Text(apiData[index]["id"].toString()),
        //       );
        //     }),
   /* Data From Local Storage */
        // child: ListView.builder(
        //   itemCount: listOfContacts.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       leading: CircleAvatar(
        //         child: Text(listOfContacts[index].name.toString().split(" ")[0][0]),
        //       ),
        //       title: Text(listOfContacts[index].name),
        //       subtitle: Text(listOfContacts[index].phone),
        //     );
        //   },
        // ),
      ),
    );
  }
}
