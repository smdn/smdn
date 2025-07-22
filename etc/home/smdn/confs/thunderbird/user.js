user_pref("general.smoothScroll", false); // スムーススクロールを無効にする
user_pref("mail.mdn.report.enabled", false); // 開封確認を送信しない
user_pref("mail.default_send_format", 1); // 送信テキスト形式を「プレーンテキスト形式のみ」にする
user_pref("mail.server.default.mdn_report_enabled", false); // (新規に作成されるアカウントに対して)開封確認を送信しない
user_pref("mail.server.default.offline_download", false); // (新規に作成されるアカウントに対して)メッセージの同期を無効にする
user_pref("mail.server.default.check_all_folders_for_new", true); // すべてのIMAPフォルダの新着メールをチェックする
// アカウントごとの設定の既定値
user_pref("mail.identity.default.compose_html", false); // デフォルトの送信フォーマットでHTMLを無効にする(=プレーンテキストにする)
user_pref("mail.identity.default.archive_enabled", false); // アーカイブを無効にする
// 迷惑メール
user_pref("mail.spam.manualMark", true); // 「迷惑マークが付いたときに次の処理を実行する」
user_pref("mail.server.default.moveOnSpam", true); // 「迷惑メール」フォルダーへ移動する
user_pref("mailnews.ui.junk.manualMarkAsJunkMarksRead", true); // 「手動で迷惑マークを付けたとき」既読にする
user_pref("mail.spam.markAsReadOnSpam", false); // 「Thunderbirdが迷惑メールと判断したとき」既読にしない
user_pref("mail.spam.logging.enabled", true); // 迷惑メール適応フィルターのログを有効にする
// メールの並べ替えの順序・種類
// ref: https://superuser.com/questions/13518/change-the-default-sorting-order-in-thunderbird
user_pref("mailnews.default_sort_order", 1); // ソート順を昇順(古いものが上)にする(降順は2)
user_pref("mailnews.default_sort_type", 35); // ソート種類を「受信順」にする
user_pref("mailnews.default_view_flags", 1); // スレッド化する
// IMAPフラグとタグの関連付け
user_pref("mailnews.tags.dmarc-authentication-failure.tag", "DMARC-Authentication-Failure"); // "DMARC-Authentication-Failure"フラグをタグと関連付ける
user_pref("mailnews.tags.dmarc-authentication-failure.color", "#63452c"); // タグの色を設定する
user_pref("mailnews.tags.markedasspam-almost.tag", "MarkedAsSpam-Almost");
user_pref("mailnews.tags.markedasspam-almost.color", "#444444");
user_pref("mailnews.tags.markedasspam-probably.tag", "MarkedAsSpam-Probably");
user_pref("mailnews.tags.markedasspam-probably.color", "#704e43");
user_pref("mailnews.tags.markedasspam-possible.tag", "MarkedAsSpam-Possible");
user_pref("mailnews.tags.markedasspam-possible.color", "#ca765b");
