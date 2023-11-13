part of home_page.dart;

class BottomWidgets extends StatelessWidget {
  const BottomWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final d = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.only(left: 16),
      width: double.infinity,
      height: context.height / 9,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 10.0,
          spreadRadius: 0.0,
          offset: Offset(0.0, 2.0), // shadow direction: bottom right
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            d.newPageText,
            style: TextStyle(
                color: AppColors.color1,
                fontWeight: FontWeight.bold,
                fontSize: context.width / 25),
          ),
          const Spacer(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: Data.bottomIcons,
              ),
            ),
          )
        ],
      ),
    );
  }
}
