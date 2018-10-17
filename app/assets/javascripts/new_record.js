// set up basic variables for app
//mozilaのgitよりサンプルコードを取得

var record = document.querySelector('.record');
var stop = document.querySelector('.stop');
var soundClips = document.querySelector('.sound-clips');
var canvas = document.querySelector('.visualizer');
var mainSection = document.querySelector('.main-controls');
// htmlのクラスで指定する場合には、s上記のquerySelectorを指定する

// disable stop button while not recording

stop.disabled = true;

// visualiser setup - create web audio api context and canvas

var audioCtx = new (window.AudioContext || webkitAudioContext)();
var canvasCtx = canvas.getContext("2d");

//main block for doing the audio recording

if (navigator.mediaDevices.getUserMedia) {
  console.log('getUserMedia supported.');

  var constraints = { audio: true };
  var chunks = [];

  var onSuccess = function(stream) {
    var mediaRecorder = new MediaRecorder(stream);
    // 音声録音
    visualize(stream);
    //音声の波形を映し出す。下で定義している
    record.onclick = function() {
      mediaRecorder.start();
      console.log(mediaRecorder.state);
      console.log("recorder started");
      record.style.background = "red";

      stop.disabled = false;
      record.disabled = true;
    }

    stop.onclick = function() {
      mediaRecorder.stop();
      console.log(mediaRecorder.state);
      console.log("recorder stopped");
      record.style.background = "";
      record.style.color = "";
      // mediaRecorder.requestData();

      stop.disabled = true;
      record.disabled = false;
    }

    mediaRecorder.onstop = function(e) {
      console.log("data available after MediaRecorder.stop() called.");

      var clipName = prompt('Enter a name for your sound clip?','My unnamed clip');
      console.log(clipName);
      var clipContainer = document.createElement('article');
      var clipLabel = document.createElement('p');
      var audio = document.createElement('audio');
      var deleteButton = document.createElement('button');
      var downloadLink = document.createElement("a");
      var saveButton = document.createElement('button');

      clipContainer.classList.add('clip');
      audio.setAttribute('controls', '');
      deleteButton.textContent = 'Delete';
      deleteButton.className = 'delete';
      downloadLink.textContent = "Download";
      downloadLink.className = "download";
      saveButton.textContent = 'Save';
      saveButton.className = 'save';


      if(clipName === null) {
        clipLabel.textContent = 'My unnamed clip';
      } else {
        clipLabel.textContent = clipName;
      }

      clipContainer.appendChild(audio);
      clipContainer.appendChild(clipLabel);
      clipContainer.appendChild(deleteButton);
      clipContainer.appendChild(downloadLink);
      clipContainer.appendChild(saveButton);
      soundClips.appendChild(clipContainer);


      audio.controls = true;
      var blob = new Blob(chunks, { 'type' : 'audio/ogg' });
      // 'audio/ogg; codecs=opus' から 'audio/wavに変更'
      chunks = [];
      var audioURL = window.URL.createObjectURL(blob);
      // audioURL.Object = blob;
      // https://www.fxsitecompat.com/ja/docs/2018/url-createobjecturl-no-longer-accepts-mediastream-as-argument/
      audio.src = audioURL;
      // audio.srcObject = blob;

      //ダウンロードリンクの作成
      downloadLink.href = audioURL;
      downloadLink.download = "test";

      console.log("recorder stopped");

      deleteButton.onclick = function(e) {
        evtTgt = e.target;
        evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode);
      }



        // サーバーに保存するための動作
      saveButton.onclick = function(){
          /*https://developer.mozilla.org/ja/docs/Web/Guide/Using_FormData_Objects*/
        var fd = new FormData();
        // fd.append('name', "test");
        fd.append("test.ogg", blob);
        console.log(fd);
          /*          https://qiita.com/EastResident/items/639e886531d9687d70b1
          http://tech.at-iroha.jp/?p=663
          参考URL https://www.sejuku.net/blog/30245
          https://blog.codecamp.jp/jquery_basic/
          https://blog.codecamp.jp/ajax_intro
          https://blog.codebook-10000.com/entry/20140404/1396578799
          http://www.koikikukan.com/archives/2014/09/30-013333.php  */
          for (item of fd);
            console.log(item);

          // CSRFを突破するための、記述。下記サイトよりコピーしてきた
          // https://qiita.com/a_ishidaaa/items/7c3fa339d3bea25a9ba8
          $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
                  var token;
                  if (!options.crossDomain) {
                    token = $('meta[name="csrf-token"]').attr('content');
                    if (token) {
                         return jqXHR.setRequestHeader('X-CSRF-Token', token);
                     }
                  }
            });
          $.ajax({
            url: 'http://localhost:3000/posts/create',
            type: "POST",
            // dataType: 'blob',
            data: {audio: fd},
            processData: false, //JQuery がデータを処理しないように指定
            contentType: false  //JQuery が contentTypeを設定しないように指定 （cf. mdn FormData）
          })
          .done(function(data){
            console.log(data);
          })
          .fail(function(data){
            console.log("送信に失敗しました");
          });
      }

      clipLabel.onclick = function() {
        var existingName = clipLabel.textContent;
        var newClipName = prompt('Enter a new name for your sound clip?');
        if(newClipName === null) {
          clipLabel.textContent = existingName;
        } else {
          clipLabel.textContent = newClipName;
        }
      }
    }

    mediaRecorder.ondataavailable = function(e) {
      chunks.push(e.data);
    }
  }

  var onError = function(err) {
    console.log('The following error occured: ' + err);
  }

  navigator.mediaDevices.getUserMedia(constraints).then(onSuccess, onError);

// } else {
   console.log('getUserMedia not supported on your browser!');
}

// 波形の作成
function visualize(stream) {
  var source = audioCtx.createMediaStreamSource(stream);

  var analyser = audioCtx.createAnalyser();
  analyser.fftSize = 2048;
  var bufferLength = analyser.frequencyBinCount;
  var dataArray = new Uint8Array(bufferLength);

  source.connect(analyser);
  //analyser.connect(audioCtx.destination);

  draw()

  function draw() {
    WIDTH = canvas.width
    HEIGHT = canvas.height;

    requestAnimationFrame(draw);

    analyser.getByteTimeDomainData(dataArray);

    canvasCtx.fillStyle = 'rgb(200, 200, 200)';
    canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

    canvasCtx.lineWidth = 2;
    canvasCtx.strokeStyle = 'rgb(0, 0, 0)';

    canvasCtx.beginPath();

    var sliceWidth = WIDTH * 1.0 / bufferLength;
    var x = 0;


    for(var i = 0; i < bufferLength; i++) {

      var v = dataArray[i] / 128.0;
      var y = v * HEIGHT/2;

      if(i === 0) {
        canvasCtx.moveTo(x, y);
      } else {
        canvasCtx.lineTo(x, y);
      }

      x += sliceWidth;
    }

    canvasCtx.lineTo(canvas.width, canvas.height/2);
    canvasCtx.stroke();

  }
}

window.onresize = function() {
  canvas.width = mainSection.offsetWidth;
}

window.onresize();
