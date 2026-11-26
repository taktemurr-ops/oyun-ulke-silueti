import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ulke_silueti/oyun_ulke_silueti.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(siluetConfig.title.length, 33);
    expect(siluetConfig.tagline.length, 33);
    for (final s in siluetConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(siluetConfig.gameId, siluetId);
    expect(siluetRules.gameId, siluetId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(siluetRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: siluetId, optionalMechanics: siluetRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(siluetRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
