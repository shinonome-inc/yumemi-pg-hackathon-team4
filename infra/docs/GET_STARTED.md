# GET STARTED

## Terraform バージョン

v1.11.0

## Git 管理外の秘匿ファイルの追加

秘匿情報を含んだファイルは Git の管理下から外しています。
Google ドライブから秘匿ファイルをダウンロードし、以下の表を参考に追加を行って下さい。

| ファイル                        | パス                      |
| ------------------------------- | ------------------------- |
| **`terraform.tfvars`**          | terraform.tfvars          |
| **`gcp-terraform-sa-key.txt`**  | gcp-terraform-sa-key.txt  |
| **`gcp-terraform-sa-key.json`** | gcp-terraform-sa-key.json |

※開発メンバーで Google ドライブのアクセス権限がない場合や場所がわからない場合は [@KobayashiYoh](https://github.com/KobayashiYoh) までご連絡下さい。

## Terraform の初期化

以下のコマンドを実行して Terraform の初期化を行います。

```
terraform init
```

## Terraform のプラン作成

以下のコマンドを実行して Terraform の Plan を作成します。

```
terraform plan
```

## Terraform の適用

以下のコマンドを実行して Terraform の適用を行います。

```
terraform apply -auto-approve
```
