import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionText extends StatelessWidget {
  final TextStyle textStyle;

  const VersionText({
    Key? key,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const SizedBox.shrink();
        }

        final v = snapshot.data?.version ?? '';
        final b = snapshot.data?.buildNumber ?? '';

        return Text(
          'v$v($b)',
          style: textStyle,
        );
      },
    );
  }
}
