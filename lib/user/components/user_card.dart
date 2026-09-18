import 'package:app/user/services/user_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<StatefulWidget> createState() => UserCardState();
}

class UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: UserAuthService.meta,
      builder: (ctx, value, child) {
        final String? alias = value?.alias;
        final String? email = value?.email;
        final String? avatarUrl = value?.avatarUrl;

        if (alias == null || email == null) {
          return SizedBox(height: 0, width: .infinity);
        }

        return Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            spacing: 8,
            children: [
              FAvatar(
                image: NetworkImage(avatarUrl ?? ''),
                fallback: const Icon(FLucideIcons.user),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    alias,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(email, style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
