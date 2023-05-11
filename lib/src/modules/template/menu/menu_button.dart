import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';
import 'menu_enum.dart';

class MenuButton extends StatelessWidget {
  final MenuEnum menu;
  final MenuEnum? menuSelected;
  final ValueChanged<MenuEnum> onPressed;

  const MenuButton({
    super.key,
    required this.menu,
    required this.onPressed,
    this.menuSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = menuSelected == menu;
    return LayoutBuilder(
      builder: (_, constrains) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => onPressed(menu),
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              decoration: isSelected
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xfffff5e2),
                    )
                  : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/icons/${isSelected ? menu.assetIconSelected : menu.assetIcon}',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      menu.label,
                      overflow: TextOverflow.ellipsis,
                      style: isSelected
                          ? context.textStyles.textBold
                          : context.textStyles.textRegular,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
