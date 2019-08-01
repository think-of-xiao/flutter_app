/// 为了方便管理制作了一个ExpandStateBean类，里边就是两个状态，一个是是否展开isOpen,另一个索引值
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}