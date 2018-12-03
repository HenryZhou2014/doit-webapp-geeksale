/*
 * 	Easy Slider 1.5 - jQuery plugin
 *	written by Alen Grakalic	
 *
 *	Create By Crane  in 2011
 *
 */

(function($) {

	$.fn.easySlider = function(options){
	  
		// 缺省配置信息
		var defaults = {			
			prevId: 		'prevBtn',
			prevText: 		'上一页',
			nextId: 		'nextBtn',	
			nextText: 		'下一页',
			controlsShow:	true,
			controlsBefore:	'',
			controlsAfter:	'',	
			controlsFade:	true,
			firstId: 		'firstBtn',
			firstText: 		'首页',
			firstShow:		false,
			lastId: 		'lastBtn',	
			lastText: 		'尾页',
			lastShow:		false,				
			vertical:		false,
			speed: 			500,
			auto:			false,
			pause:			2000,
			continuous:		false
		}; 
		
		var options = $.extend(defaults, options);  
				
		this.each(function() {  
			var obj = $(this); 				
			var s = Math.ceil($(".content").height()/$(this).height()); //获取页数
			var w = $(this).width(); //获取内容框宽度
			var h = $(this).height();  //获取内容框高度
			obj.width(w); 
			obj.height(h); 
			obj.css("overflow","hidden");
			var ts = s-1;
			var t = 0;	
			
			if(options.controlsShow){//设置分页按钮
				var html = options.controlsBefore;
				html+="<div style='text-align:center;'>";
				if(options.firstShow) html += '<span id="'+ options.firstId +'"><a href=\"javascript:void(0);\">'+ options.firstText +'</a></span>';
				html += ' <span id="'+ options.prevId +'"><a href=\"javascript:void(0);\">'+ options.prevText +'</a></span>';
				html += ' <span id="'+ options.nextId +'"><a href=\"javascript:void(0);\">'+ options.nextText +'</a></span>';
				if(options.lastShow) html += ' <span id="'+ options.lastId +'"><a href=\"javascript:void(0);\">'+ options.lastText +'</a></span>';
				html += options.controlsAfter;	
				html+="</div>";
				$(obj).after(html);										
			};
			
			//触发分页
			$("a","#"+options.nextId).click(function(){		
				animate("next",true);
			});
			$("a","#"+options.prevId).click(function(){		
				animate("prev",true);				
			});	
			$("a","#"+options.firstId).click(function(){		
				animate("first",true);
			});				
			$("a","#"+options.lastId).click(function(){		
				animate("last",true);				
			});		
			
			function animate(dir,clicked){//分页效果处理函数
				var ot = t;				
				switch(dir){
					case "next":
						t = (ot>=ts) ? (options.continuous ? 0 : ts) : t+1;						
						break; 
					case "prev":
						t = (t<=0) ? (options.continuous ? ts : 0) : t-1;
						break; 
					case "first":
						t = 0;
						break; 
					case "last":
						t = ts;
						break; 
					default:
						break; 
				};	
				
				var diff = Math.abs(ot-t);
				var speed = diff*options.speed;						
				if(!options.vertical) {
					p = (t*w*-1);
					$(".content",obj).animate(
						{ marginLeft: p }, 
						speed
					);				
				} else {
					p = (t*h*-1);
					$(".content",obj).animate(
						{ marginTop: p }, 
						speed
					);					
				};
				
				if(!options.continuous && options.controlsFade){					
					if(t==ts){
						$("a","#"+options.nextId).hide();
						$("a","#"+options.lastId).hide();
					} else {
						$("a","#"+options.nextId).show();
						$("a","#"+options.lastId).show();					
					};
					if(t==0){
						$("a","#"+options.prevId).hide();
						$("a","#"+options.firstId).hide();
					} else {
						$("a","#"+options.prevId).show();
						$("a","#"+options.firstId).show();
					};					
				};				
				
				if(clicked) clearTimeout(timeout);
				if(options.auto && dir=="next" && !clicked){;
					timeout = setTimeout(function(){
						animate("next",false);
					},diff*options.speed+options.pause);
				};
				
			};
			// init
			var timeout;
			if(options.auto){;
				timeout = setTimeout(function(){
					animate("next",false);
				},options.pause);
			};		
		
			if(!options.continuous && options.controlsFade){					
				$("a","#"+options.prevId).hide();
				$("a","#"+options.firstId).hide();				
			};				
			
		});
	  
	};

})(jQuery);