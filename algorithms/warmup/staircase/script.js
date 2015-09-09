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

function stairCase(height, size) {
  var level = "";

  for (var i = 0; i < size; i++) {
    if (i < (height - 1)) {
      level += " "
    } else {
      level += "#"
    }
  }

  return level;
}

function main() {
  var size = parseInt(readLine());

  for (var i = size; i > 0; i--) {
    console.log(stairCase(i, size));
  }
}

