var pg = require('pg');
var postgrator = require('postgrator');

var conString = process.env.DATABASE_URL || "postgres://postgres:postgres@localhost/pcbbcg";

(function() {
    'use strict';

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
        }
        else {
            console.log(migrations);
        }
        postgrator.endConnection(function() {
        });
    });
})();

    
exports.getAllGames = function() {
    'use strict';
    
    var queryString = 'SELECT * FROM game';
    
    pg.connect(conString, function(err, client, done) {
        if(err) {
            return console.error('Error fetching client from pool', err);
        }
        client.query(queryString, function(err, result) {
            //call `done()` to release the client back to the pool
            done();
            if(err) {
                return console.error('Error running query', err);
            }
            else {
                console.log(result.rows);
                return result.rows;
            }
        });
    });
};

exports.addNewGame = function(data) {
    'use strict';
    
    var queryString = 
        "INSERT INTO game(title, release_year, developers, publishers, boxart_front, boxart_spine) VALUES ($1,$2,$3,$4,$5,$6)";
        
    pg.connect(conString, function(err, client, done) {
        if(err) {
            return console.error('Error fetching client from pool', err);
        }
        client.query(queryString, [data.title, data.release_year, data.developers, data.publishers, data.boxart_front, data.boxart_spine], function(err, result) {
            //call `done()` to release the client back to the pool
            done();
            if(err) {
                return console.error('Error running query', err);
            }
            else {
                console.log(result.rowCount);
                return result.rowCount;
            }
        });
    });
};