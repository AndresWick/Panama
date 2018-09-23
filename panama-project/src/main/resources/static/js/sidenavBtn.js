var sidenavBtn=
{
opened:false,
getOpened:function()
{
return sidenavBtn.opened;	
},
click:function()
 {

	var disp=document.getElementById("menusSidebarNav").style.display;
	if('none'==disp || ''==disp)
	{
		document.getElementById("left-panel-content").style.display='none';

		 if(window.innerWidth <= 1000 )
		{
			 var overlayBg = document.getElementById("myOverlay");
			 document.getElementById("menusSidebarNav").style.display = "block";
			 overlayBg.style.display = "block";
		}else
		{
		   document.getElementById("menusSidebarNav").style.display = "block";
		   document.getElementById("ContentContainer").style.marginLeft = "300px";
		   document.getElementById("MapContainer").style.marginLeft = "300px";
		   basicMap.sidenavOpen();
		}		 
		sidenavBtn.opened=true;
		document.getElementById("sidenav-btn").className = "arrow-right";
	}else
	{
		if(window.innerWidth <= 1000 )
		{
			document.getElementById("menusSidebarNav").style.display = "none";		
			if(document.getElementById("ContentContainer").style.marginLeft=='300px')
			 {
				document.getElementById("ContentContainer").style.marginLeft="0px";
				document.getElementById("MapContainer").style.marginLeft="0px";
			 }		
			var overlayBg = document.getElementById("myOverlay");
			overlayBg.style.display = "none";
		}else
		{
		  document.getElementById("menusSidebarNav").style.display = "none";
		  document.getElementById("ContentContainer").style.marginLeft= "0px" ;
		  document.getElementById("MapContainer").style.marginLeft= "0px" ;
		  basicMap.sidenavClose();
		}
		sidenavBtn.opened=false;
		document.getElementById("sidenav-btn").className = "arrow-left";
	}	
 }
};