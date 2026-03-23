import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/localization/locale_notifier.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _showAppInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(borderRadius: AppRadii.radiusL),
          title: Text(LocaleKeys.about.tr()),
          content: ConstrainedBox(
            constraints: const BoxConstraints(
              // Maksymalna szerokość dla desktopu/tabletów
              maxWidth: 450,
              // Minimalna szerokość, żeby dialog nie był "chudy" przy krótkim tekście
              minWidth: 300,
            ),
            child: IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [_Content(onLaunch: _launchUrl)],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(LocaleKeys.common_close.tr()),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        Icons.info_outline,
        color: theme.colorScheme.primary,
        size: 28,
      ),
      title: Text('${LocaleKeys.version.tr()}: ${AppInfo.appVersion}'),
      subtitle: Text(LocaleKeys.about_desc.tr()),
      onTap: () => _showAppInfo(context),
      shape: RoundedRectangleBorder(borderRadius: AppRadii.radiusL),
      tileColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.08),
    );
  }
}

class _Content extends StatelessWidget {
  final Future<void> Function(String) onLaunch;
  const _Content({required this.onLaunch});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _InfoRow(
          icon: Icons.apps,
          label: LocaleKeys.version.tr(),
          value: AppInfo.appVersion,
        ),
        const Divider(height: 32),
        _ClickableRow(
          icon: Icons.email_outlined,
          label: LocaleKeys.contact.tr(),
          value: AppInfo.contactEmail,
          onTap: () => onLaunch('mailto:${AppInfo.contactEmail}'),
        ),
        AppSpacings.gapS,
        _ClickableRow(
          icon: Icons.language_outlined,
          label: LocaleKeys.website.tr(),
          value: AppInfo.websiteUrl,
          onLaunch: onLaunch, // Przekazujemy onLaunch by dodać ikonę
          onTap: () => onLaunch(AppInfo.websiteUrl),
        ),
        const Divider(height: 32),
        Text(
          'Developed by VeloCNC Team',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 24, color: theme.colorScheme.onSurfaceVariant),
        AppSpacings.gapM,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: theme.textTheme.labelSmall),
            Text(value, style: theme.textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}

class _ClickableRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  final Function? onLaunch;

  const _ClickableRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    this.onLaunch,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.radiusM,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Icon(icon, size: 24, color: theme.colorScheme.primary),
            AppSpacings.gapM,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: theme.textTheme.labelSmall),
                  Text(
                    value,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.open_in_new, size: 16),
          ],
        ),
      ),
    );
  }
}
