var close = new Image();
var scale = new Image();
close.src = 'catalog/view/theme/default/images/close.png';
scale.src = 'catalog/view/theme/default/images//scale.png';

class DragImg {
  constructor (img, canvas, ctxInfo) {
    this.x = 130;
    this.y = 130;
    this.w = img.width;
    this.h = img.height;
    this.url = img.url;
    this.ctx = canvas;
    this.rotate = 0;
    this.left = ctxInfo.left;
    this.top = ctxInfo.top;
    this.selected = true
  }

  drawBackground (url) {
    this.ctx.save();
    this.ctx.drawImage(url, 0, 0, this.w, this.h);
    this.ctx.restore()
  }

  paint () {
    this.ctx.save();
    this.centerX = this.x + (this.w >> 1);
    this.centerY = this.y + (this.h >> 1);
    // 旋转元素
    this.ctx.translate(this.centerX, this.centerY);
    this.ctx.rotate(this.rotate * Math.PI / 180);
    this.ctx.translate(-this.centerX, -this.centerY);
    // 渲染元素
    this.ctx.drawImage(this.url, this.x, this.y, this.w, this.h);
    // 如果是选中状态，绘制选择虚线框，和缩放图标、删除图标
    if (this.selected) {
      this.ctx.setLineDash([10, 10]);
      this.ctx.lineWidth = 2;
      this.ctx.strokeStyle = 'red';
      this.ctx.lineDashOffset = 10;
      this.ctx.strokeRect(this.x, this.y, this.w, this.h);
      this.ctx.drawImage(close, this.x - 12, this.y - 12, 24, 24);
      this.ctx.drawImage(scale, this.x + this.w - 12, this.y + this.h - 12, 24, 24);
    }
    this.ctx.restore()
  }

  isInWhere (x, y, selected) {
    // 变换区域左上角的坐标和区域的高度宽度
    const transformW = 24;
    const transformH = 24;
    let transformX = this.x + this.w;
    let transformY = this.y + this.h;
    const transformAngle = Math.atan2(transformY - this.centerY, transformX - this.centerX) / Math.PI * 180 + this.rotate;
    const transformXY = this.getTransform(transformX, transformY, transformAngle);
    transformX = transformXY.x; transformY = transformXY.y;
    // 删除区域左上角的坐标和区域的高度宽度
    const delW = 24;
    const delH = 24;
    let delX = this.x;
    let delY = this.y;

    const delAngle = Math.atan2(delY - this.centerY, delX - this.centerX) / Math.PI * 180 + this.rotate;

    const delXY = this.getTransform(delX, delY, delAngle);
    delX = delXY.x; delY = delXY.y;
    // 移动区域的坐标
    const moveX = this.x;
    const moveY = this.y;

    const newX = x - this.left;
    const newY = y - this.top;

    if (selected && newX - transformX >= 0 && newY - transformY >= 0 && transformX + transformW - newX >= 0 && transformY + transformH - newY >= 0) {
      // 缩放区域
      return 'transform'
    } else if (selected && newX - delX >= 0 && newY - delY >= 0 && delX + delW - newX >= 0 && delY + delH - newY >= 0) {
      // 删除区域
      return 'del'
    } else if (newX - moveX >= 0 && newY - moveY >= 0 && moveX + this.w - newX >= 0 && moveY + this.h - newY >= 0) {
      // 移动区域
      return 'move'
    }
    // 不在选择区域里面
    return false
  }

  getTransform (x, y, rotate) {
    // 将角度化为弧度
    var angle = Math.PI / 180 * rotate
    // 初始坐标与中点形成的直线长度不管怎么旋转都是不会变的，用勾股定理求出然后将其作为斜边
    var r = Math.sqrt(Math.pow(x - this.centerX, 2) + Math.pow(y - this.centerY, 2))
    // 斜边乘sin值等于即可求出y坐标
    var a = Math.sin(angle) * r
    // 斜边乘cos值等于即可求出x坐标
    var b = Math.cos(angle) * r
    // 目前的xy坐标是相对于图片中点为原点的坐标轴，而我们的主坐标轴是canvas的坐标轴，所以要加上中点的坐标值才是标准的canvas坐标
    return {
      x: this.centerX + b - 12,
      y: this.centerY + a - 12
    }
  }
}


