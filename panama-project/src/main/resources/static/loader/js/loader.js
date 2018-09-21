var loader=
{
		closeLoader:function()
		{
			setTimeout(showPage, 1);
			function showPage() 
			{
			  document.getElementById("full-size").style.display = "none";
			}
		}
};