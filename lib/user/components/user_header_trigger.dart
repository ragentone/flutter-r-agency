import 'package:app/user/components/user_card.dart';
import 'package:app/user/const.dart';
import 'package:app/user/services/user_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../dialogs/dialog_user_logout_confirm.dart';

class UserHeaderTrigger extends StatefulWidget {
  const UserHeaderTrigger({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UserHeaderTrigger> {
  @override
  Widget build(BuildContext contextMain) {
    return ValueListenableBuilder(
      valueListenable: UserAuthService.meta,
      builder: (_, value, _) {
        if (value != null) {
          return FButton.raw(
            onPress: () {
              showFSheet(
                context: context,
                builder: (contextSheet) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: contextSheet.theme.colors.background,
                    ),
                    child: FSidebar(
                      header: UserCard(),
                      footer: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
                            child: FButton(
                              size: FButtonSizeVariant.sm,
                              variant: FButtonVariant.destructive,
                              onPress: () {
                                Navigator.of(contextSheet).pop();
                              },
                              child: Text('Logout'),
                            ),
                          ),
                        ],
                      ),
                      children: [],
                    ),
                  );
                },
                side: FLayout.rtl,
              );
            },
            variant: FButtonVariant.ghost,
            child: FAvatar(
              image: NetworkImage(value.avatarUrl ?? ''),
              fallback: Icon(FLucideIcons.user),
            ),
          );
        }

        return FButton(
          onPress: () {
            context.go(routePathUserAuth);
          },
          size: FButtonSizeVariant.sm,
          variant: FButtonVariant.outline,
          child: Icon(FLucideIcons.logIn),
        );
      },
    );
  }
}
