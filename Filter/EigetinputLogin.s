<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
<!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="vdmdvcskb" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Đăng nhập TCT" e="Login"></title>
  <fields>
	<field name="ma_so_thue" >
      <header v="Tên đăng nhập" e="Login Name"></header>
    </field> 
    <field name="password" defaultValue="'*******' + char(255)">
      <header v="Mật khẩu" e="Password"></header>
	  <clientScript><![CDATA[<encrypted>no+EqBbLHNT1fYFKOGioHcM/ZX594B4wl1LvgU96Aggth1HTLZToygou0idbZGB1F5Xk3ZBXJm+Ia3mUne7yxw==</encrypted>]]></clientScript>
    </field>

    <field name="img_captcha" dataFormatString="@upperCaseFormat">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;image-holder&quot; style='max-width:150px;max-height:120px;height:120px;border: 0px solid;' &gt;&lt;/div&gt;" e="&lt;div id=&quot;image-holder&quot; style='max-width:50px;max-height:120px;height:120px;' &gt;&lt;/div&gt;"></footer>
	  <items style="Mask"/>
    </field>
    
	<field name="ma_captcha" dataFormatString="@upperCaseFormat">
      <header v="Nhập mã captcha *" e="Captcha code"></header>
	  <items style="Mask"/>
    </field> 
	<field name="ma_dvcs" >
      <header v="Đơn vị" e="Unit"></header>
    </field> 

  </fields>

  <views>
    <view id="Dir" height="380">
      <item value="120, 30, 90, 80, 80, 120, 30, 90,0"/>
	  <item value="110-----1: [ma_so_thue].Label, [ma_so_thue],[ma_dvcs]"/>
	  <item value="110-----: [password].Label,[password]"/>
	  
	  <item value="-1000---1: [img_captcha].Description,[img_captcha]"/>
	  <item value="110---: [ma_captcha].Label,[ma_captcha]"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>T0qAmrxvUCgDS0sYnAD4gD/m8W5hrYJ7Tg3CbPkpnHmsEHpTolo3YWkQv9B6YVNVBd371qTPb6ylMcnCOc4YbFi92RthRyZN6D3YqCZs9nw5XW0LsTyllzMumS9bKRoNU45RSVuCKXqT3pNTdbuNfsllmNKSuIskJHgmnVdrjjfpE2yQ//5nmVU8gi3zb2Q5gVnSsukZJfbQQmHHkKA8eiuD9sG29IJ8smJD2lWa/9iFtjEuHs6jeqlFlNtCItfD9CNFSvAGSOY/pyq37p5RNtjOOWW0WOvBGWxJGAWmO3pEBRkklUv8DgU5pPBeFgta</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f1h8IuHH30pVWY0Ih8jlSK4GR23//r9+Df1x7Rxvy4fUaWT5nIzqqYkQ+lL+LaUs6TURi0Gn0dfVR8nYIBwr0Y=</encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xkC4ijCUXp6cWvHSReqgJLTSOMj0v8NYN9JU23MFEctc06IOrcQTljIVRCta6faD43rQmiBgZ6r/xyvrp1BK2hpTlhnBD5ycighchgLPiXN557QlP56KYVkq4B/QcHYJ8ICGPrCxBaJCUo+YVh3hKk8sLxVH6a5rBwZhb8g6AVeFPD3YnR393hE/6phPNeFjdrTyPJNo5gBliXYMOdPcSw==</encrypted>]]>
	  
      </text>
</command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>TYikHsdCB8/qoSRUllgyyb280Tn/7AylLidiKhCLMQiIMM8TRJP61FGkNwmcurE2kII+t7J4adSQd1X9DiWYd0tlTlq1ZWKm+I1NepL8FilWat/TPLsv1/8PhiS5ffuEp4IALaYX/rAh9yFWCY4KWl/MHnbfx17x/GSgMHC7SGj5yQiaihzPBATKi/OkFp/W07AQRh0JTOFcZjF9CLq6GBt91HjupGnpCDCTfMZppxQ=</encrypted>]]>
	  
      </text>
</command>
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>H51AzNtAJB8+8qtLnx/kXuyMIOCRhFiROUeNdd0zU3KVeOqmgOW7Cdwr9JDC1A4DZK1CAv6F9lVEMwMMhC+3Elwt2dyygekbQ3vP3f2xHqg5DJpyVUJqPo4JaOGEibdDeYRmN27wREOrczjcxivAYt8M12frL0TmUNP0hR+QFuyvejD83RWeDvyS3vEcy4dFjtPJaO71Scsz2fjNgxeryDSjBKkxaV21D5GHCXwLWZEQUqpHtK+mU6ttGXuzc4kkUZFi0O6f90LJ9WhlP/+CRjDoZZCwpn8Srb7wPiAgK+fHYvC5kfYgi37cis52RC/Cj7XnVq4Jb4VlmZwGh0SfEOuHfJuHXdKiZwHDOdYs2wUz0l6PmT92LSuHYCLpnqUPqh/PQc8FQ/CVqi63hI+4QDoo5R1uqM+sNIfBJx2zpKKdHGKw8XMe7/ODyrEUBXlxwO35dbC18lyq/25T/Ew7acHCg6CT29Upc6HO2F/qBodUNv9oDuAKcdvEDC0qkgoHvSSYxnQ4jNt8Ky5QYfwD3KPrPS86zzxd64ZvmuPG8KyixbjypuyKzx+yg1rygF8M1QtqE9HFG/TXPfqk3RjmtmEJyFprCWO9r1jEflNsXoPR6EBdldoQLHB9Vq1gVidOONA/RUvZhTM3ssTuTGeBmPkBSYDuXMw41Xuo6mnp89dSAmMNu3Ortsv8kQoGxj9uT+mtam/6u5JKRrbTSBUTP2Bz3sqswZlaKg9dpJ8Yu7tKZbhkEqe8nQbdv5WKxHgi/xwiSv9eahM+gJWntUTbs42oPhJfn6G8iJaACI7DiDuByTPaj/zMi2TUz0WFdOyFrviSFBmO+JpuDUDoJr5o2Qnu0enPJG6ntEnBx/OsEeGBR/2GfWxFWW2n3dsNea0ehtCemg1T7B3DbCGTlB45WOYoB/7Pk3AoNEj3xDIonT7P0iIis/ftGGEJRw40xYXb6QCBgNtk98N5saqIWX2PJ4BAdR1SqDWy7comxR2269HP2iqX8jlCbutAfD7XKsjj34OepKwARTBVa26YSE/WNzt4EMu6BKCK0/k7f8PT5VpYYGxuTM978nrtyZIF7QeC5VqLyt8t42E3XhNmfTYPw6OAylardrMN9EnULEJ5MUgFh+HHgoAS5g8Z4OofwtZ5nCCxKCUM0pGou5lD8YNfw8ROHjrv7NJat1znwex/HeNDxwSt6Ax9XZLnCBl0dlXhT++TlWMbGSOjPJOnz10flqEjnfj+vUfq3j7wbWxBZ4L/1TFJt5kEfM3f6MvlVUSTg9D1cvYcYrztUrn2w+dMj9NyDqAoAMvqt9E3dETGm8geVUn2QiqfHAsR+x9EW4GA2YyHqc+sPNp/y5qyIH77mDzkhT7ipuwvAC2WNfgugLvn3oj75VagHR3CztVx38ec0vT/0mUXuumxURWff2znvi4Ec6sceY3u7HShoRI/SSm7dSJGEzi57HOrX3p1OpGQuuFN3q+E/YZ2KwULMjyoZ6ZgVpcpMZ7MKe13eJLA3B7mngDRmhNsDQ4AakYTbgcCP87lQDKfiJUWmwfTlXWnXg==</encrypted>]]>
    </text>
  </script>
<response>
     <action id="dmvt">
      <text>
        <![CDATA[<encrypted>eCpZqtV3kHGgXIwsAelF8q8dQX1RVZmhpUsNZDyv8CYnNsWSQxpTF3ISHPeV23mroylU/1R/inC4PFZS5d6ztFvggofOzcmAZ+KawruC6+NsBxp5WqfkpL4nHNgIp5fbV/nGslyViSICDaA2JyKeWCTWIqDveuPwjc57EZLp16o=</encrypted>]]>
   </text>
    </action>
   <action id="GetCaptchaImage">
      <text>
        <![CDATA[<encrypted>izK46fMW2roCFMpSnbb7wY+3FJoUCAy2cWhKEKMunwt9ANrW+LIrI2+LulIHjH/olAbQkVJeH8JLU9JzzUme2eqa2zmfZr93A0rU1Ql2Tpe4dakyCqWwQdztMlpfXPtgJ0t+qKwkiM/j2lajD5UoTynpQEAceex7fOfvMdkWv1JH7HbsnwcXZ7+bGsj92TxHAm2z4sbexyYKjWEsW97xF8r3ldGYfbZUrcws7UJgQ1A=</encrypted>]]>
   </text>
    </action>
   <action id="LoginCheck">
      <text>
        <![CDATA[<encrypted>92o1naVjif+WvDigfyg0rsHSXS3uGIigcFDvlHfc9Euq7P3fNACrZuex6N6erwsYyKtF0USKmaBFJq/7I0txibUKC0ZsJYVJSHBPB89yyp/zHE2HAPMExaaWp7brdQQs3UaBXofCHknzMwUo4iF/qYBvHPizCda4w883CQQfdhlup0FVVeaAtBREKJf3aYyPOkTJTF7nD2RvZLr3ChSX+afX4BseHGAtMX2dpMnUAL4Xt9tBGhPUYiuPVzckLaZO</encrypted>]]>
   </text>
    </action>
 
  </response>
</dir>