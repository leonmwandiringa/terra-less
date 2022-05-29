const express = require('express')
const router = express.Router()

router.route("/service1/test")
    .get(async (req, res)=>{
        res.status(200).json({
            error: null,
            data: null,
            status: true,
            message: "Service1 is working",
        })
    })
module.exports = router;