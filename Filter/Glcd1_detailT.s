<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Sổ chữ T tài khoản" e="Xem T Account"></title>
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
        <![CDATA[<encrypted>dsboaCXv0IZ9uLOBKhQtrhM+lNL4H0YR+Oz7MNwuYyfSd0VehVfUiEsx0JhoE9S6oNKRzcnqAR4FQpHdDuW2n/2EYCIMLhTkiQQqBKCgrHGe6mRzQm3hdhpLrXWck0/OEbNOgkrgI+/pGQ7HFAbUWDRAXWtNIesTx38e+KHxjXkkbIT5m9gdG3lT6Fv0DbT+t/w42VUjTB5GBEQ9qzgbj4qXfnEkgcihBif4yoCTkeeRlIEBBjU95pvudFtJjRd1D1UVNDL/QHFeZppo4p1ApgN8HS1uAz6dJP7u82tyk+zSmOXi2u6IgDOwOd4XFvvoyKRAswJf5p1W2OBHe3+oyPMPzt5L8kLBnA0t7NpSV/Cmq2AkZsTWDjVYAQxvPnQnb1qn/rp95TMGR3z0qB8P21YGP4eDJbauKdwUDZGWp72SFuC8HDncjDZmJOGFjnx6fw3/JNEDZ3YqjjQqITyHUYByMl1DwvncIKTn3LTVgATB9EKXpUvF0qYJmmZo6ENR5IiLZ+ujyi64fBZvvax6DZGoIiuC2by1pAAsVJcjtnoXFIlME5AbG0ZuNJeSeurmA7KcRLViSW+quclhYNYf/BQwPDO/gs4AApCGah4MShGXfmue6P3ZLcFK1Y2vZ9wqRSR/4p9tld0XE7ELOhXIZFrrFnwjUTuHcWIJ+rRkZgdxVziFh+UPing/DRmApm1ZDIoWTJEfLWajoWIVQLqEuPf85LZfu53dQzMcmEl2BgNnhYjFjipnTB07e/LV4p7WmSxQannBzisOpUeP0TK95w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
	&ScriptQueryFilterString;
      <![CDATA[<encrypted>JVMaI4ZhhSSlAIBSfwPSK+yA9MrfZ5wMqN+3bdMQcHcMej2nhMgBCJRH6p1b27DihmF7ZaHMRsogtO2gagfv1qmDoJ3SaZw03uU3Co3HRqqGpteLvPOqm3UBs13ZXfklp9hlSGAcxpoqZ1b+hPFEw3x6emUn0lsIpMOdN27CjjsWdJRH2jx2MHA4qlEpgRF8d5HFXWzPe4Tz5AR1wRdsGX09yzIL5/pwGxklpRjCt5QI04NwxCOaQrf6QglJdeRoy5CRcgFTt4ywPvLVLv0nRu8YngTzBFbgs+dsiak+j6Q5uaT8ysi4UzqGN/bde1ifFWXpxNP3dtQuo45ExROmq18D2SUNMWmGD7vujOFyHuH1/toux2QR8LUTG5595XSs8cZQrQIkY8G2YONbE5HzDLyq/Jrx3oOG47yrHCWzxpj0oAizyvsRwEUeQFDAv63RPMXr6UDVnfTHCzKR/Kkk4wvs1YrGU1Sn2Af+zCqUZrEY/1Wtgym+F2mqQUbDKDXA98TTf3t3SLQwR4J18FSxyOk8Kvk9miqHqijDFEc1P6lE+Z9M0sWjQe7uuG1agJf0P5Hvq4y10Dzhh2eRWVipru2O81I9YkmShlRgDe6qoHhiW2LF0j7cbVDbX0O7bpViHZzOCWAWbJRTWVmKENracEZ1Mnu8GBWFE1+4Zt0xJqfDq0LivghcKTVj8C0JYbC1WreDZfAbZ4GeJC1ryTNpr+ZRGnA259guAg3vqX3iQSb4RDbFvaQkHswDI5gCYIUj/MwD/QeDmitJZoJYpC47prFkKv97BRqzmKbTB3u5g7U/WhI3TyMyTbgyFJO1l9uSjJjYT2rghxOglTzDvQHWZdyxJwvas6vVQUvBqD4+ALE=</encrypted>]]>
    </text>
  </script>

</dir>