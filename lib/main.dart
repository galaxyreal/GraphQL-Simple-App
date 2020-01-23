// import 'package:flutter/material.dart';
// import "package:graphql_flutter/graphql_flutter.dart";
// import "service/graphqlConf.dart";
// // import "component/principal.dart";

// GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

// void main() => runApp(
//       GraphQLProvider(
//         client: graphQLConfiguration.client,
//         child: CacheProvider(child: MyApp()),
//       ),
//     );

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GraphQL Example',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Container(
//         child: Text("data"),
//       ),
//       // home: Principal(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'car_list.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  	/// HttpLink - A system of modular components for GraphQL networking.
    final HttpLink httpLink =
        HttpLink(uri: 'https://32hu5x5zy9.execute-api.us-east-1.amazonaws.com/dev/graphql');
  
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GraphQLProvider(
        child: CarListView(),
        client: client,
      ),
    );
  }
}