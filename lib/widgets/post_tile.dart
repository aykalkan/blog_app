import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(),
            title: Text("Tobias Van"),
            subtitle: Text("3 min to read"),
            trailing: IconButton(
              onPressed: () {
                return null;
              },
              icon: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
    );
  }
}
