<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
    <!ENTITY LockedDate "
if @r is not null begin
  select @locked as message
  return
end
">
  <!ENTITY Error "
if @r is not null begin
  select '' as message, @field as field, @r as record
  return
end
">
<!ENTITY s1 "Số hóa đơn &lt;span class=&quot;Highlight&quot;&gt;&#37;s1&lt;/span&gt; tại dòng &lt;span class=&quot;Highlight&quot;&gt;&#37;s2&lt;/span&gt;">
  <!ENTITY s2 "The invoice number &lt;span class=&quot;Highlight&quot;&gt;&#37;s1&lt;/span&gt; at row &lt;span class=&quot;Highlight&quot;&gt;&#37;s2&lt;/span&gt;">
]>
<dir table="ct60" code="stt_rec" order="stt_rec" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Báo nợ ngân hàng" e="Bank Debit Advice"></title>
 <fields>
    <field name="stt_rec" readOnly ="true" hidden="true">
      <header v="stt rec" e="stt rec"></header>
    </field>
    <field name="ma_dvcs" readOnly ="true" hidden="true">
      <header v="ma_dvcs" e="ma_dvcs"></header>
    </field>
	
    <field name="ct60gl" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="300" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="EICPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
	
  </fields>

  <views>
    <view id="Dir" height="400" anchor="1" >
	 <item value="110, 300, 100, 100, 100, 100, 100, 37, 100, 100, 15, 62, 55, 100, 0, 0"/>
	 
	 <item value="11--------: [ma_dvcs],[stt_rec]"/>
	 <item value="1: [ct60gl]"/>
	 <categories>
        <category index="1" columns="1388" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>	

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fV8Db63cIL6Wa9pQWQxqQ5c270Lyday4oS85jUTh7MILz7PtlSlgzHpqfpLQ9EtdC+6oFCHdSwXB+fY7U1LofI=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f1h8IuHH30pVWY0Ih8jlSK4GR23//r9+Df1x7Rxvy4fUaWT5nIzqqYkQ+lL+LaUs6TURi0Gn0dfVR8nYIBwr0Y=</encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>3JL1DR52xMFK7B7DQKS+FM2lDkdfttaq2C50WCuk2etSI2nVu8doBidUEwJvH1IzAJ3UxYL9PRe3QVHA/wllkdbxpFnGCRbIl9aLANO3joDeRaYW2hAhYapeq82rEcWlPd2PvEscmXdW5Q9BstSfoDFabryOgHGKeEhJHiE/1M6VKGfJ7i3pN7FJTqI4ZCq0KsyNqdqw/Bg27DefGtNYxfWOVUR4hjJVPCS1P1ftduHbA47Zs4FT/3zxsH4q14cxznkki6QK145D38QefTMCJeDjkWyrYIjJl1Tjp+akUihgbEetomDsLMbE4+imdBIhQ9rAR9/oXlI/fGEVmt81iHQQuUXIXQZ9ADvACM2z0i2ypinFnkekp+Kf2OFaCcyq3QZxim58lz5pZ2Gk0A2O2di/mSSsU6Nogfke/w1zC8gh1N50Q8bq1Si9811hqE/6fZTO6r0I5yBR5RzUZoKIiq5TJT7UlBXFaVIse73hwjX6glzu/7qMusMBC9Da/6CraZlMIJ9ygeUoAfZhZcLQe1j5LgaCKAVT5G4RyAhE+Gv0y5z6kKc6f1iNAxMdLDRFrk8JUGGAywCiwqlLnip62kzLIhOR1IeumuK7VvZHtTtT8zTpgvOeaHb6Iupx0anHVql9ls8SiyBLSTWnsh3c2uvjtlTe6Oq8l2dhAE/XUOScTGmKtqm9zEg/pPlJI4zWwgh5RZ9HGNEXhl3drddZpYIATYtIMZYFnS0MI7mrvmAO2TcZoTFkDvaxS++NDcko4MFMogTjIFg8ccaysy7ShEtqCpfJQDpKLLdmqLAALd3PxradyVT7IbO/rLDZSla09JZahOV+/IYPBPC69C/5r8Msy0hVuzy6lSVmZJr9j+hHfjaLmyeNdVJHPdTugZhm56WQCQP76DDO/P3NnmVQOQiwDoXimjMMgNUubc4QfsuTw7++20/4JoMKQwx7F5t9ewKr576gwxvSySfH5q9Mcu2vOZG3Q47e1RWKarjWGDZkw528tQXzBfGZvvekRgUCpoFTonVfnfThkba5Ym49fxct9kpy6416umDmkffDHjW8iSrvhe1xyR6gFjl1qlNbq+77YpoVC40KhuSKKHyDWU79ihdlO5fNmm9vJfqNoeLyQd3IiAp6v+MgEGvfAnXDtPOEH9ko9fIOrdS87zOuuWCG22YE102j3pez2QDK9xjXDxW2s/8r8n2Ozr7d0YKaxchWDZaEJZqCGTLr/VSxMl9m4nFSVdmQYmAe4WuComndbd+Wt9fUTLBAjsjlUJiKIpm9y/vq7dma9qIzcE7TntsfgUYYd+rJBxHE8tUm/iKhxTl+7XXlnM4At4/PaTktrXi3L7AKGUaB5zVSjcwDV7a0bgSLI0w1dRtpwoN7Rzw=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQhHCQPKR03Qwtpa02gf4gx65Oaj4H+91XpMDxL21/GWlT07KibxLRtSCFd+XrYfx2Vw7zS4lEpXxilvPRWXCLZr+/KyO8vdcX9jB4+7rM+st0=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQhHBCPzXeOtidO7uBS0rKdQ44//VtS+Bj3V+Xr71LpGD4GXteOmAAT4wrK5s4gWJmjAk8FYyuIIKeDSydumUeO6r/v2YvI3XvUhJ+08hMHcKk=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQh7ttlhUMlhS8ZbCWqnzENQ5+qQmIggCxCdzJPZgTb2F5HpoC4IbAiqNM+oCMeQKe7usyhpqmMdDXvneqxxnJQW3ImeYzm/rWbidMuh+quZ1Q=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>xwNBm35eWryFADCIMjpiMb7HCwjQEZDoccba0Fe14BegXSK0gZU/vkC3Tsct+KbEWDRR5K2wjkIZG/DW/uOeo76qIat8diCMU8a0E8OnXMNtIvVTrsY4+UjoIguvqL/LAyIvTDaawHL/ox/8A/7xbaHTYgFLNjle6PY1xcxSkwxd8JNfjHh81EQX/c62dr2G</encrypted>]]>&LockedDate;<![CDATA[<encrypted>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</encrypted>]]>
      </text>
    </command>
	
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>86GeIvpP8uqde/6k1R4/OTt+PR2iqMTL7YZRk6X3JhqdbamhmKnmf8Rd04ZvdWm/dwSiRiWQnRUcesoyw/5H9+nUBa9R6KGz8ZVWK0QHRuihdjCNB7K+IiJ6Wk4SONf/J4XkQtYLnMLUEYVS+EphYG1cCFw6/X3ciaJK7wf8lcujdL4iH0TO1jkWEe5YGqkBNgfoNTRQxwft9WjiFLAefjQ73P/+XMaFQnAAqjSTbjzQYq7HSE75RH50oDee79JjJpLsPT9jjb0Q+go5d7DWYtamsC35qZorxx77SiTH9nBexhR+fhQz5TxM1lwcb8YN7+/x9QrdUNTbs5byzKZY9IQyLB2o6lMZUfWvyiSJdGjCbdt48EVRqES4SBJsLaJDlDZfzfMFRVihAVHLqO1OBdnX0CVyieE1KlbDTXgfn8Ei7S61wJe5JyGZ9qtdmTOtpOR5P13FN9UsppJAlh2gWVE4GYZxPvnl9G6T6c7s8/nRoO1hynmltX/raBQjAsVPZxvj5FXtz8Fr2cWfQTJQwbtGuDoZ6JVn1sBLyvvbnUwjpwVxe9Y6Q0ZxpRzMCKbXdCjQ3KSolS7DARnd2wS3QR6uYUHcJhcpU6n9E4bd4O0RgdpA07HGk4P2oPQQDhtH2wNhtsYhVx4WmMm6ezpliJSsUpFkZScwzjLlRkSpxqA=</encrypted>]]>
    </text>
  </script>

</dir>


