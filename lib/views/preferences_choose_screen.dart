import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/helpers/extentions.dart';
import 'package:quiz_app/viewmodels/categories_viewmodel.dart';
import 'package:quiz_app/viewmodels/quiz_viewmodel.dart';
import '../routing/routes.dart';
import '../theme/custom_color.dart';
import '../widgets/dropdownbutton_widget.dart';

class PreferencesChooseScreen extends StatefulWidget {
  @override
  State<PreferencesChooseScreen> createState() => _PreferencesChooseScreenState();
}

class _PreferencesChooseScreenState extends State<PreferencesChooseScreen> {
  final _formKey = GlobalKey<FormState>();
  void _validateAndSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await Provider.of<QuizViewModel>(context, listen: false).fetchQuestions().then((value) => context.pushReplacementNamed(Routes.quizScreen));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your preferences"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<CategoriesViewModel>(
                builder: (BuildContext context, CategoriesViewModel viewModel, Widget? child) {
                  if (viewModel.categories.categories == null) {
                    viewModel.getCategories();
                  }
                  return CustomDropDownButtonWidget(categoriesViewModel: viewModel, dropdownType: DropdownType.category);
                },
              ),
              SizedBox(height: 20.h),
              Consumer<CategoriesViewModel>(
                builder: (BuildContext context, CategoriesViewModel viewModel, Widget? child) {
                  return CustomDropDownButtonWidget(categoriesViewModel: viewModel, dropdownType: DropdownType.amount);
                },
              ),
              SizedBox(height: 20.h),
              Consumer<CategoriesViewModel>(
                builder: (BuildContext context, CategoriesViewModel viewModel, Widget? child) {
                  return CustomDropDownButtonWidget(categoriesViewModel: viewModel, dropdownType: DropdownType.difficulty);
                },
              ),
              const Spacer(),
              GestureDetector(
                onTap: _validateAndSubmit,
                child: Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.primaryButtonColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black, width: .5),
                  ),
                  child: Center(
                    child: Text(
                      "Done! Let's Start =>",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
