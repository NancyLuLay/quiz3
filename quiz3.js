// // JS-1
$('a:contains("eal")').css('color','red')

// // JS-2
$('a').on('click',function(e){
  e.preventDefault();
  $(this).fadeOut();
})
//
// // JS-3

var isEven = function(x) {
  return x % 2 == 0;
}

var filter = function(arrayIn, operation){
  var arrayOut = [];
  for (var i = 0; i < arrayIn.length; i++) {
    if (operation(arrayIn[i])) {
      arrayOut.push(arrayIn[i]);
    }
  }
  return arrayOut;
}

console.log(filter([1,2,3,4],isEven));


// Option2: Use unserscore

var filter = function(array,operation){
  for (var i=0; i<array.length; i++){
    array[i] = operation(array[i]);
  }
  return array;
};

  var isEven = function(x) {
  return x % 2 == 0;
}

console.log(filter([1,2,3,4], isEven));


// 1-// underscorejs.org/
// 2-save
// 3-move file to the same folder
// 4-npm install underscore

var _ = require('underscore');

var result = _.filter([1,2,3,4],function(n) {
  if (x % 2 == 0) {
    return true;
  } else {
    return false;
  }
});

console.log(result);

// the result would be [2,4]
// return only the values that are passed as "true" according to the filter method
