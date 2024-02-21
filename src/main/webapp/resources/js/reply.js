console.log("Reply Module ......");

var replyService = (function() {

    function add(reply, callback, error) {
        console.log("add reply.........");

        $.ajax({
            type: 'post',
            url: '/replies/new',
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function(result, status, xhr) {
            		console.log("what....1"+reply);
	            	console.log("what,....2"+result);
	            	console.log("what,....3"+status);
	            	console.log("what,....4"+xhr);
                if (callback) {
	                console.log("what,....1"+result);
	            	console.log("what,....2"+status);
	            	console.log("what,....3"+xhr);
                    callback(result);
                }
            },
            error: function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }
    
        function readd(reply, callback, error) {
        console.log("add reply.........");
        $.ajax({
            type: 'post',
            url: '/replies/renew',
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function(result, status, xhr) {
            		console.log("what....1"+reply);
	            	console.log("what,....2"+result);
	            	console.log("what,....3"+status);
	            	console.log("what,....4"+xhr);
                if (callback) {
	                console.log("what,....1"+result);
	            	console.log("what,....2"+status);
	            	console.log("what,....3"+xhr);
                    callback(result);
                }
            },
            error: function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }
    
    function getList(param, callback, error){
    var postid = param.postid;
    var post_type = param.post_type
    var page = param.page || 1;
    
    $.getJSON("/replies/pages/" + post_type + "/" + postid + "/" + page + ".json",
    	function(data){
    		if(callback){
    			//callback(data);
    			callback(data.replyCnt,data.list);
    		}
    	}).fail(function(xhr, status, err){
    	if(error){
    		error();
    	}
    });
  }
  

  
  
  
	function update(reply, callback, error) {
		//alert("replyid 아이디는 	: "+reply.replyid);
		//alert("replyid 아이디는 	: "+reply.email);
		//alert("replyid 아이디는 	: "+reply.replytext);
	    $.ajax({
	        type: 'put',
	        url: '/replies/' + reply.replyid,
	        data: JSON.stringify(reply),
	        contentType: "application/json; charset=utf-8",
	        success: function (result, status, xhr) {
	            if (callback) {
	                callback(result);
	            }
	        },
	        error: function (xhr, status, er) {
	            if (error) {
	                error(er);
	            }
	        }
	    });
	}
  
  function get(replyid,post_type, callback, error){
  var replyid = replyid;
  var post_type = post_type;
  
  	$.get("/replies/one/"+post_type+"/"+replyid+".json",function(result){
  		if(callback){
  			callback(result);
  		}
  	}).fail(function(xhr,status,err){
  		if(error){
  			error();
  		}
  	});
  }
  
  
  

    return {
        add: add,
        getList : getList,
        update : update,
        get : get,
        readd : readd
    };

})();
