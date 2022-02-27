console.log("reply module...");

var replyService = (function() {
   
    function add(reply, callback, error) {
        console.log(reply);

        $.ajax({
            type: "post",
            url: root + "/replies/new",
           
         	 beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            
            success: function(result, status, xhr){
                if (callback) {
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

   function getList(param, callback, error) {
       var bno = param.bno;
       var page = param.page || 1;
       //js에서 false값은 0, "", null, undefined
       //param.page가 없으면 undefined. 이면 1

       $.getJSON(root + "/replies/"+bno+"/"+page, 
       function(data){
            if (callback) {
                callback(data);
            }
       }).fail(function(xhr, status, err) {
            if (error) {
                error();
            }
       });
       
   }


   function remove(rno, replyer, callback, error) {
   console.log("remove ajax");
       $.ajax({
            type: "delete",
            url: root+ '/replies/' + rno,
             beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            data: JSON.stringify({rno:rno, replyer:replyer}),
            contentType: "application/json; charset=utf-8",
            success: function(result, status, xhr){
                if (callback) {
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

   function update(reply, callback, error) {
       $.ajax({
           type: 'put',
           url: root + "/replies/" + reply.rno,
            beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
           data: JSON.stringify(reply),
           contentType: "application/json; charset=utf-8",
           success: function(result, status, xhr){
               if(callback) {
                   callback(result);
               }
           },
           error: function(xhr, status, er) {
               if(error) {
                   error(er);
               }
           }
       })
   }

   function get(rno, callback, error) {
        $.get(root + "/replies/" + rno,
        function(data){
            if(callback) {
                callback(data);
            }
        }).fail(function(xhr, status, err){
            if (error) {
                error();
            }
        });
   }

   return {
       add:add,
       getList:getList,
       remove:remove,
       update:update,
       get:get
    };
})();