module.exports = {
    isLoggedIn (req, res, next) {
        if (req.isAuthenticated()) {
            return next();
        }
        return res.redirect('/signin');
    },
    isNLoggedIn (req, res, next) {
        if (!req.isAuthenticated()) {
            return next();
        }
        return res.redirect('/');
    },
    isAdmin(req, res, next){
        console.log("   req                                : "+req.user.adviser_role) ;

        if (req.isAuthenticated() && req.user.adviser_role=='admin') {
            return next();
        }
        return res.redirect('/');
    }

    

};