
## Javaインストール方法

1. `98開発環境`フォルダを開く。

![01](./img/java-install01.png)

2. `98インストーラー`フォルダを開く。

![02](./img/java-install02.png)

3. `java1.8`フォルダを開く。

![03](./img/java-install03.png)

4. `file0.text`,`file1.text`,`file2.text`,`file3.text`,`file4.text`ファイルを、`ctrl` + `C`でコピーする。

![04](./img/java-install04.png)

5. `97ツール関連`フォルダを開く。

![05](./img/java-install05.png)

6. `バイト分割ツール`フォルダを開く。

![06](./img/java-install06.png)

7. `tool`フォルダを開く。

![07](./img/java-install07.png)

8. `input`フォルダ、及び`output`フォルダを作成する。

![08](./img/java-install08.png)

9. `input`フォルダを開く。

![09](./img/java-install09.png)

10. `input`フォルダに、`file0.txt`,`file1.txt`,`file2.txt`,`file3.txt`,`file4.txt`ファイルを、`ctrl` + `V`でペーストする。

![10](./img/java-install10.png)

11. `tool`フォルダに戻り、`setting.json`を`Visual Studio Code`で開く。

![11](./img/java-install11.png)

12. 1行目の`"setting":"s"`を、`"setting":"j"`に書き換える。

![12](./img/java-install12.png)

13. `tool`フォルダに戻り、`bytesplit.exe`を実行する。
    `bytesplict.exe`ファイルが消失している場合は以下参照
    - [#bytesplit.exeファイルが消失している場合の対処法](#bytesplit.exeファイルが消失している場合の対処法)

![13](./img/java-install13.png)

14. `output`フォルダを開く。

![14](./img/java-install22.png)

15. `out.text`ファイルを、`ctrl` + `C`でコピーする。

![15](./img/java-install23.png)

16. `97ツール関連`フォルダに戻り、`ZIPテキスト化ツール`フォルダを開く。

![16](./img/java-install24.png)

17. `tool`フォルダを開く。

![17](./img/java-install25.png)

18. `out.text`ファイルを、`ctrl` + `V`でペーストする。`out.txt`ファイルの名前を `in.txt` に変更する。

![18](./img/java-install26.png)

19. `setting.json`を`Visual Studio Code`で開く。

![18](./img/java-install27.png)

20. 1行目の`"setting":"e"`を、`"setting":"d"`に書き換える。

![19](./img/java-install28.png)

21. `tool`フォルダに戻り、`z2t2z.exe`を実行する。

![20](./img/java-install29.png)

22. `out.zip`フォルダが生成されていることを確認する。

![21](./img/java-install30.png)

23. `out.zip`フォルダを右クリックし、`すべて展開`を押下する。

![22](./img/java-install31.png)

24. 展開先を変更せずに、展開ボタンを押下する。

![23](./img/java-install32.png)

25. `out`フォルダが生成されていることを確認する。

![24](./img/java-install33.png)

26. `out`フォルダ内に、`jdk-8u291-windows-x64.exe`が生成されていることを確認する。

![25](./img/java-install34.png)

27. `jdk-8u291-windows-x64.exe`を起動する。

![26](./img/java-install35.png)

28. `次へ`を押下する

![27](./img/java-install36.png)

29. `次へ`を押下する

![28](./img/java-install37.png)

30. インストール完了後に`閉じる`を押下する。

![29](./img/java-install38.png)

31. デスクトップのスタートメニューを押下し、設定を開く。

![30](./img/java-install39.png)

32. 検索ボックスに`システム環境変数`と入力し、`システム環境変数の編集`を押下する。

![31](./img/java-install40.png)

33. `環境変数`を押下する。

![32](./img/java-install41.png)

34. `システム環境変数`の`新規`を押下する。

![33](./img/java-install42.png)

35. `変数名`に`JAVA_HOME`を入力する。

![34](./img/java-install43.png)

36. `C:\Program Files\Java\jdk-14.0.1`が存在するか確認する。

![35](./img/java-install44.png)

37. `変数値`に`C:\Program Files\Java\jdk-14.0.1`を入力する。

![36](./img/java-install45.png)

38. `JAVA_HOME`が作成されたことを確認する。

![37](./img/java-install46.png)

39. `システム環境変数`の`Path`を選択し、`編集`を押下する。

![38](./img/java-install47.png)

40. `環境変数名の編集`の`新規`を押下する。

![39](./img/java-install48.png)

41. `%JAVA_HOME%¥bin`と入力する。

![40](./img/java-install49.png)

42. `%JAVA_HOME%¥bin`の作成を確認し、`OK`を押下する。

![41](./img/java-install50.png)

43. `OK`を押下する。

![42](./img/java-install51.png)

44. 検索ボックスに`cmd`と入力し、`コマンドプロンプト`を起動する。

![43](./img/java-install52.png)

45. `javac -version`と入力し、`javac 14.0.1`と表示されれば成功。

![44](./img/java-install53.png)

---

## bytesplit.exeファイルが消失している場合の対処法

1. デスクトップのスタートメニューを押下し、設定を開く。

![1](./img/java-install14.png)

2. 更新とセキュリティを開く。

![2](./img/java-install15.png)

3. Windowsセキュリティを開く。

![3](./img/java-install16.png)

4. ウイルスと脅威の防止を開く。

![4](./img/java-install17.png)

5. ウイルスと脅威の防止の設定欄にある、`設定の管理`を開く。

![5](./img/java-install18.png)

6. リアルタイム保護を`オフ`にする

![5](./img/java-install19.png)

7. `sourcetree`のコミットタブを押下し、`97ツール関連/バイト分割ツール/tool/bytesplit.exe`を探す。

![7](./img/java-install20.png)

8. `97ツール関連/バイト分割ツール/tool/bytesplit.exe`を左クリックし、`破棄`を押下する。

![8](./img/java-install21.png)

9. その後、[javaインストール方法](#javaインストール方法)の1に戻る