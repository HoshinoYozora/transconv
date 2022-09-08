# ���ĸ�ʽת������ v1.0 by Hoshino
# ʹ�÷�����
#   transconv.ps1 "interlaced_text.txt"
# ���߻���ָ���ļ���Ŀ¼������һ��outputĿ¼��
# ��������д����Ӣ�ķֿ�������txt�ļ�

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

Write-Host ת�����