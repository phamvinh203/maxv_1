<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCCN2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Xem chi tiết công nợ" e="View Customer Detail"></title>
  <fields>
    <field name="query">
      <header v="" e=""></header>
      <footer v="Đang thực hiện..." e="Working..."></footer>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 300, 130, 0"/>
      <item value="1001: [query].Description, [query]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>4uWsg/DMu2qVoY3L80sdmPl4NdkhlGVlSbMebQEl5GOmSxF13ZWn2fwKpb7NAQ3vnII2d5XET5P+3BNPzQSJWjwGv6zOT8Tceq1uZ/YGFe4EG/fGgV7p8Q7jF48aGBRpmJpanLdgiziSJ52vj5gmeOLXxRDjlmpIe0F34HXzezMPgF+xC6w7eC+CrLhOMtackKJN0Od2fqTGvrI3lBaUhDgg+D1pUVys0tKorYm/DBd+jIxQmR+4Gv2Jvz4L1oKHCwnoEnlHAKBTtfM9zN/A7JbytOes0OMen1lJjrz2mtMJML0wMkRdmYowztdL+k5b59qDPa7HdiWcCDjqajjvbMj0pK57OZupYDGTSbiUvbs/hnuOss3OUivoZ9vP4fuj5hQ3n/bs3LMwyVu7sV0OV8P56HS9YlwUx5SW0fTud+yoxCPzkcM968ykgD2RInO0xPa4Tgs5oPh2yEGT1Mnc0Kr8kGn7zDDXKv5omU620EQLLgJ8Oa9yJLRZboWO35sUOcG1f7CyYjMY4r9ElRieL5U0la2TAX3ZjFJ0uAVzia75UdtzFFOIQR9Nc+ZKW5hH61NJ9fdNzkAL1NGbak/WevF8qKjon105QUJc0jE89jnAPkc9pEywPM3eei4/JoPXGs5Adp3r6DYcbtXow5LJIgnodtpRPOcj/JdfqNOEaRpt02xeLobK9rrzSKjkfS7fknJqEQHYDmet9vyT3eGhaSy6tf9fwnd75eaKYQr1UeG3bH0WsM9/18pGfQULl7tpsmrlY8ngpTEZR8H1mbhKjnOLOfURINNFiLcH1Fc741BGemp+CR7Wg9QtEg94+K2yTUvUsDVWNa53h72vVb5+gugVI0SgcrPW+PNY1nNOpSVqkrvhWRWo0qTMUzhcTsgL</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
	&ScriptQueryFilterString;
      <![CDATA[<encrypted>hEMweahadJLOmUG01c2/dP0LG9g6qCkE4UARBeHCH3vbrKAkA6vFFshN/ZqH98kR7gaBjvOAJKdv7O2dNw41fmlidlwT0nOZtxu6JISxFoUzOonSsTXNMgvLM0+kwSjTK4MTTBahV6P3kGELeM3a1SLPCoVe+e+u0TZ/HPnuMbc//wBlUuhRgri/0nLeD7elil0T/brL3yJOyLeBUctzak3DNBXHWCkiyPi3dUH7o8rKN9cofdTAiZCtm0KW7FekRLqDoPtY/mHvsAEvPs8FqVq7gYntZzobaU4T9wRxo1RfRw3Nz4wddYGrG00A9VrkQtHOPw9sRxMCJAVIw6kWFIOF4lxLTcHd+rDp2P9pbwxKnTdN49TRm11PRJtPP2l+P9H0c5CDqDl4wVTT5xMryL5QFD9tAg8ReqRkY8ix1aB9Xd01ssICs2f/5g6kksoT4pXFq8lbVEEpg5Ck/0bU6uVvXsXwWouzn/ahwwWrj+SEd1V1xyBtId6sfSq6ZFDpTg1OJehu+SBkHNwknHbGtcLb9fxGBRtKu66TfTQJCEuZcn/H4P0+3KbpBe2KP8HS0+ABUVUsX0lRefsWYFt1v+GwB8Obs9MuFNddPdIYK4FoWzgjouloBGDnGqD/83vorHzGt31ASoPB/qJhCIrrnPGNJARzAo+RiGL6fjKV5MMQmbdMpv0BZSX2jQSyXEP9ec8V/PBf38ypK9siRXw+qPsA51xHd7Wa1NQcUCkxBfHxks5GqMmfIOJ/B6GYgAb7h9UVpRgF4F2hTB03/UtJ/lIYRqTEQsnZJtU103VgJMi/0lnJtar7qehc1VaJjtosxabF1R6r8WEp1oGEsV+X7UMhEcl+t7BRx9KHu7/RFqtSiLC2ykSpyNysdWKcbyikNvL2tbSsVochP4oqvQ1SlNxM02n/7p8zUw9+SnHs7CPkp//FK3SfElbvlinAzKyVvgNcnicklwLZdxeDv9D1n0KNoabHAWcu8ztGQG7ZMdEkaPz0mWFdWkayn2jFnjtH</encrypted>]]>
    </text>
  </script>

</dir>