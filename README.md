# nvchecker

![nvchecker](https://github.com/guizai/nvchecker/workflows/nvchecker/badge.svg) ![Build Docker Image](https://github.com/guizai/nvchecker/workflows/Build%20Docker%20Image/badge.svg)

使用 [nvchecker](https://github.com/lilydjwg/nvchecker) + GitHub Actions 定期检查软件/包新版本并通过邮件进行通知。

## 说明

平时使用的一些软件/包有新版本时，没有好的办法得知，试过一些服务，也很难满足各种情况。因此自己写了一个，获取版本变更与 Changelog 并邮件通知，只适配了 GitHub 和 PyPi。

后来发现了 [nvchecker](https://github.com/lilydjwg/nvchecker)，很灵活，但是目前只能检查版本变更，无法获取 Changelog，不过也够用了。

## 使用

在仓库 `Settings - Secrets` 中添加：

- EMAIL_TO
- MAILGUN_API_KEY
- MAILGUN_DOMAIN_NAME
