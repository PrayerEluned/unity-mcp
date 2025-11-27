# Unity MCP Server (Antigravity Edition)

Unity EditorをAIエージェント（Antigravity, Claude, Cursorなど）から直接操作するためのツールキットです。
`CoplayDev/unity-mcp` をベースに、より簡単に導入できるように調整されています。

## 主な機能

*   **自然言語で操作**: 「赤いキューブを作って」「シーンを保存して」といった指示でUnityを操作できます。
*   **アセット管理**: アセットの作成、変更、削除が可能です。
*   **シーン操作**: オブジェクトの配置、コンポーネントの追加などが可能です。
*   **コンソール確認**: UnityのコンソールログをAIが読み取ってエラーを診断できます。

> 🔰 **初心者の方へ**: 詳しい手順を解説した [**徹底ガイド (GUIDE.md)**](GUIDE.md) をご用意しました。初めての方はこちらをご覧ください。

---

## インストール手順

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

## Antigravity (MCPクライアント) の設定

AIエージェントがこのサーバーを認識できるように、設定ファイルに情報を追加する必要があります。

### 必要な情報

*   **サーバータイプ**: `sse` (Server-Sent Events) または `http`
*   **URL**: `http://localhost:8080/sse`

### 設定手順

お使いの環境に合わせて設定を行ってください。

#### Claude Desktop / Antigravity の場合

設定ファイル（`claude_desktop_config.json` など）を開き、`mcpServers` セクションに以下を追加してください。

```json
{
  "mcpServers": {
    "UnityMCP": {
      "url": "http://localhost:8080/sse"
    }
  }
}
```

#### Cursor の場合

1.  Cursorの設定画面を開きます。
2.  **Features > MCP** セクションを探します。
3.  **Add New MCP Server** をクリックします。
4.  以下のように入力します。
    *   **Name**: `UnityMCP`
    *   **Type**: `SSE`
    *   **URL**: `http://localhost:8080/sse`

#### 接続確認

設定後、AIエージェントを再起動し、「Unityのシーンにあるオブジェクトを教えて」と聞いてみてください。
Unityエディタ上の情報が返ってくれば、接続成功です。

---

## トラブルシューティング

*   **サーバーが起動しない**:
    *   Python 3.10以上がインストールされているか確認してください。
    *   `python --version` コマンドでバージョンを確認できます。
*   **Unityとつながらない**:
    *   Unityエディタが開いていることを確認してください。
    *   Unityのメニュー **Window > MCP for Unity** を開き、接続ステータスを確認できます。
*   **ポート8080が使われている**:
    *   `start_server.bat` をテキストエディタで開き、`--http-port 8080` の数字を別の番号（例: 8081）に変更してください。その場合、クライアント設定のURLも合わせて変更してください。

---

## ライセンス

MIT License
