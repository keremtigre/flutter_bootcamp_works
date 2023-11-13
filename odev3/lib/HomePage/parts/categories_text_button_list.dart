part of home_page.dart;

// ignore: camel_case_types
class categoriesButtonList extends StatelessWidget {
  const categoriesButtonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final d = AppLocalizations.of(context);
    final List<String> categories =
        d != null ? [d.c1, d.c2, d.c3, d.c4, d.c5] : [];
    return SizedBox(
      width: double.infinity,
      height: context.height / 20,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            createCategoryButton(context, index, categories[index]),
      ),
    );
  }

  TextButton createCategoryButton(
      BuildContext context, index, String category) {
    return TextButton(
        onPressed: () {},
        child: Text(
          category,
          style: TextStyle(
              color: index != 0
                  ? Colors.black54
                  : AppColors.color1.withOpacity(0.8),
              fontWeight: FontWeight.bold,
              fontSize: context.width / 25),
        ));
  }
}
