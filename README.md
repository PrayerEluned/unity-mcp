# Unity MCP Server (Antigravity Edition)

Unity EditorをAIエージェント（Antigravity, Claude, Cursorなど）から直接操作するためのツールキットです。
`CoplayDev/unity-mcp` をベースに、より簡単に導入できるように調整されています。

## ✨ 主な機能

*   **自然言語で操作**: 「赤いキューブを作って」「シーンを保存して」といった指示でUnityを操作できます。
*   **アセット管理**: アセットの作成、変更、削除が可能です。
*   **シーン操作**: オブジェクトの配置、コンポーネントの追加などが可能です。
*   **コンソール確認**: UnityのコンソールログをAIが読み取ってエラーを診断できます。

---

## 🚀 インストール手順

### ステップ 1: Unityパッケージの導入

以下の **どちらか** の方法でインストールしてください。

#### 方法 A: Git URLからインストール（推奨）
1.  Unityのメニューから **Window > Package Manager** を開きます。
2.  左上の **+** ボタンをクリックし、**Add package from git URL...** を選択します。
3.  以下のURLを入力して「Add」をクリックします。
    ```
    https://github.com/PrayerEluned/unity-mcp.git?path=/unity-package
    ```

#### 方法 B: ダウンロードしてインストール
1.  このリポジトリをZIPでダウンロードして解凍します。
2.  Unityの Package Manager の **+** ボタンから **Add package from disk...** を選択します。
3.  解凍したフォルダ内の `unity-package/package.json` を選択します。

### ステップ 2: サーバーの起動

AIとUnityをつなぐためのサーバープログラムを起動する必要があります。

1.  ダウンロードしたフォルダ内の **`start_server.bat`** をダブルクリックします。
2.  黒い画面（ターミナル）が開き、サーバーが起動します。
    *   初回は必要なライブラリのインストールが行われるため、少し時間がかかります。
    *   `Starting FastMCP with HTTP transport` と表示されれば準備完了です。
3.  **注意**: この画面は閉じずに、開いたままにしておいてください。

---

## 🔌 Antigravity (MCPクライアント) の設定

お使いのAIエージェントの設定ファイルに、以下のサーバー情報を追加してください。

**サーバーURL (HTTP)**:
```
http://localhost:8080/sse
```
※ クライアントによっては `/sse` が不要な場合や、`/mcp` の場合があります。接続できない場合は `http://localhost:8080/mcp` もお試しください。

### 設定例 (claude_desktop_config.json)

```json
{
  "mcpServers": {
    "UnityMCP": {
      "url": "http://localhost:8080/sse"
    }
  }
}
```

---

## ❓ トラブルシューティング

*   **サーバーが起動しない**:
    *   Python 3.10以上がインストールされているか確認してください。
    *   `python --version` コマンドでバージョンを確認できます。
*   **Unityとつながらない**:
    *   Unityエディタが開いていることを確認してください。
    *   Unityのメニュー **Window > MCP for Unity** を開き、接続ステータスを確認できます。
*   **ポート8080が使われている**:
    *   `start_server.bat` をテキストエディタで開き、`--http-port 8080` の数字を別の番号（例: 8081）に変更してください。

---

## ライセンス

MIT License
