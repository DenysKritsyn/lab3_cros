import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/edit_profile/widgets/edit_phone_actions.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/custom_input.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/main_button.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/saved_phone_card.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: 'Олена Мельник',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'olena.melnyk@gmail.com',
  );

  // Main application color
  static const Color applicationMainColor = Color(0xFFE22629);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7F9),

        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            tooltip: 'Назад',
            icon: const Icon(Icons.arrow_back_rounded, size: 20),
          ),
          title: const Text(
            'Редагувати профіль',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(height: 1, color: Color(0xFFDDE1E7)),
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Photo
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 37,
                              backgroundColor: Color(0xFFFFF0F1),
                              child: Text(
                                'ОМ',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: applicationMainColor,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: applicationMainColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // TODO: Choose a profile photo.
                                },
                                tooltip: 'Змінити фото',
                                style: IconButton.styleFrom(
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                constraints: const BoxConstraints.tightFor(
                                  width: 12,
                                  height: 12,
                                ),
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Choose a profile photo.
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: applicationMainColor,
                        ),
                        child: const Text(
                          'Змінити фото',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Name Input
                const Text(
                  'Ім’я та прізвище',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                CustomInput(
                  controller: _nameController,
                  placeholder: 'Ім’я та прізвище',
                  mainColor: applicationMainColor,
                ),
                const SizedBox(height: 16),

                // Email Input
                const Text(
                  'Електронна пошта',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                CustomInput(
                  controller: _emailController,
                  placeholder: 'name@example.com',
                  mainColor: applicationMainColor,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),

                // Phone Numbers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'НОМЕРИ ТЕЛЕФОНУ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // TODO: Add a phone number.
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: applicationMainColor,
                        padding: EdgeInsets.zero,
                      ),
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text(
                        'Додати',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SavedPhoneCard(
                  number: '+380 67 312 48 90',
                  label: 'Основний',
                  trailing: EditPhoneActions(),
                ),
                const SizedBox(height: 10),
                const SavedPhoneCard(
                  number: '+380 93 805 16 42',
                  label: 'Робочий',
                  trailing: EditPhoneActions(),
                ),
                const SizedBox(height: 18),

                // Save Changes Button
                MainButton(
                  onPressed: () {
                    // TODO: Save profile changes.
                  },
                  text: 'Зберегти зміни',
                  fontSize: 16,
                  icon: Icons.check_rounded,
                  iconSize: 20,
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  color: applicationMainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
