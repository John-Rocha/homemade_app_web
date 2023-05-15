import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  var colapsed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: colapsed ? 90 : context.percentWidth(.18),
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: colapsed ? Alignment.center : Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  colapsed = !colapsed;
                });
              },
              icon: Icon(
                colapsed
                    ? Icons.keyboard_double_arrow_right
                    : Icons.keyboard_double_arrow_left,
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
                    Modular.to.navigate(menu.route);
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
