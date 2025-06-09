const ShellSpawn = require('./lib/ShellSpawn')
const ShellExec = require('./lib/ShellExec')
const GetFiles = require('./lib/GetFiles')

const path = require('path')
const fs = require('fs')
const FtpSrv = require('ftp-srv');

// convert a.tif -thumbnail 64x64^ -gravity center -extent 64x64 b.ico

let main = async function () {
  let files = GetFiles()
  for (let i = 0; i < files.length; i++) {
    let file = files[i]
    
    // FTP 連接網址，例如：ftp://0.0.0.0:2121
    const ftpServer = new FtpSrv({
      url: "ftp://0.0.0.0:2121",
      anonymous: false // 若要開放匿名登入可設為 true
    });

    // 使用者驗證（簡單帳密驗證）
    ftpServer.on('login', ({ username, password }, resolve, reject) => {
      if (username === 'test' && password === '1234') {
        // 設定根目錄為目前資料夾
        resolve({ root: process.cwd() });
      } else {
        reject(new Error('Invalid credentials'));
      }
    });

    // 啟動伺服器
    ftpServer.listen()
      .then(() => {
        console.log('FTP server is running on port 2121');
      });
  }
}

main()