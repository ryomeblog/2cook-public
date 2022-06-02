# PostgreSQLインストール方法

1. 以下のURLにアクセスする。
    - [インストーラー](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

2. `Windows x86-64`の`version14.2`をクリック

![01](./img/PSQL01.png)

3. `postgresql-14.2-1-windows-x64`をダブルクリック

![02](./img/PSQL02.png)

4. `Next`をクリック

![03](./img/PSQL03.png)

5. `Next`をクリック

![04](./img/PSQL04.png)

6. `Next`をクリック

![05](./img/PSQL05.png)

7. `Next`をクリック

![06](./img/PSQL06.png)

8. `Next`をクリック

![07](./img/PSQL07.png)

9. 自分でパスワード決め、入力する
　その後`Next`をクリック

![08](./img/PSQL08.png)

10. `Next`をクリック

![09](./img/PSQL09.png)

11. `Next`をクリック

![10](./img/PSQL10.png)

12. `Next`をクリック

![11](./img/PSQL11.png)

13. `Next`をクリック

![12](./img/PSQL12.png)

14. ダウンロード中

![13](./img/PSQL13.png)

15. チェックボックスのチェックを外し`Finish`をクリック

![14](./img/PSQL14.png)

16. Windowsマークの右の検索欄で`環境変数`と打ち込み、`システム環境変数の編集`をクリック

![15](./img/PSQL15.png)

17. `環境変数`をクリック

![16](./img/PSQL16.png)

18. `Path`を選択し`編集`をクリック

![17](./img/PSQL17.png)

19. フォルダで赤枠のような順番で開き、そのアドレスをコピーする

![18](./img/PSQL18.png)

20. `新規`をクリックしたとき、文字を入力する場所が増えるので先ほどコピーしたアドレスを貼り付けする。
 
![19](./img/PSQL19.png)

21. `OK`をクリックし閉じる

![20](./img/PSQL20.png)

22. コマンドプロンプトを開き`psql -U postgres`と入力しエンター
インストール時に設定したパスワードを入力する
最後に`postgres=#`と入力されていればOKです

![21](./img/PSQL21.png)





23.  終わりです。お疲れさまでした。

![01](./img/ジンメンケン.png)
