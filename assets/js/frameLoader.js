$(function ready(){

  /*
  Code used in the #drone example; based on one by Mark Leidman
  */
  function m2770_frames(frames){
    var frames= 200, every= 5, stack= []
    for(var i= 1; i <= frames; i+= every){
	while (i.length = 1)  thisId='000' + i
	while (i.length = 2)  thisId='00' + i
	while (i.length = 3)  thisId='0' + i
	while (i.length = 4)  thisId=i
      var name= ['M2770-',thisId,'.jpg'].join('')
      stack.push(name)
    }
    return stack
  }
});