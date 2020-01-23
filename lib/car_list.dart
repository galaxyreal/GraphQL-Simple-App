import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CarListView extends StatelessWidget {
  final String query = '''
                      query {
                           allCars{
                              _id
                              name
                            }
                      }
                  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Cars'),
      ),
      body: Query(
        options: QueryOptions(document: query),
        builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
          if (result.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (result.data == null) {
            return Center(child: Text('Cars not found.'));
          }

          return _carsView(result);
        },
      ),
    );
  }

  ListView _carsView(QueryResult result) {
    final carList = result.data['allCars'];
    print(carList);
    return ListView.separated(
      itemCount: carList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(carList[index]["name"]),         
          leading: Text(carList[index]["_id"]),
          // onTap: () {
          //   final snackBar = SnackBar(
          //       content:
          //           Text('Selected Country: ${countryList[index]['name']}'));
          //   Scaffold.of(context).showSnackBar(snackBar);
          // },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
