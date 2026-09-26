import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase backend (schema: Student_career/supabase-schema.sql).
/// Provide --dart-define=SUPABASE_URL=… --dart-define=SUPABASE_ANON_KEY=…
/// Without them the app runs on bundled demo data.
abstract final class Supa {
  static bool get ready {
    try {
      Supabase.instance.client;
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<void> init() => Supabase.initialize(
        url: const String.fromEnvironment('SUPABASE_URL'),
        publishableKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
      );

  static SupabaseClient get db => Supabase.instance.client;

  // Table names mirror supabase-schema.sql §32 entities.
  static const tProfiles = 'profiles';
  static const tSubjects = 'subjects';
  static const tTopics = 'topics';
  static const tTopicProgress = 'topic_progress';
  static const tMaterials = 'study_materials';
  static const tPapers = 'question_papers';
  static const tNotes = 'notes';
  static const tTests = 'tests';
  static const tQuestions = 'questions';
  static const tAttempts = 'test_attempts';
  static const tTimetable = 'timetable_series';
  static const tOverrides = 'timetable_overrides';
  static const tAttendance = 'attendance_records';
  static const tAssignments = 'assignments';
  static const tMarks = 'marks';
  static const tSgpa = 'sgpa_records';
  static const tNotifications = 'notifications';
  static const tConversations = 'ai_conversations';
  static const tArtifacts = 'ai_artifacts';

  static Future<List<Map<String, dynamic>>> my(String table) async {
    final uid = db.auth.currentUser?.id;
    if (uid == null) return [];
    final res = await db.from(table).select().eq('student_id', uid);
    return List<Map<String, dynamic>>.from(res);
  }
}
