
const spawn = require('child_process').spawn;

// fire up RServe within the same dyno as Node.js

// const R = spawn('/usr/bin/R', ['-f', 'rserve.R', '--gui-none', '--no-save']); // use for local dev
const R = spawn(
  'fakechroot',
  ['fakeroot', 'chroot', '/app/.root', '/usr/bin/R', '-f', '/app/rserve.R', '--gui-none', '--no-save']
);

R.stdout.on('data', (data) => {
  console.log(`stdout: ${data}`);
});

R.stderr.on('data', (data) => {
  console.log(`stderr: ${data}`);
});

var Rserve = require("rserve-js");
var Express = require('express');
var Promise = require('promise');

// promise helper around rserve eval method
function eval(client, rcode) {
  return new Promise(function(fulfill, reject) {
    client.eval(rcode, function(err, response) {
      if (err) {
        reject(err);
      }
      fulfill(response);
    })
  });
}

var app = Express();

app.set('port', (process.env.PORT || 5000));

app.get('/', function(request, response) {

  var client = Rserve.connect("localhost", 6311, function() {

    Promise.resolve(true)
      .then(function(_) {
        return eval(client, "demo(is.things)");
      })
      .then(function(result) {
        response.send("R Result\n" + result + "\n\n");
      });

  });

});

app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});
