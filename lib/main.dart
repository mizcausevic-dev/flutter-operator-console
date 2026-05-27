// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:flutter/material.dart';

void main() {
  runApp(const OperatorConsoleApp());
}

class OperatorConsoleApp extends StatelessWidget {
  const OperatorConsoleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Operator Console',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF05070C),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF37FF8B),
          secondary: Color(0xFF19C7FF),
          surface: Color(0xFF0B1220),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 52,
            height: 0.98,
            fontWeight: FontWeight.w800,
            color: Color(0xFFE9F3FF),
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xFFE9F3FF),
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFE9F3FF),
          ),
          bodyLarge: TextStyle(
            fontSize: 15,
            height: 1.55,
            color: Color(0xB8E9F3FF),
          ),
          bodyMedium: TextStyle(
            fontSize: 13,
            height: 1.5,
            color: Color(0x99E9F3FF),
          ),
        ),
      ),
      home: const OperatorConsoleHome(),
    );
  }
}

class OperatorConsoleHome extends StatelessWidget {
  const OperatorConsoleHome({super.key});

  static const _chips = <String>[
    'Flutter web shell',
    'Offline-first queues',
    'Command packets',
    'Operator handoff',
    'Release-safe mobile surfaces',
  ];

  static const _kpis = <_KpiData>[
    _KpiData('12', 'lane packets', 'queue slices modeled across mobile, field, and response lanes', Color(0xFF37FF8B)),
    _KpiData('5', 'handoff steps', 'command, verify, escalate, recover, and report', Color(0xFF19C7FF)),
    _KpiData('4', 'operator modes', 'online, degraded, offline, and sync recovery states', Color(0xFFFFCC66)),
    _KpiData('99%', 'UI parity', 'same shell language across phone, tablet, and browser', Color(0xFFB88CFF)),
  ];

  static const _lanes = <_CardData>[
    _CardData(
      eyebrow: 'queue lane',
      title: 'Route work without desktop drag.',
      body:
          'Keep dispatch packets, audit tasks, and escalation notes in one Flutter shell that still works when field teams are away from a full desktop stack.',
    ),
    _CardData(
      eyebrow: 'handoff lane',
      title: 'Preserve operator context.',
      body:
          'Every packet shows owner, blocker, deadline, and evidence so a shift change does not erase the reasoning behind a decision.',
    ),
    _CardData(
      eyebrow: 'sync lane',
      title: 'Recover cleanly after offline windows.',
      body:
          'Queue health highlights stale packets, sync conflicts, and missing acknowledgements before they become production drift.',
    ),
    _CardData(
      eyebrow: 'exec lane',
      title: 'Keep the shell recruiter-legible.',
      body:
          'The repo demonstrates Dart, Flutter web delivery, responsive cards, queue modeling, and a recruiter-facing proof surface tied back to Kinetic Gain OS.',
    ),
  ];

  static const _packets = <_PacketData>[
    _PacketData('PK-14', 'Field outage packet', 'Yellow', 'A depot shift lead needs a mobile-safe recovery pack with cached vendor contacts and checkpoint notes.'),
    _PacketData('PK-21', 'Policy exception packet', 'Red', 'A supervisor is approving a time-sensitive override and needs the evidence trail, not just the UI state.'),
    _PacketData('PK-37', 'Launch readiness packet', 'Green', 'A web rollout bundle is safe to release once mobile acknowledgement and signage confirmation clear.'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF05070C), Color(0xFF070A0F), Color(0xFF05070C)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1240),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      _MetaPill('Language atlas: Dart + Flutter'),
                      _MetaPill('Platform: operator console'),
                      _MetaPill('Surface: web + mobile shell'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _GlassPanel(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final twoCol = constraints.maxWidth > 980;
                        final heroPrimary = Padding(
                          padding: EdgeInsets.only(right: twoCol ? 24 : 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SectionLabel('flutter operator console'),
                              const SizedBox(height: 14),
                              Text(
                                'Ship mobile-safe operator workflows without losing queue fidelity.',
                                style: theme.textTheme.displayLarge?.copyWith(
                                  fontSize: twoCol ? 68 : 42,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'A Dart and Flutter reference surface for Kinetic Gain OS: queue health, offline packets, escalation state, and recoverable command handoffs in one deployable shell.',
                                style: theme.textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 18),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: _chips.map((chip) => _MetaPill(chip)).toList(),
                              ),
                            ],
                          ),
                        );

                        const heroSecondary = Column(
                          children: [
                            _InfoCard(
                              label: 'core offer',
                              title: 'Mobile operator shell',
                              body:
                                  'A responsive Flutter front end for queue visibility, approvals, task packets, and incident recovery workflows.',
                            ),
                            SizedBox(height: 14),
                            _InfoCard(
                              label: 'why it matters',
                              title: 'Shift-safe handoff',
                              body:
                                  'The UI keeps enough evidence and context attached to every packet that field, dispatch, and release teams can trade work safely.',
                            ),
                          ],
                        );

                        if (!twoCol) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              heroPrimary,
                              const SizedBox(height: 16),
                              heroSecondary,
                            ],
                          );
                        }

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 3, child: heroPrimary),
                            const SizedBox(width: 16),
                            const Expanded(flex: 2, child: heroSecondary),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 26),
                  const _SectionHeader(title: 'Operator KPIs', note: 'Proof snapshot'),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final cols = constraints.maxWidth > 1100
                          ? 4
                          : constraints.maxWidth > 700
                              ? 2
                              : 1;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _kpis.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cols,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: cols == 1 ? 2.6 : 1.55,
                        ),
                        itemBuilder: (context, index) => _KpiCard(data: _kpis[index]),
                      );
                    },
                  ),
                  const SizedBox(height: 26),
                  const _SectionHeader(title: 'Console Lanes', note: 'What the shell manages'),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final cols = constraints.maxWidth > 1100
                          ? 4
                          : constraints.maxWidth > 700
                              ? 2
                              : 1;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _lanes.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cols,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: cols == 1 ? 2.4 : 1.02,
                        ),
                        itemBuilder: (context, index) => _LaneCard(data: _lanes[index]),
                      );
                    },
                  ),
                  const SizedBox(height: 26),
                  const _SectionHeader(title: 'Packet Queue', note: 'Sample operator work'),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final cols = constraints.maxWidth > 1100
                          ? 3
                          : constraints.maxWidth > 700
                              ? 2
                              : 1;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _packets.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cols,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: cols == 1 ? 2.35 : 1.16,
                        ),
                        itemBuilder: (context, index) => _PacketCard(data: _packets[index]),
                      );
                    },
                  ),
                  const SizedBox(height: 26),
                  const _GlassPanel(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionLabel('why this matters'),
                        SizedBox(height: 10),
                        Text(
                          'Kinetic Gain Embedded tie-back',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFE9F3FF),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'This repo proves Kinetic Gain can ship beyond browser-only TypeScript surfaces. It extends the portfolio into Dart and Flutter while preserving the same operator-console language: queue health, handoff proof, recovery posture, and buyer-readable workflows.',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.55,
                            color: Color(0xB8E9F3FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassPanel extends StatelessWidget {
  const _GlassPanel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0x2E78FFAA)),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xF20B1220), Color(0xEC08131F)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x8C000000),
            blurRadius: 60,
            offset: Offset(0, 18),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.note});

  final String title;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFFE9F3FF),
              ),
            ),
          ),
          Text(
            note.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              letterSpacing: 2.2,
              color: Color(0x88E9F3FF),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontSize: 12,
        letterSpacing: 3.1,
        fontWeight: FontWeight.w600,
        color: Color(0xFF37FF8B),
      ),
    );
  }
}

class _MetaPill extends StatelessWidget {
  const _MetaPill(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0x2E78FFAA)),
        color: const Color(0x33050A12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          letterSpacing: 1.4,
          color: Color(0xB8E9F3FF),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.label,
    required this.title,
    required this.body,
  });

  final String label;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x33FFCC66)),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x2100C7FF), Color(0x110B1220)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              letterSpacing: 2.2,
              color: Color(0xFFFFCC66),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              height: 1.05,
              fontWeight: FontWeight.w700,
              color: Color(0xFFE9F3FF),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: Color(0xB8E9F3FF),
            ),
          ),
        ],
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  const _KpiCard({required this.data});

  final _KpiData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x2E78FFAA)),
        color: const Color(0xCC0B1220),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.value,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: data.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.label.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              letterSpacing: 2,
              color: Color(0x88E9F3FF),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.body,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: Color(0xB8E9F3FF),
            ),
          ),
        ],
      ),
    );
  }
}

class _LaneCard extends StatelessWidget {
  const _LaneCard({required this.data});

  final _CardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x2E78FFAA)),
        color: const Color(0xCC0B1220),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.eyebrow.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              letterSpacing: 2.1,
              color: Color(0xFF19C7FF),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.title,
            style: const TextStyle(
              fontSize: 20,
              height: 1.15,
              fontWeight: FontWeight.w700,
              color: Color(0xFFE9F3FF),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.body,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.55,
              color: Color(0xB8E9F3FF),
            ),
          ),
        ],
      ),
    );
  }
}

class _PacketCard extends StatelessWidget {
  const _PacketCard({required this.data});

  final _PacketData data;

  Color get _statusColor {
    switch (data.status) {
      case 'Red':
        return const Color(0xFFFF5C7A);
      case 'Yellow':
        return const Color(0xFFFFCC66);
      case 'Green':
        return const Color(0xFF37FF8B);
    }
    return const Color(0xFFE9F3FF);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x2E78FFAA)),
        color: const Color(0xCC0B1220),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                data.id,
                style: const TextStyle(
                  fontSize: 12,
                  letterSpacing: 2.4,
                  color: Color(0xFF19C7FF),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: _statusColor.withAlpha(32),
                  border: Border.all(color: _statusColor.withAlpha(90)),
                ),
                child: Text(
                  data.status.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1.8,
                    fontWeight: FontWeight.w700,
                    color: _statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            data.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFFE9F3FF),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            data.body,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.55,
              color: Color(0xB8E9F3FF),
            ),
          ),
        ],
      ),
    );
  }
}

class _KpiData {
  const _KpiData(this.value, this.label, this.body, this.color);

  final String value;
  final String label;
  final String body;
  final Color color;
}

class _CardData {
  const _CardData({
    required this.eyebrow,
    required this.title,
    required this.body,
  });

  final String eyebrow;
  final String title;
  final String body;
}

class _PacketData {
  const _PacketData(this.id, this.title, this.status, this.body);

  final String id;
  final String title;
  final String status;
  final String body;
}
