// Provider dla cutting speed
import 'package:cnc_toolbox/features/cutting_speed/cutting_speed_provider.dart';
// Wydzielone widgety
import 'package:cnc_toolbox/widgets/cutting_speed_input_section.dart';
import 'package:cnc_toolbox/widgets/cutting_speed_result_card.dart';
import 'package:cnc_toolbox/widgets/safety_alert_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CuttingSpeedPage extends ConsumerStatefulWidget {
  const CuttingSpeedPage({super.key});

  @override
  ConsumerState<CuttingSpeedPage> createState() => _CuttingSpeedPageState();
}

class _CuttingSpeedPageState extends ConsumerState<CuttingSpeedPage> {
  final _formKey = GlobalKey<FormState>();
  final _dController = TextEditingController();
  final _nController = TextEditingController();
  final _fzController = TextEditingController();
  final _zController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cuttingSpeedProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('cutting_speed'.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CuttingSpeedInputSection(
                dController: _dController,
                nController: _nController,
                fzController: _fzController,
                zController: _zController,
              ),
              const SizedBox(height: 24),
              CuttingSpeedResultCard(state: state),
              if (state.safetyAlert != null)
                SafetyAlertWidget(alertKey: state.safetyAlert!),
            ],
          ),
        ),
      ),
    );
  }
}
