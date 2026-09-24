import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/components/page.dart';
import 'package:app/phone/phone_types.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class PagePhone extends StatefulWidget {
  const PagePhone({super.key});

  @override
  State<PagePhone> createState() => _PagePhoneState();
}

class _PagePhoneState extends State<PagePhone> {
  final TextEditingController _codeController = TextEditingController();

  String? _myCode;
  bool _loadingCode = true;
  bool _calling = false;

  @override
  void initState() {
    super.initState();
    _loadMyCode();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _loadMyCode() async {
    final bootstrap = context.read<Bootstrap>();
    final code = await bootstrap.phoneService.myCode();
    if (!mounted) return;
    setState(() {
      _myCode = code;
      _loadingCode = false;
    });
  }

  Future<void> _call(PhoneCallType type) async {
    final code = _codeController.text.trim();
    if (code.length != 6) {
      showFToast(context: context, title: const Text('Enter a 6-digit code.'));
      return;
    }

    setState(() => _calling = true);
    final bootstrap = context.read<Bootstrap>();
    final result = await bootstrap.phoneService.call(code, type);
    if (!mounted) return;
    setState(() => _calling = false);

    if (!result.success) {
      final message = switch (result.reason) {
        'busy' => 'That code is already in a call.',
        'not-found' => 'No one is reachable under that code.',
        _ => 'Could not start the call.',
      };
      showFToast(context: context, title: Text(message));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildMyCodeCard(),
          const SizedBox(height: 24),
          const Text('Call a code'),
          const SizedBox(height: 8),
          FTextField(
            control: FTextFieldControl.managed(controller: _codeController),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 6,
            hint: '000000',
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: FButton(
                  onPress: _calling ? null : () => _call(PhoneCallType.audio),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FLucideIcons.phone, size: 18),
                      SizedBox(width: 8),
                      Text('Call'),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FButton(
                  variant: FButtonVariant.secondary,
                  onPress: _calling ? null : () => _call(PhoneCallType.video),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FLucideIcons.video, size: 18),
                      SizedBox(width: 8),
                      Text('Video call'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMyCodeCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Your code'),
            const SizedBox(height: 8),
            _loadingCode
                ? const CircularProgressIndicator()
                : Text(
                    _myCode ?? '------',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6,
                    ),
                  ),
            const SizedBox(height: 4),
            const Text(
              'Share this code so others can call you.',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
