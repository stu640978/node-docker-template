## Node Docker Template

#### Description

此專案目的是為了需要多個 NodeJS 版本的開發者，提供一個快速建立指定 NodeJS 版本環境的 Docker Compose Template。

#### File Structure

```
node-docker-template
│  .env # 配置檔案
│  docker-compose.yml
│  Readme.md
│
├─entrypoint
│      entrypoint.sh # 進入點腳本
│
└─projects # 專案目錄
    ├─project1 # 專案1
    └─project2 # 專案2
```

#### Prerequisites

- 安裝 `Docker` 或 `Podman`
- 安裝及配置好 `Docker Compose` 或 `Podman Compose`

#### Usage

1. Clone 或下載此專案
2. (可選)更改資料夾名稱為所要使用的 Node 版本，方便後面辨別
3. 更改 `.env` 檔案中的 `NODE_VERSION` 為所要使用的 Node 版本

   - 可參考[NodeJS Docker Hub](https://hub.docker.com/_/node)查看可用版本 Tag

4. (可選)更改 `.env` 檔案中 `PACKAGE_MANAGER` 為所要使用的套件管理工具

   - 預設包管理器為 `npm`
   - 目前可選包管理器有 `yarn`, `pnpm`
   - 如果需要使用其他的套件管理工具，請自行修改 `entrypoint/entrypoint.sh`

5. 將開發專案放入 `projects` 資料夾中
6. 在 `node-docker-template` 專案目錄中執行`docker compose up -d`
7. 進入容器中`/app`目錄下執行`npm install`或`yarn install`安裝套件
8. 開始開發

#### Note

- 預設將專案目錄掛載到容器中的`/app`目錄下
- Vite 專案經過測試需修改 `vite.config.js` 中的`usePolling`設定，才能正常抓到檔案更新
  ```js
  export default defineConfig({
    server: {
      watch: {
        usePolling: true,
      },
    },
  });
  ```
- Webpack 專案經過測試需修改 `webpack.config.js` 中的`watchOptions`設定，才能正常抓到檔案更新
  ```js
  module.exports = {
    //...
    watchOptions: {
      poll: true,
    },
  };
  ```
