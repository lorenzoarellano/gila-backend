var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var con = require('../config/config.json')

var connection = mysql.createConnection({
    host: con.host,
    user: con.user,
    password: con.password,
    database: con.database,
    multipleStatements: true
});
connection.connect();

router.use(function timeLog(req, res, next) {
    next();
});


/*Category catalog*/
router.get('/categories', function (req, res) {
    try {
        connection.query(`SELECT * from category order by category asc`, function (error, results, fields) {
            if (error) {
                res.status(400).send(`Error: ${error.message}`);
            } else {
                res.send(results);
            }
        });
    } catch (error) {
        res.status(400).send(`Error: ${error.message}`);
    }
});
/*Category catalog*/

/*SubCategory acording the category ID sent*/
router.get('/subcategory', function (req, res) {
    var data = req.query;
    try {
        connection.query(`SELECT * from subcategory where categoryId = ? order by attr1 asc`, [data.i], function (error, results, fields) {
            if (error) {
                res.status(400).send(`Error: ${error.message}`);
            } else {
                console.log(results)
                res.send(results);
            }
        });
    } catch (error) {
        res.status(400).send(`Error: ${error.message}`);
    }
});
/*SubCategory acording the category ID sent*/


/*Creation of a new product into the database*/
router.post('/newProduct', function (req, res) {
    var data = req.body;
    console.log(data)
    var post = {
        product: data.product,
        sku: data.sku,
        brand: data.brand,
        cost: data.cost,
        category: data.category,
        subcategory: data.subcategory,
    }
    var query = connection.query(`INSERT into product SET ?`, post, function (error, results) {
        if (error) {
            res.status(503).end('Error trying to insert product');
            return res.status(503).end();
        } else {
            res.send("ok");
        }
    });
})
/*Creation of a new product into the database*/

/*List all products*/
router.get('/products', function (req, res) {
    var data = req.query;
    try {
        const perPage = 2
        var offset = (parseInt(data.page) - 1) * parseInt(perPage);

        connection.query(`SELECT count(*) as count from product`, function (error2, results2, fields) {
            if (error2) {
                res.status(400).send(`Error: ${error2}`);
                return
            }

            if (parseInt(results2[0].count) <= 0) {
                res.status(400).send(`Error: ${error2}`);
                return
            } else {
                const totalRows = results2[0].count;
                const totalPages = parseFloat(totalRows) / parseFloat(perPage)

                connection.query(`SELECT a.*, b.category as catName, c.attr1, c.attr2
                FROM product a, category b, subcategory c
                WHERE a.category = b.id
                AND a.subcategory = c.id order by a.createdAt desc limit ${perPage} OFFSET ${offset}`, function (error, results, fields) {
                    if (error) {
                        res.status(400).send(`Error: ${error.message}`);
                    } else {
                        results[0]['totalJobs'] = Math.ceil(totalRows)
                        results[0]['totalPages'] = Math.ceil(totalPages)
                        res.send(results);
                        console.log(results)
                    }
                });
            }
        })

    } catch (error) {
        res.status(400).send(`Error: ${error.message}`);
    }
});
/*List all products*/

module.exports = router;



