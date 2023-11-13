part of home_page.dart;

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final d = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
      child: Text(
        d.pageTitle,
        style: TextStyle(
          fontSize: context.width / 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
