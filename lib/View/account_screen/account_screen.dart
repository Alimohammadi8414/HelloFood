import 'package:flutter/material.dart';
import 'package:hellofood/viewmodel/sign_up_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hellofood/model/food_&_user.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _addressController = TextEditingController();
  String? _savedAddress;
  final Box<User> _box = Hive.box<User>('User');

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = _box.isNotEmpty ? _box.values.first : null;
    final imagePicker = ImagePicker();

    return Scaffold(
      appBar: AppBar(
        title: Text('Account', style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile avatar
            Center(
              child: GestureDetector(
                onTap: () {
                  imagePicker.pickImage(source: ImageSource.gallery);
                },
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.grey.shade200,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/ic_account.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Full name
            Center(
              child: Text(
                ((user?.name ?? '').trim().isEmpty &&
                        (user?.lastName ?? '').trim().isEmpty)
                    ? 'User Name'
                    : '${user?.name ?? ''} ${user?.lastName ?? ''}',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 12),

            // Phone
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  user?.phone?.toString() ?? 'Phone not provided',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Delivery address
            Text(
              'Delivery Address',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'Enter delivery address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              minLines: 1,
              maxLines: 3,
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final text = _addressController.text.trim();
                  _savedAddress = text.isEmpty ? null : text;
                });
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Address saved')));
              },
              child: const Text('Save Address'),
            ),

            const SizedBox(height: 16),

            if (_savedAddress != null)
              Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected delivery address:',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _savedAddress!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () async {
                await context.read<SignUpProvider>().clear(context);
              },
              icon: const Icon(Icons.delete_forever),
              label: const Text('Delete Account (clear data)'),
            ),

            const SizedBox(height: 8),

            TextButton(onPressed: () {}, child: const Text('Edit profile')),
          ],
        ),
      ),
    );
  }
}
