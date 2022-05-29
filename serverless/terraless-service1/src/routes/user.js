const express = require('express')
const router = express.Router()

router.route("/service1")
    .get(async (req, res)=>{
        res.status(200).json({
            error: null,
            data: null,
            status: true,
            message: "Service1 is woking",
        })
    })
module.exports = router;