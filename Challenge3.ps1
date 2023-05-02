function Get-NestedObjectValue {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNull()]
        [Hashtable]$Object,
        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Key
    )
    
    $current = $Object
    $keys = $Key.Split('/')
    
    foreach ($k in $keys) {
        if ($current.ContainsKey($k)) {
            $current = $current[$k]
        } else {
            throw "Key '$k' not found in object."
        }
    }
    
    return $current
}

$object = @{ a = @{ b = @{ c = "d" } } }
$key = "a/b/c"

$value = Get-NestedObjectValue -Object $object -Key $key

Write-Output $value
