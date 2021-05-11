var inputNameValueIDS = [];
var data = [];
var message = null;
var isCreat = false;
var ctx = null;
var ctxInfo = {
  width: 768,
  height: 595,
  left: 0,
  top: 0,
  backgroundImg: null
};
var dragArr = [];
var clickedkArr = [];
var uploadImages = {}; // 上传文件信息
var lastThumb = null;
var initial = null;
var startTouch = null;
var successUploadImages = [];

var getProduct = function (callback) {
  var productId = location.search.match(/(?<=product_id=)\d*/g)[0];
  if (!productId) {
    alert("product_id is null")
    return
  }
  $.ajax({
    url: 'index.php?route=checkout/cart/getProductCategory',
    type: 'post',
    data: {
      productId: productId
    },
    dataType: 'json',
    success: function (json) {
      data = json;
      callback()
    },
    error: function () {
      message = 'FAILED TO GET DATA'
    }
  });
};

var renderThumbs = function (dom) {
  var HTML = '';
  for (var i = 0, len = data.length; i < len; i++) {
    HTML += '<li><img src="' + data[i].thumb + '" title="' + data[i].name + '" width="70" height="54" /></li>'
  }
  (i);

  $('.module-canvas .ui-list ul').html(HTML);
};

var renderList = function (dom) {
  var HTML = '<div class="ui-container" flex="dir:top">';
  HTML += '<div class="ui-title">';
  HTML += '<h3>STEPS TO DESIGN :</h3>';
  HTML += '<p>1. CHOOSE THE COLOR OR THE PATTERN OF THE SUIT FROM THE RIGHT</p>';
  HTML += '<p>2 UPLOAD YOUR LOGOS AND MOVE THEM TO THE BARREL, NECK, OR RUMP.</p>';
  HTML += '</div>';
  HTML += '<div class="ui-content" flex="main:justify">';
  HTML += '<div class="ui-canvas"><canvas id="canvas" width="' + ctxInfo.width + '" height="' + ctxInfo.height + '"></canvas></div>';
  HTML += '<div class="ui-list">';
  HTML += '<ul>';
  HTML += '</ul>';
  HTML += '</div></div>';
  HTML += '<div class="ui-button" flex="main:center">';
  HTML += '<div class="cell-upload" flex="main:center cross:center"><input type="file" id="uploadFile" accept="image/png" title="MAX UPLOAD 3" onchange ="handleUpload(this)" />UPLOAD LOGOS HERE(PNG)</div>';
  HTML += '<button onclick="handleCancel()">CANCEL</button>';
  HTML += '<button onclick="handleReset()">RESET</button>';
  HTML += '<button class="button" id="submit" disabled="true" onclick="handleSubmit()">SUBMIT</button>';
  HTML += '</div>';
  HTML += '</div>';

  dom.innerHTML = HTML;
  document.body.appendChild(dom);
};

$('#openCanvas').on('click', function () {
  inputNameValueIDS = [];
  inputNameValueIDS.push($(this).data('id'));

  var options = $('.options .ui-image-filed input');
  options.each(function (index) {
    inputNameValueIDS.push(options[index].name)
  });

  if (isCreat) {
    $('.module-canvas').show();
    canvas.addEventListener('mousedown', handleMousedown);
    return
  }
  var dom = document.createElement("div");
  dom.className = 'module-canvas';
  dom.setAttribute('flex', 'main:center cross:center');
  renderList(dom);

  isCreat = true;

  getProduct(function () {
    renderThumbs();
    var canvas = document.getElementById('canvas');
    ctxInfo.top = canvas.offsetTop;
    ctxInfo.left = canvas.offsetLeft;
    ctx = canvas.getContext('2d');
    canvas.addEventListener('mousedown', handleMousedown);
  });
});

$('.module-canvas .ui-list li').live('click', function () {
  $(this).addClass('is-active').siblings().removeClass('is-active');

  var index = $(this).index();
  var img = new Image();
  img.src = data[index].thumb;
  img.onload = function() {
    img.width = ctxInfo.width;
    img.height = ctxInfo.height;
    ctxInfo.backgroundImg = img;
    buttonStatus('submit', false);
    draw()
  }
});

var handleCancel = function () {
  $('.module-canvas').hide();
  var canvas = document.getElementById('canvas');
  canvas && canvas.removeEventListener('mousedown', handleMousedown);
};

var handleReset = function () {
  dragArr = [];
  clickedkArr = [];
  lastThumb = null;
  initial = null;
  startTouch = null;
  draw();
};

var handleSubmit = function () {
  if (!dragArr.length) {
    alert('PLEASE UPLOAD LOGOS HERE(PNG)');
    return
  }

  //filedUpload();
  handleSave();
};

var handleUpload = function (event) {
  var fileObj = new FileReader();
  var file = event.files[0];
  var key = file.size + file.name;

  if (uploadImages[key]) {
    alert("I've added it");
    return
  }

  uploadImages[key] = file; // 记录上传的文件
  fileObj.readAsDataURL(event.files[0]);

  fileObj.onload = function(e) {
    picReduce(fileObj.result, function(img) {
      event.setAttribute("type", 'text');
      var item = new DragImg(img, ctx);
      item.place = false;
      item.key = key;
      dragArr.push(item);

      draw();
      event.setAttribute("type", 'file');

      if (dragArr.length >= 3) {
        buttonStatus('uploadFile', true)
      }
    })
  }
};

function b64ToUint8Array(b64Image) {
  var img = atob(b64Image.split(',')[1]);
  var img_buffer = [];
  var i = 0;
  while (i < img.length) {
    img_buffer.push(img.charCodeAt(i));
    i++;
  }
  return new Uint8Array(img_buffer);
}

// 生成最新的拖拽图片
function handleSave() {
  dragArr.forEach(function(item, index) {
    // 先将所有的item的selected变为flase
    item.selected = false;
  });
  draw();

  var canvas = document.getElementById('canvas');
  var base64Image = canvas.toDataURL({format: 'image/png', quality: 1, width: 1200, height: 930});
  var u8Image = b64ToUint8Array(base64Image);


  $('#images img').attr('src', base64Image);

  var file = new Blob([u8Image], {type: "image/png"});
  var key = file.size + 'blob';
  if (!uploadImages[key]) {
    var hasKey = Object.keys(uploadImages).find(function (data) {
      return data.indexOf('blob') !== -1
    });
    hasKey && delete uploadImages[hasKey];
    uploadImages[key] = file;
  }

  handleCancel();
}

// 上传的logo之类的图片
function filedUpload() {
  queueFetch(0)
}

function queueFetch(index) {
  var list = Object.values(uploadImages);

  if (index === list.length) {
    uploadResult();
    return
  }
  var number = index + 1;
  if (list[index].isUpload) {
    successUploadImages.push(list[index].uploadValue);
    queueFetch(number)
  } else {
    var formData = new FormData();
    formData.append("file", list[index]);
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "index.php?route=product/product/upload", true);
    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          list[index].isUpload = true;
          var name = JSON.parse(xhr.response).file;
          list[index].uploadValue = name;
          list[index].name ? successUploadImages.push(name) : successUploadImages.unshift(name);
          queueFetch(number)
        } else {
          alert('SERVER ERROR');
        }
      }
    };
    xhr.send(formData);
  }
}

function uploadResult() {
  for (var i = 0; i < inputNameValueIDS.length; i++) {
    $('input[name="' + inputNameValueIDS[i] + '"]').attr('value', successUploadImages[i] || '');
  }
  successUploadImages = [];
  addCart();
}

var buttonStatus = function (dom = 'uploadFile', flag = false) {
  $('#' + dom).attr('disabled', flag)
};

var picReduce = function (picObj, callback) {
  var img = new Image();
  img.src = picObj;
  img.onload = function() {
    var w = img.width;
    var h = img.height;
    var scale = getScale(w, h);
    var maxW = w / scale;
    var maxH = h / scale;
    var imgObj = {
      url: img,
      width: maxW,
      height: maxH
    };
    callback(imgObj)
  }
};

var getScale = function (width, height) {
  if (width >= height) {
    if (height <= 120) {
      return 1
    } else {
      return height / 120
    }
  } else if (height > width) {
    if (width <= 120) {
      return 1
    } else {
      return width / 120
    }
  }
}

var handleMousedown = function (e) {
  // 初始化一个数组用于存放所有被点击到的图片对象
  clickedkArr = [];
  var x = e.clientX;
  var y = e.clientY;
  dragArr.forEach(function(item, index) {
    var place = item.isInWhere(x - ctxInfo.left, y - ctxInfo.top);
    item.place = place;
    item.index = index;
    // 先将所有的item的selected变为flase
    item.selected = false;

    place && clickedkArr.push(item)
  });
  var length = clickedkArr.length;
  if (length) {
    // 我们知道cavans绘制的图片的层级是越来越高的，因此我们取这个数组的最后一项，保证取到的图片实例是层级最高的
    var lastImg = clickedkArr[length - 1];
    // 如果是删除的话就移除
    if (lastImg.place === 'del') {
      dragArr.splice(lastImg.index, 1);
      delete uploadImages[lastImg.key];
      buttonStatus('uploadFile', false);
      // 重新绘制
      draw();
      return
    }
    // 将该实例的被选值设为true，下次重新绘制将绘制边框
    lastImg.selected = true;
    // 保存这个选中的实例
    lastThumb = lastImg
    // 保存这个实例的初始值，以后会用上
    initial = {
      initialX: lastImg.x,
      initialY: lastImg.y,
      initialH: lastImg.h,
      initialW: lastImg.w,
      initialRotate: lastImg.rotate
    }
  }
  // 重新绘制
  draw();
  // 保存点击的坐标，move时要用
  startTouch = {startX: x, startY: y};

  document.onmousemove = throttle(handleMove, 10);

  document.onmouseup = function(event) {
    document.onmousemove = null;
    document.onmouseup = null;
  }
};

var handleMove = function (e) {
  var x = e.clientX;
  var y = e.clientY;
  var initialX = initial.initialX
  var initialY = initial.initialY
  var startX = startTouch.startX;
  var startY = startTouch.startY;
  var lastImg = lastThumb;
  if (clickedkArr.length) {
    if (lastImg.place === 'move') {
      // 算出移动后的xy坐标与点击时xy坐标的差（即平移量）与图片对象的初始坐标相加即可
      lastImg.x = initialX + (x - startX)
      lastImg.y = initialY + (y - startY)
    }
    if (lastImg.place === 'transform') {
      var centerX = lastImg.centerX;
      var centerY = lastImg.centerY;
      // 旋转部分
      var angleBefore = Math.atan2(startY - centerY, startX - centerX) / Math.PI * 180
      var angleAfter = Math.atan2(y - centerY, x - centerX) / Math.PI * 180
      // 旋转的角度
      lastImg.rotate = initial.initialRotate + angleAfter - angleBefore
      // 缩放部分
      // 用勾股定理算出距离
      var lineA = Math.sqrt(Math.pow(centerX - startX, 2) + Math.pow(centerY - startY, 2));
      var lineB = Math.sqrt(Math.pow(centerX - x, 2) + Math.pow(centerY - y, 2));
      var w = initial.initialW + (lineB - lineA);
      // 由于是等比缩放，所以乘一个宽高比例。
      var h = initial.initialH + (lineB - lineA) * (initial.initialH / initial.initialW);
      // 定义最小宽高
      lastImg.w = w <= 5 ? 5 : w;
      lastImg.h = h <= 5 ? 5 : h;
      if (w > 5 && h > 5) {
        // 放大 或 缩小
        lastImg.x = initialX - (lineB - lineA) / 2;
        lastImg.y = initialY - (lineB - lineA) / 2;
      }
    }
    draw()
  }
};

// 画图区域
var draw = function () {
  ctx.clearRect(0, 0, ctxInfo.width, ctxInfo.height);
  ctxInfo.backgroundImg && ctx.drawImage(ctxInfo.backgroundImg, 0, 0, ctxInfo.width, ctxInfo.height);
  var list = dragArr.filter(function(item) {
    return !item.place
  });

  list.forEach(function(item) {
    return item.paint();
  });

  lastThumb && lastThumb.paint()
};

/**
 *
 * @param fn {Function}   实际要执行的函数
 * @param delay {Number}  执行间隔，单位是毫秒（ms）
 *
 * @return {Function}     返回一个“节流”函数
 */
function throttle(fn, threshold) {
  // 记录上次执行的时间
  var last;
  // 定时器
  var timer;
  // 默认间隔为 250ms
  threshold || (threshold = 250);
  // 返回的函数，每过 threshold 毫秒就执行一次 fn 函数
  return function () {
    // 保存函数调用时的上下文和参数，传递给 fn
    var context = this;
    var args = arguments;
    var now = +new Date();
    // 如果距离上次执行 fn 函数的时间小于 threshold，那么就放弃
    // 执行 fn，并重新计时
    if (last && now < last + threshold) {
      clearTimeout(timer);
      // 保证在当前时间区间结束后，再执行一次 fn
      timer = setTimeout(function () {
        last = now;
        fn.apply(context, args)
      }, threshold)
      // 在时间区间的最开始和到达指定间隔的时候执行一次 fn
    } else {
      last = now;
      fn.apply(context, args)
    }
  }
}
