part of home_page.dart;

class TopIcons extends StatelessWidget {
  const TopIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 32),
          child: Icon(
            Icons.window,
            size: context.width / 15,
            color: AppColors.color1,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 32),
          child: Icon(
            Icons.search_rounded,
            size: context.width / 15,
            color: AppColors.color1,
          ),
        ),
      ],
    );
  }
}
