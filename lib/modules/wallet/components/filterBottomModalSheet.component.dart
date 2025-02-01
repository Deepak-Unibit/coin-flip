import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/primaryButton.component.dart';

class FilterBottomModalSheetComponent {
  static show({
    required List filterList,
    required RxInt selectedFilter,
    required Function onItemClick,
    required Function onApplyClick,
    required Function onClearClick,
  }) {
    return showModalBottomSheet(
      context: Get.context!,
      builder: (context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 450),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.theme.colorScheme.surfaceDim,
              context.theme.colorScheme.surfaceBright,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 30),
                Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                MaterialButton(
                  onPressed: () => Get.back(),
                  minWidth: 0,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Obx(
              () => Wrap(
                spacing: 10,
                runSpacing: 10,
                children: filterList
                    .map(
                      (amount) => MaterialButton(
                        onPressed: () => onItemClick(filterList.indexOf(amount) + 1),
                        minWidth: 0,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: context.theme.colorScheme.outline.withOpacity(0.5)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                selectedFilter.value == (filterList.indexOf(amount) + 1) ? context.theme.colorScheme.surfaceContainerLow : context.theme.colorScheme.secondaryContainer,
                                selectedFilter.value == (filterList.indexOf(amount) + 1) ? context.theme.colorScheme.surfaceContainerHigh : context.theme.colorScheme.secondaryContainer,
                              ],
                            ),
                          ),
                          child: Text(
                            "$amount",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: context.theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButtonComponent(
                  onClick: () => onClearClick(),
                  text: "Clear",
                  height: 35,
                  width: 100,
                  btnColor1: context.theme.colorScheme.secondaryContainer.withOpacity(0.75),
                  btnColor2: context.theme.colorScheme.secondaryContainer.withOpacity(0.75),
                ),
                PrimaryButtonComponent(
                  onClick: () => onApplyClick(),
                  text: "Apply",
                  height: 35,
                  width: 100,
                  btnColor1: context.theme.colorScheme.tertiary,
                  btnColor2: context.theme.colorScheme.tertiaryFixed,
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
