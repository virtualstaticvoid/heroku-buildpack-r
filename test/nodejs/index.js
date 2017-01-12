// Example Node.js application to interface with R via RServe

// Need to create R in a child process since RServe is accessible
// via a TCP port and Heroku only permits one port to be used
// for use by the web process only.
const Spawn = require('child_process').spawn;

// const R = Spawn('/usr/bin/R', ['-f', 'rserve.R', '--gui-none', '--no-save']); // use for local dev
const R = Spawn(
  'fakechroot',
  ['fakeroot', 'chroot', '/app/.root', '/usr/bin/R', '-f', '/app/rserve.R', '--gui-none', '--no-save']
);

// hook up stdout and stderr for visibility into the child process
R.stdout.on('data', (data) => {
  console.log(`stdout: ${data}`);
});

R.stderr.on('data', (data) => {
  console.log(`stderr: ${data}`);
});

// promise helper around rserve eval method

const Promise = require('promise');

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

const Express = require('express');
const Rserve = require("rserve-js");

var app = Express();

app.set('port', (process.env.PORT || 5000));

app.get('/', function(request, response) {

  var rcode = "demo(is.things)";

  var client = Rserve.connect("localhost", 6311, function() {

    Promise.resolve(true)
      .then(function(_) {
        return eval(client, rcode);
      })
      .then(function(result) {
        response.send("R Result\n" + result + "\n\n");
      });

  });

});

app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});
