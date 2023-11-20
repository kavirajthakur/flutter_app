// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class Api extends StatefulWidget {
//   const Api({super.key});

//   @override
//   State<Api> createState() => _ApiState();
// }

// class _ApiState extends State<Api> {
//   var jsonList;
//   @override 
//   void initState() { 
//     getData(); 
//   } 
  
//   void getData() async { 
//     try { 
//       var response = await Dio() 
//           .get('https://jsonplaceholder.typicode.com/posts'); 
//           if(response==200){
//             setState(() {
//               jsonList=response.data['id']as List;
//             });
//           }else{

//           }
      
//     } catch (e) { 
//       print(e); 
//     } 
//   } 
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightGreenAccent,
//         title: Text('API Integration'),
//       ),
//       body: ListView.builder(
//         itemBuilder: ,
//         itemCount: ,
//        ),
//     );
//   }
// }