# Antigravity Unity MCP

これは、Antigravity（AIエージェント）がUnityエディタを直接操作できるようにするためのツールキットです。
`CoplayDev/unity-mcp` をベースに、手軽に利用できるように調整されています。

## 含まれているもの

*   **`unity-package` フォルダ**: Unityにインストールするパッケージ本体です。
*   **`mcp-server-python` フォルダ**: AIとUnityの仲介役となるサーバープログラムです。
*   **`start_server.bat`**: サーバーを簡単に起動するためのファイルです。

## 使い方

### 手順 1: Unityへの導入

**方法 A: Git URLからインストール（推奨）**
1.  Unityの **Window > Package Manager** を開きます。
2.  左上の **+** ボタンをクリックし、**Add package from git URL...** を選択します。
3.  以下のURLを入力して「Add」をクリックします。
    ```
    https://github.com/PrayerEluned/unity-mcp.git?path=/unity-package
    ```

**方法 B: ディスクからインストール**
1.  このリポジトリをダウンロードします。
2.  Package Managerの **+** ボタンから **Add package from disk...** を選択します。
3.  `unity-package/package.json` を選択します。

### 手順 2: サーバーの起動

1.  このフォルダにある **`start_server.bat`** をダブルクリックして実行します。
2.  黒い画面（ターミナル）が立ち上がり、初回は必要なプログラムのインストールが行われます。
3.  `Starting FastMCP with HTTP transport` と表示されれば準備完了です。
    *   **注意**: この黒い画面は閉じずに、開いたままにしておいてください。

### 手順 3: Antigravityとの接続

*   Antigravityの設定で、このサーバーを使用するように指定してください。
*   接続が成功すれば、AIがUnityのシーンを見たり、オブジェクトを作ったりできるようになります。

## トラブルシューティング

*   **赤い丸が表示される**: フォルダに赤い丸（エラーや警告）がついている場合、Gitの設定ファイルなどが残っている可能性がありますが、動作には影響ありません。気になる場合は `unity-mcp` フォルダ内の隠しファイル（`.git`など）を削除してください。
*   **サーバーが動かない**: Pythonがインストールされているか確認してください。
