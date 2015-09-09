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

function main() {
  var elements = parseInt(readLine());

  var diff = 0;

  for (var i = 0; i < elements; i++) {
    var numbers = readLine().intArray();

    diff += numbers[i];
    diff -= numbers[elements-i-1];
  }

  console.log(Math.abs(diff));
}

