$folderOrigin       =  	"c:\AdminDir\sveta\folder1\"
$folderWithDoubles	=	"c:\AdminDir\sveta\folder2\"


$itemsOrigin = get-childitem -recurse $folderOrigin
$itemsDouble = get-childitem -recurse $folderWithDoubles


$crlf = [char][int]13+[char][int]10

$scr = ""


foreach($itmDbl in $itemsDouble){

	if (!$itmDbl.PSIsContainer){

		$nameD = $itmDbl.Name.toUpper()
		
		foreach($itmOrgn in $itemsOrigin)
		{
		    if (!$itmOrgn.PSIsContainer){
				$nameO = $itmOrgn.Name.toUpper()
				if ($nameO -eq $nameD){
					$scr += "del "+$itmDbl.FullName+$crlf
					break
				}
			}	
		}
	 }

}


$scr | Out-File -Encoding default -FilePath "itemsToDel.cmd"