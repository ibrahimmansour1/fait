import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/app_export.dart';
import '../../../providers/theme/theme_provider.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithDiseases extends ConsumerStatefulWidget {
  const ChatBotViewBodyWithDiseases({super.key});

  @override
  ConsumerState<ChatBotViewBodyWithDiseases> createState() =>
      _ChatBotViewBodyWithDiseasesState();
}

class _ChatBotViewBodyWithDiseasesState
    extends ConsumerState<ChatBotViewBodyWithDiseases> {
  List<String> selectedDiseases = [];

  final List<String> availableDiseases = [
    'Common cold',
    'Flu (Influenza)',
    'COVID-19',
    'Pneumonia',
    'Asthma',
    'Bronchitis',
    'Tuberculosis (TB)',
    'Diabetes',
    'Heart disease',
    'High blood pressure (Hypertension)',
    'Stroke',
    'Cancer',
    'Arthritis',
    'Osteoporosis',
    'Alzheimer\'s disease',
    'Parkinson\'s disease',
    'HIV/AIDS',
    'Hepatitis',
    'Malaria',
    'Dengue fever',
  ];

  void toggleInjury(String disease) {
    setState(() {
      if (selectedDiseases.contains(disease)) {
        selectedDiseases.remove(disease);
      } else {
        selectedDiseases.add(disease);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration:  BoxDecoration(
          color: themeHelper.getThemeData().colorScheme.background,
        ),
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomChatBotAppBar(),
                // const ChatMessageWidget(message: 'then $name'),
                const ChatMessageWidget(
                  message: 'Do you have any Diseases?',
                ),
                SizedBox(height: 10.v),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.builder(
                    itemCount: availableDiseases.length,
                    itemBuilder: (context, index) {
                      final disease = availableDiseases[index];
                      final isSelected = selectedDiseases.contains(disease);
                      return ListTile(
                          title: Text(
                            disease,
                            style: isSelected
                                ? CustomTextStyles.titleLargeInter
                                : CustomTextStyles.titleLargeInter
                                    .copyWith(color: Colors.white),
                          ),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle,
                                  color: Colors.white)
                              : null,
                          onTap: () {
                            toggleInjury(disease);
                          });
                    },
                  ),
                ),
                SizedBox(height: 10.v),
                const ChatMessageWidget(message: "Ok! Let's continue"),
                const Spacer(),

                const ChatBotButtonWidget(route: '/chat_bot_allergy'),
                SizedBox(
                  height: 20.v,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
