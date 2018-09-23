var leftPanelContent=
{
	click:function()
	{
		var disp=document.getElementById("left-panel-content").style.display;
		var disp2=document.getElementById("menusSidebarNav").style.display;

		if('none'==disp || ''==disp)
		{
			document.getElementById("left-panel-content").style.display='block';
			document.getElementById("left-panel-content-btn").className = "arrow-left";
			
			document.getElementById("menusSidebarNav").style.display = "none";		
			if(document.getElementById("ContentContainer").style.marginLeft=='300px')
			 {
				document.getElementById("ContentContainer").style.marginLeft="0px";
				document.getElementById("MapContainer").style.marginLeft="0px";
				document.getElementById("MapContainer").style.width="100%";
			 }	
			var overlayBg = document.getElementById("myOverlay");
			overlayBg.style.display = "none";
			
		}else
		{	document.getElementById("left-panel-content").style.display='none';
			if('none'==disp2 || ''==disp2){
			document.getElementById("MapContainer").style.width="100%";
			}
		   document.getElementById("left-panel-content-btn").className = "arrow-right";
		}	
	},
	validateRender:function(div)
	{
		if(div!="left-panel-content")
    	{//REFRESCAR PANEL IZQ
    		$("#left-panel-content").empty();
    		document.getElementById("left-panel-content").style.display="none"
    	}
	}
};