import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/viewmodels/categories_viewmodel.dart';
import 'package:quiz_app/viewmodels/quiz_viewmodel.dart';
import '../models/categories_model.dart';

enum DropdownType { difficulty, amount, category }

class CustomDropDownButtonWidget extends StatefulWidget {
  final CategoriesViewModel categoriesViewModel;
  final DropdownType dropdownType;

  const CustomDropDownButtonWidget({
    Key? key,
    required this.categoriesViewModel,
    required this.dropdownType,
  }) : super(key: key);

  @override
  State<CustomDropDownButtonWidget> createState() => _CustomDropDownButtonWidgetState();
}

class _CustomDropDownButtonWidgetState extends State<CustomDropDownButtonWidget> {
  @override
  void initState() {
    super.initState();
    selectedValue = getSelectedValue();
  }

  @override
  void dispose() {
    super.dispose();
    resetSelectedValue();
  }

  dynamic getSelectedValue() {
    switch (widget.dropdownType) {
      case DropdownType.difficulty:
        return widget.categoriesViewModel.selectedDifficulty;
      case DropdownType.amount:
        return widget.categoriesViewModel.selectedAmount;
      case DropdownType.category:
        return widget.categoriesViewModel.selectedCategory;
    }
  }

  void resetSelectedValue() {
    switch (widget.dropdownType) {
      case DropdownType.difficulty:
        widget.categoriesViewModel.selectedDifficulty = null;
        break;
      case DropdownType.amount:
        widget.categoriesViewModel.selectedAmount = null;
        break;
      case DropdownType.category:
        widget.categoriesViewModel.selectedCategory = null;
        break;
    }
  }

  dynamic selectedValue;

  @override
  Widget build(BuildContext context) {
    final quizViewModel = Provider.of<QuizViewModel>(context);

    List<DropdownMenuItem> getDropdownItems() {
      switch (widget.dropdownType) {
        case DropdownType.difficulty:
          return widget.categoriesViewModel.difficulty.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Row(
                children: [
                  const Icon(Icons.category, color: Colors.blueAccent),
                  SizedBox(width: 8.w),
                  Text(e),
                ],
              ),
            );
          }).toList();
        case DropdownType.amount:
          return widget.categoriesViewModel.amount.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Row(
                children: [
                  const Icon(Icons.category, color: Colors.blueAccent),
                  SizedBox(width: 8.w),
                  Text(e),
                ],
              ),
            );
          }).toList();
        case DropdownType.category:
          return widget.categoriesViewModel.categories.categories?.map((e) {
                return DropdownMenuItem<Category>(
                  value: e,
                  child: Row(
                    children: [
                      const Icon(Icons.category, color: Colors.blueAccent),
                      SizedBox(width: 8.w),
                      Text(e.name ?? "test"),
                    ],
                  ),
                );
              }).toList() ??
              [];
      }
    }

    String getHintText() {
      switch (widget.dropdownType) {
        case DropdownType.difficulty:
          return widget.categoriesViewModel.selectedDifficulty ?? "Select Difficulty";
        case DropdownType.amount:
          return widget.categoriesViewModel.selectedAmount ?? "Select Amount";
        case DropdownType.category:
          return widget.categoriesViewModel.selectedCategory?.name ?? "Select Category";
      }
    }

    String getFieldName() {
      switch (widget.dropdownType) {
        case DropdownType.difficulty:
          return "Difficulty";
        case DropdownType.amount:
          return "Amount";
        case DropdownType.category:
          return "Category";
      }
    }

    void onChanged(dynamic value) {
      setState(() {
        selectedValue = value;
        switch (widget.dropdownType) {
          case DropdownType.difficulty:
            widget.categoriesViewModel.setSelectedDifficulty(value);
            break;
          case DropdownType.amount:
            widget.categoriesViewModel.setSelectedAmount(value);
            break;
          case DropdownType.category:
            widget.categoriesViewModel.setSelectedCategory(value);
            break;
        }
        // Update the quiz settings in QuizViewModel
        quizViewModel.updateQuizSettings(
          widget.categoriesViewModel.selectedCategory?.id.toString() ?? '',
          widget.categoriesViewModel.selectedDifficulty ?? '',
          widget.categoriesViewModel.selectedAmount ?? '',
        );
      });
    }

    String? validator(dynamic value) {
      if (value == null || value.toString().isEmpty) {
        return 'Choose your preference';
      }
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getFieldName(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: FormField<dynamic>(
            validator: validator,
            builder: (FormFieldState<dynamic> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton<dynamic>(
                      menuMaxHeight: 200.h,
                      enableFeedback: true,
                      isExpanded: true,
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500),
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                      items: getDropdownItems(),
                      onChanged: (value) {
                        onChanged(value);
                        state.didChange(value);
                      },
                      hint: Text(
                        getHintText(),
                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      ),
                    ),
                  ),
                  if (state.hasError)
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(
                        state.errorText ?? '',
                        style: TextStyle(color: Colors.red, fontSize: 12.sp),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
