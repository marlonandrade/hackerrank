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

function main() {
  var testCases = parseInt(readLine());

  for (var i = 0; i < testCases; i++) {
    var numbers = readLine().split(" ");

    var first = parseInt(numbers[0]);
    var second = parseInt(numbers[1]);

    console.log(add(first, second));
  }
}

