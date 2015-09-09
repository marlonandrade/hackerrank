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

function add(a, b) {
  return a + b;
}

Array.prototype.sum = function() {
  return this.reduce(function(sum, item) {
    return sum + parseInt(item);
  }, 0);
};

function main() {
  var elements = parseInt(readLine());
  var numbers = readLine().split(" ");
  console.log(numbers.sum());
}

