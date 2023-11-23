import 'package:gsheets/gsheets.dart';

class GsheetApi {
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "flutter-gsheets-405902",
  "private_key_id": "7cf463959b1cff71253d3a94fc201f401b887062",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDIn+xAzB/hazVL\nHWS2HrTKWd9Oj1BQH0E2o4BKWcB2osmSY7jE691AIiJF0yEJkudv5Q3nvbyn4FYt\nsQwEHzqcqtTDk/PYCfPXVvajgsAUBFILqLBrwU4w6h5wHpagRQT8MoihNMQey2BF\nVeeJjxfN8VMt+uXBxPuTO0IQ2MF9S6tUKAhR2Rxry8bQ78o+4/KmTRKedxZTCs9M\n2ysdqHUl5SHWyMCpk3VKFU2wtC7m3EhsLQ8zWJB/rNoB80Z/eaZ1cHxwyo5/h5n2\nMTSj4ebZPDPwYy0xZwrXLBo0xIjM/dc+c1vVIHVhQxRBcE80cXCvP+o3UoZQyCBQ\niOvCJH2HAgMBAAECggEALSYUOEbXm9aRETzlp7iETg9omhjVZZqLBf1IhzLohao/\nu5J2h9Zenaqw1M7dHfbx33QIK5E+7fal3jV8M0dF3PDy3aqjkwg2WE0pRwXLLRYF\n0rrdLPq9GnPtcqTnl9zAcPL8XW7u/dEd8qyQ5RuPK1j2M6BFaVRnmywYQ4tMC+J/\nk+OPZhRGnhyR/tIGh8Lm1H9INDvtA31cYk7iOwzF0xpjmkFvrisd8WcuFHIEfb6X\nKzo1pCD4WkshxtfS/eYR24Et4hgUj9Yxr/9Z/fMH79NV4HAjC/vpfKSWmjhMkZAM\nImgdhQVZsic9VwQFd89V5rZ33tlzjAUNn7ZbnBjihQKBgQD4tqCjoHJRQ7Nbwz3L\nYBH2QBRu0toNhtG0YovHbsmJjMg8k+4o+l3oLmeOj5o9bcbEpQ+s271nusPxjqqu\nGHvbLapI5gFFUkKwRe4GzqmUfFx4ECRskNqmVRo4BE7YRyvN0NsumXAqGA95IlFa\nbJFGb3ibK6mFeYZBn5KjappzFQKBgQDOgKA8Ys/AjZLrE7xD59jx3WxcvcknQNfK\nmSiB6aTVvzWVU5GUFuzJKlgEaQ5VAZMrK38XyPefwGoXaXmHj7zNagDCbQtj0oTJ\n661Y+ply3hjoGT9gqbs5Y/8QRMUazDH6Y3HM034eLpE7xXQWWEThIQXhv06HMJ8l\nzRcrehTFKwKBgG2N5Iyu7CwnqiXNhrbDBqZ164o1jp9Ot6jBj9i1UEkqnjkw4ENk\npWDUsAD3+HT+mgOcwZ7e3DuI5S7OLRiq6EPPhaa+yeiDJ6UF6KdO+RvS+9hXI/Q+\nilGiQv5Rx3k1QHJUgXexVtrz5jzxhOxTzlo8V9/iB7YnpZ/abnlVR9tRAoGAIhSY\nXV7xapXy6VkYeRyKcWBZwfSQfin1czpTtR0aVyx3a22fWRFvgsO6QwATnXPlFfrX\nvtUsCPF4kOSXaggO4NfdyDi26IKV5709nrG9IXgGJEgGba2VeKNINSckYIfSt8Ax\nx9wftFt7HKI5xnZK59zLW7Z2/1jG6zYt3L8JLoECgYEAode3ay3U7jGJ8mkDGZNI\nr41A+K1/Q3TgP8ASoXRZAUOGHwivJF06rl+rGXNdChLGoy76Wyr702YUg+2awsvk\nizTTNzf9DeggwDP0ZS5+qEcYnnoXohOLP/ku7dBEDWng1EitsaTYpPyqiRqSQ7cp\nB+Jn5F9xXWwKfGaBkVV2kXI=\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets@flutter-gsheets-405902.iam.gserviceaccount.com",
  "client_id": "103184070784260909055",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets%40flutter-gsheets-405902.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}''';

  static final _gsheetsId = '1IpQZflNVdm7rsl3H2guoC0-kMBm3WLVjhXfE1G2SgH8';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

//some variables to track off
  static int numberofNotes = 0;
  static List<String> currentNotes = [];
  static bool loadinng = true;

  //intiliaze spreedsheet
  Future init() async {
    final ss = await _gsheets.spreadsheet(_gsheetsId);
    _worksheet = ss.worksheetByTitle('worksheet1');
    countRows();
  }
//insert a new route

  static Future insert(String note) async {
    if (_worksheet == null) return;
    numberofNotes++;
    currentNotes.add(note);
    await _worksheet!.values.appendRow([note]);
  }

//count the number of rows
  static Future countRows() async {
    while (
        (await _worksheet!.values.value(column: 1, row: numberofNotes + 1)) !=
            '') {
      numberofNotes++;
    }
    loadNotes();
  }

//load notes from spreadsheet

  static loadNotes() async {
    if (_worksheet == null) return;
    for (int i = 0; i < numberofNotes; i++) {
      final String newnote =
          await _worksheet!.values.value(column: 1, row: i + 1);
      if (currentNotes.length < numberofNotes) {
        currentNotes.add(newnote);
      }
    }
    loadinng = false;
  }
}
