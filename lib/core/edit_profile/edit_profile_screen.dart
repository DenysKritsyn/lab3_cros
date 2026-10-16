import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/edit_profile/widgets/phone_numbers.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/profile_photo.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/nova_input.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/nova_main_button.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/saved_phone_card.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';



class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final List<SavedPhoneCard> phoneNumbers = [
  SavedPhoneCard(
    number: '+380 67 312 48 90',
    label: 'Основний',
    onEdit: () {
      // TODO: Edit the primary phone number.
    },
    onDelete: () {
      // TODO: Delete the primary phone number.
    },
  ),
  SavedPhoneCard(
    number: '+380 93 805 16 42',
    label: 'Робочий',
    onEdit: () {
      // TODO: Edit the work phone number.
    },
    onDelete: () {
      // TODO: Delete the work phone number.
    },
  ),
];

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

          // Return button
          leading: IconButton(
            onPressed: () {
              // Return to profile screen.
              Navigator.of(context).pop();
            },
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
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Profile Photo
                ProfilePhoto(
                  text: 'ОМ',
                  mainColor: applicationMainColor,
                  borderColor: Colors.white,
                  size: 80,
                  onPressed: () {
                    // TODO: Choose a profile photo.
                  },
                ),
                const SizedBox(height: 8),

                // Name Input
                const Text(
                  'Ім’я та прізвище',
                  style: SemiBoldTextStyle(),
                ),
                const SizedBox(height: 8),
                NovaInput(
                  controller: _nameController,
                  placeholder: 'Ім’я та прізвище',
                  mainColor: applicationMainColor,
                ),
                const SizedBox(height: 16),

                // Email Input
                const Text(
                  'Електронна пошта',
                  style: SemiBoldTextStyle(),
                ),
                const SizedBox(height: 8),
                NovaInput(
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
                        style: BoldFadeTextStyle(),
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
                PhoneNumbers(
                  cards: phoneNumbers,
                ),
                const SizedBox(height: 18),

                // Save Changes Button
                NovaMainButton(
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
