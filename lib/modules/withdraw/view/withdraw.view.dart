import 'package:flip_coin/components/loadingPage/loadingPage.component.dart';
import 'package:flip_coin/components/primaryButton.component.dart';
import 'package:flip_coin/components/textField.component.dart';
import 'package:flip_coin/modules/withdraw/controller/withdraw.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/assets.util.dart';

class WithdrawView extends StatelessWidget {
  WithdrawView({super.key});

  final WithdrawController withdrawController = WithdrawController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surfaceBright,
      body: Center(
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 450),
          decoration: BoxDecoration(
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
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Navigator.canPop(context)
                        ? MaterialButton(
                            onPressed: () => Get.back(),
                            minWidth: 0,
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            child: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: context.theme.colorScheme.onSurface,
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(width: 10),
                    Text(
                      "Withdraw Coin",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  children: [
                    Container(
                      width: double.infinity,
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(18)),
                        color: context.theme.colorScheme.primaryContainer.withOpacity(0.4),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AssetsUtil.getWalletAnimation(),
                            // height: 60,
                            width: 40,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Win",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              Obx(
                                  ()=> Text(
                                  "₹${withdrawController.truncateToDecimalPlaces(withdrawController.dataService.coinData.value.winCoin??0)}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: context.theme.colorScheme.surfaceContainer,
                        border: Border.all(color: context.theme.colorScheme.primary),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Enter Amount to Withdraw",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextFieldComponent(
                            textEditingController: withdrawController.amountController,
                            hintText: "Enter Amount",
                            textInputType: TextInputType.number,
                            maxLength: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(18)),
                        color: context.theme.colorScheme.primaryContainer.withOpacity(0.4),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Withdraw Options",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: context.theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 15),
                          MaterialButton(
                            onPressed: () => withdrawController.onWithdrawOptionClick(),
                            minWidth: 0,
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            child: Column(
                              children: [
                                Image.asset(
                                  AssetsUtil.getBank(),
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  "Bank Account",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "Linked Account",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: context.theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => withdrawController.isLoading.value
                                ? LoadingPage.listLoading()
                                : withdrawController.bankAccountDataList.isEmpty
                                    ? Text(
                                        "No Account is linked yet.",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: context.theme.colorScheme.outline,
                                        ),
                                      )
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        primary: false,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: withdrawController.bankAccountDataList.length,
                                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                                        itemBuilder: (context, index) => MaterialButton(
                                          onPressed: () => withdrawController.selectBankAccount(withdrawController.bankAccountDataList[index].id ?? ""),
                                          minWidth: 0,
                                          padding: EdgeInsets.zero,
                                          visualDensity: VisualDensity.compact,
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              border: Border.all(color: context.theme.colorScheme.outline.withOpacity(0.5)),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  AssetsUtil.getBank(),
                                                  height: 40,
                                                  width: 40,
                                                ),
                                                const SizedBox(width: 10),
                                                Flexible(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        RichText(
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          text: TextSpan(
                                                            text: "Name: ",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500,
                                                              color: context.theme.colorScheme.onSurface.withOpacity(0.75),
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: withdrawController.bankAccountDataList[index].accountHolderName ?? "",
                                                                style: TextStyle(
                                                                  color: context.theme.colorScheme.onSurface,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        RichText(
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          text: TextSpan(
                                                            text: "A/c No.: ",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500,
                                                              color: context.theme.colorScheme.onSurface.withOpacity(0.75),
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: withdrawController.bankAccountDataList[index].accountNumber ?? "",
                                                                style: TextStyle(
                                                                  color: context.theme.colorScheme.onSurface,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        RichText(
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          text: TextSpan(
                                                            text: "IFSC Code: ",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500,
                                                              color: context.theme.colorScheme.onSurface.withOpacity(0.75),
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: withdrawController.bankAccountDataList[index].ifscCode ?? "",
                                                                style: TextStyle(
                                                                  color: context.theme.colorScheme.onSurface,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Obx(
                                                  ()=> Icon(
                                                    withdrawController.selectedAccount.value == withdrawController.bankAccountDataList[index].id
                                                        ? Icons.radio_button_checked_outlined
                                                        : Icons.radio_button_unchecked_outlined,
                                                    size: 18,
                                                    color: withdrawController.selectedAccount.value == withdrawController.bankAccountDataList[index].id
                                                        ? context.theme.colorScheme.onSurface
                                                        : context.theme.colorScheme.outline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                          ),
                          const SizedBox(height: 30),
                          PrimaryButtonComponent(
                            onClick: () => withdrawController.withdrawCoin(),
                            text: "Withdraw Now",
                            width: double.infinity,
                            btnColor1: context.theme.colorScheme.tertiary,
                            btnColor2: context.theme.colorScheme.tertiaryFixed,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
