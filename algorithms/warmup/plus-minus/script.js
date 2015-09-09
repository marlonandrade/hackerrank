// input boilerplate

process.stdin.resume();
process.stdin.setEncoding('ascii');

var _data = "";
var _lines = "";
var _lineIndex = 0;

process.stdin.on('data', function (data) { _data += data; });
process.stdin.on('end', function () {
  _lines = _data.split("\n");
  main();
});

function readLine() {
  return _lines[_lineIndex++];
}

// code

String.prototype.intArray = function() {
  return this.split(' ').map(function(el) {
    return parseInt(el);
  });
};

function countNumbers(numbers) {
  var pos = neg = zer = 0;

  numbers.forEach(function(number) {
    if (number > 0) {
      pos++;
    } else if (number < 0) {
      neg++;
    } else {
      zer++;
    }
  });

  return {
    positive: pos,
    negative: neg,
    zeros: zer
  };
}

function main() {
  var elements = parseInt(readLine());

  var numbers = readLine().intArray();
  var count = countNumbers(numbers);

  console.log(count['positive'] / elements);
  console.log(count['negative'] / elements);
  console.log(count['zeros'] / elements);
}

