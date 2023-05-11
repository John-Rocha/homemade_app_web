import 'package:flutter/material.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import 'menu_button.dart';
import 'menu_enum.dart';

class MenuBarWidget extends StatefulWidget {
  const MenuBarWidget({super.key});

  @override
  State<MenuBarWidget> createState() => _MenuBarWidgetState();
}

class _MenuBarWidgetState extends State<MenuBarWidget> {
  MenuEnum? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.percentWidth(.18),
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_double_arrow_right,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            itemCount: MenuEnum.values.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final menu = MenuEnum.values[index];
              return MenuButton(
                menu: menu,
                menuSelected: selectedMenu,
                onPressed: (MenuEnum menu) {
                  setState(() {
                    selectedMenu = menu;
                  });
                },
              );
            },
          )
        ],
      ),
    );
  }
}
