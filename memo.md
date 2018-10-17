## 音声入力のメモ
- HTMLのなかにJavaScriptを書き込むときは<scrpt></scrpt>タグで囲んだあとに、「ここのファイルを参照してくれ」と指定する
-  そのほうが、長い目で見たときには修正が簡単。htmlのファイル全体が短くなり、修正も簡単になる。
- 実装段階で参考になりそうなサイト
  - https://developers.google.com/web/fundamentals/media/recording-audio/?hl=ja
     - 一番参考になる。行いたい処理とそれに対応したアクションが掲示されている
  - https://www.html5rocks.com/en/tutorials/getusermedia/intro/
  - **本当に参考にあるサイト（会社のサイト）**
    - http://jellyware.jp/kurage/iot/webspeechapi.html
    - **音声の入力は途中で途切れるみたい**
  -  paizaの記事
  - https://paiza.hatenablog.com/entry/2016/07/05/%E9%9F%B3%E5%A3%B0%E8%AA%8D%E8%AD%98%E5%85%A5%E9%96%80%EF%BC%81Web_Speech_API%E3%82%92%E4%BD%BF%E3%81%84Chrome%E3%83%96%E3%83%A9%E3%82%A6%E3%82%B6%E3%82%92%E9%9F%B3%E5%A3%B0%E6%93%8D%E4%BD%9C%E3%81%99
  - https://qiita.com/shinkuFencer/items/b15488de72b32621acf9
- メソッドや各種モジュールに対するブラウザの対応状況を表示するサイト
  - https://caniuse.com/#home
  - https://www.w3schools.com/Html/html5_audio.asp
  - https://techbooster.org/html5/9915/
  - https://www.w3schools.com/Html/html5_audio.asp
```
<script></script>
```
### base64 か blob形式に変換する
- https://stackoverflow.com/questions/18650168/convert-blob-to-base64]
- 音声のファイル形式として、blob,  base64があるもよう

- FormDataでrails にも送信できる
- https://qiita.com/0829/items/a8c98c8f53b2e821ac94

- 上記の設定をすれば、railsでの音声ファイルのS3(Amazonのフォルダ）に保存可能

### ブラウザ経由で音声を入力・保存
- https://ja.stackoverflow.com/questions/19687/%E3%82%A6%E3%82%A7%E3%83%96%E3%82%A2%E3%83%97%E3%83%AA%E3%81%A7%E3%81%AE%E9%8C%B2%E9%9F%B3
- https://stackoverflow.com/questions/25101037/record-audio-using-the-users-microphone-with-html5
- https://github.com/cwilso/AudioRecorder
- https://github.com/Audior/Recordmp3js

- 音声の変換に関して **canvas** が関わってきそう
  - 下のURLでも canvasが言及されている
  - https://www.html5rocks.com/en/tutorials/getusermedia/intro/


- 今は下のメソッドの利用が推進されている
  - You should now use the **navigator.MediaDevices.getUserMedia()** method, which is widely supported
- https://www.html5rocks.com/en/tutorials/three/intro/
- http://learningthreejs.com/blog/2012/02/07/live-video-in-webgl/
- https://www.html5rocks.com/en/tutorials/getusermedia/intro/
### github でアプロードされているコード
- https://github.com/cwilso/AudioRecorder
- https://github.com/Audior/Recordmp3js


### ブラウザで音声にエフェクトをかける
- Web Audio API を利用するみたい
- https://qiita.com/hiruberuto/items/72236dfb8476cd490e01

## HTML5では音声や動画を設定可能
```
<audio src=""></audio><video src=""></video>
```

- audio や videoは音声や動画を再生するタグ
- 音声の生成
- https://www.tagindex.com/html5/embed/audio.html
- http://www.htmq.com/html5/audio.shtml
- https://developer.mozilla.org/ja/docs/Web/HTML/Element/audio
- http://www.html5-memo.com/audio/player001/

参考）
- テキストの読み上げ
  - https://app.codegrid.net/entry/2016-web-speech-api-1

### 音声を変化させて再生する
- https://app.codegrid.net/entry/2016-web-speech-api-1

- 音声解析と、音声の変化
  - https://developer.mozilla.org/ja/docs/Web/API/Web_Audio_API

```


```


## JavaScriptの関数の呼び出し

https://www.sejuku.net/blog/31671

### クリックしたら呼び出し
- onclick属性に指定した場合のみ、関数のsample()が自校される
  - 自動的に呼び出される
```
<button onclick="sample()">ボタン<\button>
```

### ある動作が完了したら呼び出し――ロードが完了したら呼び出し
- htmlFileなどのリソースが全て読み込まれたタイミングで、任意の関数を呼び出す

```
window.onload = function(){
  console.log("Hello World");
}

// addEventListener()を使い記述
window.addEventListener('load', function(){
  console.log("Hello World");
  })
```

## paizaのhtmlとJavaScriptの書き方の参考（ボタンを押して実行するときの操作）
- 参考
  - https://paiza.hatenablog.com/entry/2016/07/05/%E9%9F%B3%E5%A3%B0%E8%AA%8D%E8%AD%98%E5%85%A5%E9%96%80%EF%BC%81Web_Speech_API%E3%82%92%E4%BD%BF%E3%81%84Chrome%E3%83%96%E3%83%A9%E3%82%A6%E3%82%B6%E3%82%92%E9%9F%B3%E5%A3%B0%E6%93%8D%E4%BD%9C%E3%81%99

- html上で設定した **id** を **getElementById()** の引数に指定
- 上記を変数に代入
- ある動作や設定を行ったときの処理
  - ボタンをクリックしたときの動作の設定
  - 音声認識した結果を得る処理

```
btn.addEventListener( "click", function(){

  })
```

```
[index.html]
<body>
  <h3>Web Speech APIサンプル</h3>
  <button id="btn">音声認識開始</button>
  <div id="content"></div>

  <script src="app.js"></script>
</body>

[app.js]
var speech = new webkitSpeechRecogintioin();
// 音声認識を使うための準備は上記の一行のみ

var btn = document.getElementById(btn);
var content = document.getElementById('content');

//音声認識APIの使用
var speech = new webkitspeechRecognition();

//言語の日本語に設定
speech.lang = "ja";

btn.addEventListener( "click". function() {
  // 1 ボタンをクリックした時の処理
  speech.start(); //音声認識の処理開始
} );

speech.addEvnentListener('result', functioin(e){
  // 2音声認識した結果を得る処理
  console.log( e ); //音声認識で取得した情報を、コンソールに表示
  // 認識された言葉をtextに代入。認識された言葉は、resluts配列何にある。transcriptに代入されているから
  var text = e.results[0][0].transcript;
  //認識されたtextを、表示用にdivタグに代入する
  });
```


- イベントハンドラ
  - イベントは「クリックした」「ページが読み込まれた」など。そのイベントに対して発生する処理が、イベントハンドラ
  - その処理はタブの部分で制定する


- イベントハンドラを設定する

1. タグ内にイベントハンドラを宣言

```
<.....onイベント名 = 処理 ......?
(a)
<form action="#">
<input type= "button" value="OK" onclick="window.alert('clickイベント')">

(b)
<script type="text/javascript">
  function btn_ok(){
    window.alert('clickイベント');
  }
</script>

<form action="#">
<input type="button" value="OK" onclick="btn_ok()">
</formt>

```

2. ページのloadイベントで、イベントハンドラを宣言
  - ページのイベントでイベントハンドラを宣言する場合は、getElementByIdメソッドを使用して、以下のように記述する

```
window.onload = function(){
  document.getElementByIId("ID値").onイベント名 = function(){
    処理
  }
}

(a)
<script type = "text/javascript">
  window.onload = function(){
    document.getElementById("btn_ok").onclick = function(){
      window.alert("Hello JavaScript World");
    }
  }
</script>

<form action="#">
<input id = "btn_ok" type="button" value="OK">
</form>

```

- form タグは、属性が指定されていない場合は、フォームが表示されているページ自体に対してデータを送信する → <form>
- <form action= "#"> は、以前はactionタグ属性が必須であったため高記述している。html5にては必須ではない
