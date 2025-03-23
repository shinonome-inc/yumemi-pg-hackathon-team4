import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

enum StepType { gathering, cooking }

class StepsItem extends StatefulWidget {
  const StepsItem({
    super.key,
    required this.stepType,
    required this.stepList,
  });

  final StepType stepType;
  final List<String> stepList;

  @override
  State<StepsItem> createState() => _StepsItemState();
}

class _StepsItemState extends State<StepsItem> {
  late List<String> stepList;

  @override
  void initState() {
    super.initState();
    stepList = widget.stepList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          widget.stepType == StepType.gathering ? '採集方法' : '作り方',
          style: context.textTheme.titleMediumBold,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stepList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 4,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.gray3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.green1,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      minLines: 2,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: widget.stepType == StepType.gathering
                            ? '岩の隙間に隠れていることが多いので、そっと手を入れて探る。'
                            : 'フライパンに油を熱し、□□を中火で3分ほど炒める。',
                        hintStyle: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.gray3,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.gray4,
                      border: Border.all(
                        color: AppColors.gray3,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: AppColors.gray2,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: 40,
          alignment: Alignment.center,
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                stepList.add('');
              });
            },
            icon: const Icon(
              Icons.add,
              color: AppColors.green1,
            ),
            label: Text(
              widget.stepType == StepType.gathering ? '採集方法を追加' : '作り方を追加',
              style: const TextStyle(color: AppColors.green1),
            ),
          ),
        ),
      ],
    );
  }
}
