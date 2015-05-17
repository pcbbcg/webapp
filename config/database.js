'use strict';

var pg = require('pg');
var postgrator = require('postgrator');

var conString = process.env.DATABASE_URL || "postgres://postgres:postgres@localhost/pcbbcg";

// Setup postgrator
postgrator.setConfig({
    migrationDirectory: __dirname + '/migrations',
    driver: 'pg',
    connectionString: conString
});

// Use migrate to create tables defined in 001.do.pcbbcg-init.sql-file
postgrator.migrate('001', function(err, migrations) {
    if(err) {
        console.log(err);
    } else {
        console.log(migrations);
    }
    postgrator.endConnection(function() {
    });
});

// This starts initializes a connection pool
// it will keep idle connections open for a (configurable) 30 seconds
// and set a limit of 20 (also configurable)
pg.connect(conString, function(err, client, done) {
    if(err) {
        return console.error('error fetching client from pool', err);
    }
    
    client.query('SELECT $1::int AS number', ['1'], function(err, result) {
        done();
        if(err) {
            return console.error('error running query', err);
        }
        console.log(result.rows[0].number);
    });
});
