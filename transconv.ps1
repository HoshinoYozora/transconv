# 译文格式转换工具 v1.0 by Hoshino
# 使用方法：
#   transconv.ps1 "interlaced_text.txt"
# 工具会在指定文件的目录下生成一个output目录，
# 并在其中写入中英文分开的两个txt文件

param($file)

$file = Get-Item $file
$outpath = "$($file.DirectoryName)\output\"
$text = Get-Content $file

if(!(test-path -path $outpath))
{
    New-Item -Path $outpath -ItemType Directory
}

$cnfile = New-Item "$($outpath)$($file.Basename) (CN).txt"
$enfile = New-Item "$($outpath)$($file.Basename) (EN).txt"

for($i = 0; $i -lt $text.Length; $i=$i + 1)
{
    if($i % 3 -eq 0)
    {
        $text[$i] | Out-File -Append $enfile -Encoding utf8
    }
    elseif ($i % 3 -eq 1) 
    {
        $text[$i] | Out-File -Append $cnfile -Encoding utf8
    }
}

Write-Host 转换完成