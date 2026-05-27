<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY WhenBalanceBeforeEdit "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      declare @$checkVoucherUnit varchar(32)
      select @$checkVoucherUnit = ma_dvcs from dmkho where ma_kho = @ma_kho
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end">
]>

<dir table="cdlo" code="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" order="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tồn kho đầu kỳ" e="Stock Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and gia_ton &lt; &gt; 3" check="gia_ton &lt; &gt; 3" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa46Z5k7zUenSwhJbTUI3hiUf1G07pt2bprWHFwviQzp7adY6CYnpGcygzqiLhGMr+dA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'" check="ma_dvcs = @@unit" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa46Z5k7zUenSwhJbTUI3hiUeWtP3CrNnC+YFbPahy4mB8cfGSgscm1TmpAZrF4zPc5w==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ton00" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Tồn đầu " e="Opening Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="du00" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu" e="Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="du_nt00" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu ngoại tệ" e="FC Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_ton" type="Int32" dataFormatString="0" external="true" clientDefault="Default" defaultValue="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 105, 330, 0"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="111: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="111: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="111: [ton00].Label, [ton00], [nam]"/>
      <item value="1111: [du00].Label, [du00], [gia_ton], [dv_yn]"/>
      <item value="1111: [du_nt00].Label, [du_nt00], [lo_yn], [vi_tri_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>OTunyz2blYd8MsaA18jHEWhpOTyUtyUJlHLsPtr9/Jf+z8PlFSqWzkicxegfV26f9BN0a2tu+GM52j/jwz8ljRFrfndiKd7mxSUFOGHUUcdiavvxLqhKa/4L5Zb1VuPCuJiZLG3K0mt/azTorix2xceFwLtX4dQbvL+ZB0w0NQHcPX5iF8ZQYl2Z0+2NzMUFW3+Xg8UfExMYD74Pm/lNDg==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1p+QsMC2NBOqvj+mJZPEtvP9MBp0LZkpNT8+dSCmygj7sHLphX/UL9Wk4qS02hNOur</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fvc1UldhLhCxsubN8u1hHEZXSUoDi6lAnhFW9pkuoMg+3FwF8NssOrYhIQjCjtdP+LANbAURLeARIzMT7rSc4ic1KCpDGE8D8ue2hevRvP3</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>Dr+j22gkiwJ08qbyRzi0HXez372ST7UPlHGqSi1D9ou0O3wP/DAZQIgC869c9Dv1PMzMA0g5XIZyIePL38FLQx3fIPPVeLzydAw5dEiLuR5C48HV0sMA46YU4wuEoWoVmUqqDkvoxT3iBWsBjNNVyYwWXxRElTx/IPrTSZMvMzeyNSuJeYZDfOcNsXGhzYiKf5zTKo5NI6DcJKHnopx3x5FTQfp0VD1i12XPtzNZyRDl3opj5xcyjlZa1BQ4QVAnoWrp/5HKfnDO0B21v8eBn3YoYw5PuHKYECWmGiPOrJPIy510x5uofJ4MvLGpntgagIkctiP2UeKHMWa8QMB+mw==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>MIHzXq9FeLGAjdSNOxNW6yHhPFERmEX4HP1xlNg3lwRb7+Aa60NCJfuQpCC45lT7Rg2e1TYZ1ke/Sb426PO6ANmhUqCyAYAA618csGZnMLfjKn7cZ8sDfMLzwffhAKkdLcv/58rHjbEulWKaN1Enx9/E39g/HOZ0MfXBmZznHInwFWX1bzggGMI3ewGfUoAXVEI2+6UhfyxzEIhbdtM+0WTd5s4s301d6O8c8N3+ljWIKQqmuWoQwEThckJasoVbxf6axaLpW+sWi62u0Wu4dW3nhaKrtyr0TIlgSNicM+SOj1TK2RywcYE5m9FpU8it+A7YWFORo476qTGIT3lRK6OjcJFDeWlEcDWHshmWJiKHhK38yKEMmOn+ph6AaC9SuDmqlAnv83n/kwTgd4adWYqYxWv5m7Fo2V5EC/ehf9PHJBU1evPKRf/H729WJQBmZGv+hRpulbM3A30paqfqMmmcrOLvqQZZwFI+RFU51TLv3aA8sF4BLk4Tzn2YCdjcEUn9UgZUSkQ21nDQhV1l+P2l/Oqh48e0bfo1ln1ZDuLEo2MAC0Y4oHby00av821a/rL4QVJlPbExHatvh9GSmfS/LgIqAU+6fmIj2W26QxcAdtaqqKOJUdrKoKSEke7T</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>ri+364tP+6LHPexV+72EVTNAHfdCvgMzTd9YZKnoIaOjoBWIYGDIaAIjyIaSCv29ILb2GDP/OQ0M8DCBJK/aSizoGqekgsLUdDfS9cLSjT0tv6dSNp9h3CMZqiDW7w29I4TH1DLBOXpPveKAWiUPLJ3NWyJdP030hu4/lrZg76P81JBtXUZChK/SShWgGh/lId32DvVeFeFMN2x2aAjqNsg2ZRO3ETCAq7x1tUYjnUE0iaXTRQZS76tysjIskV8Z</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjOjQ06gHuOzIfDS3knJFKvEaI8QpG/oY0XkoTjQ4Ycao/JY/KWpDxIZglL0oj8LImdqpEVLkx0PG0lAkrqCJmfc9zoMjjtL/lzQW0aFgQyhXerS41M260lFnH15RLIkBGu0ZKGkbLddfRyjtfQ+a/0izrhjox2udvZmsyE1U1oxt</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>V8A47j+vwD2EVFDcklswGAQ/K1lPfePx8He1izFINafqUAaL3LHiXLlgkm4HttGSvVeKEm3jD2fB5qfrZUqt0t+EK7GJBJz9DhWsfpd1q3UQSVJSjiNzop8kUJ/42CLcDjApQ4yYYv57Y2p4zJgJEcGSc+H+ObCzyN/kgtQ3EW7aMK+n0XSxSyIhqS7K0IJPXdQEEc7cA+YywCd/d4XghG0R0q8NXFkU1pb5JVEjMlPPfwpZluafcuwoui+qjSPZGY4ruchZQHwVJNGnPuyz+bY33YAssd2HDZp21AUHAppklBFoehkMELtMUTmyT5m21XH/aHp3wnClTPbcSboT2EvDixpw2UUw6U1xEt4FoTYOHO+80hjaHmIgCboHYZB1pCF15OIZQCU5Y/qBwibbA/BU1PiaUJU3mlDLsLHFJv30X9xWbNTXTkxUdPLX1onnB8ii3zaRlU6Fslp6aPNo1Q==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>FVb7Lm2HZFsQ5EVmPg5O7nfYBMRO0t/DR0446VHZqge5mE9GMDBuf42jbzhXnFFtzWfKyCdv4cW7RdFVNIZwlG3t8jQHFq/bbkF68r0IDksgBK2tOVHm/PHgBZ0sNy8ZBRAqPzoHAidCowrtHdCNiL8/4HmK2hUDXZFDj9nCjmwA1e/24Kx/SWZVeI7nosCnD3/Zrw8C7P4JFNpAtXDVEeL+WdJlJR1HmxX6ip6PAIMEH2sVTLjHoq5ZN7V60c5cYvxZvk8SZORnV8t7Z0hhzsYVmjMhDVN41YpzNvCWBvhznQTdtiwqgrNNv6IwGQ7P</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>5jiVQYzb9fX8KGCOlcOfnTKvZ1aZL78dV/czRZeyZ9cMJlrFZ5/YcpXnqiBlcnZ+ss3U3GS4nHMAmZrrBbLzw5zAG351cXtd9n9Vcu9ONRy8yrDeodXJlRYvX697UWFNEsjW/ADk9g+bI2ijlneZcrPWCZ3FIL7U0mv6vP8hZnerHkZxGOid3Z8aC4gKifyRhiXEUXvKzPqT0fyXQnC9L8c68ZeSd8kgETLv9Do+rtWceCmn+sYDDVfeGDb0OOU4KBcrLQeFt1wePlHdrwm9tTW5bwk/7J1ZJSkKT+hnDDkZG3tfYSUrnkz0uQP1sFzGy0E9MJIea4WudXOGwyMIvzRzNaLm0jnjA6y1PCqqiQ8b8yl6rQOSXiNj2KGf2WLKTgj6pqa9b31W7o+Q8pfgc5Wtq0O69M0g6azIz5fJ9AXPuiMq/yC0w9N0WK2xULXC1Aj4/DgJ5Wev78qzCCJbtExfEnP+Hm6S7Osk9l0WF7JLQi12/bvvMzhbP7hb7pxC</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjOjQ06gHuOzIfDS3knJFKvEaI8QpG/oY0XkoTjQ4Ycao/JY/KWpDxIZglL0oj8LImYC9X9DJESmw2tIKLSe8zSEiCVhywt4lBE7SZNS+/VT6</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>GdW3Vsi8WXW88NVfUXBjyjQIDQ4BJf7xB2sYOA2ASqgfzD+Lb+cL5jLkG/9nEZlnPtk4NVozvOSHOuyYFGMPSML+zZHxSd/CXWogW67s5q4Ii0CYtAbnt/uYe2JpdW/x3YWHJADmSMSurbdmt34aleAwTRVykG25goSWGPYJ7+1zIk5wUA3+8SYMALiHvVjAV2oPYJHlqMGJbGwY5HMhNxE5ZofoL4QPrSFbB4Dcd0JhK+OR/YqtGk1xt6iZAFTl24KifWTq0m+GFbuYauzAiLj84P0Z83ctlT6l5FPQL6tJM3TJ250RnjwyLH/3TbK88i9pICRsMJcoLPbTW0SOdV9GX+shq0CamwQYM916jHHyHejYfPmm32Ts9VpApzwdXnOOl1T1mkTx+w0xOmrUsI+5Iz8xcIn1F/gxHIT5hgPQji9a5ymAgQ9zmsYXX25Qw84y2dREs99j5LBrxcMqdMT9RNk3/jHOkxYWJMu1T0cBnjf01mOpz22vmUQ6h9Eb5g5sI5hjPDRtJHJ47L/GykiaHYTWHOMdBb6s3PGOc5aseRc4jiDCBNeavis5g5t7utsx1y4OFQ3UGRB++TIYts9bF5mOx1TbAhAaaD6pqHS7VTZ+oUNw30tEDbUJBK86NjTBJLMOe2Kovkn+R4GvyKiwgI3PRTJBEp4LTpLfsyA6Rmv/bFSAxxKRqp/hoFQjLklm0dM1VrA6PQCvHSXkBSlFe8kZRJc/GRAi1aNh9Z1vzmK7XzL7D+lvMOOR0fec6g9+cUpOrjuVlgp798aU1MB3bwbQeKPtaT8mJEHoceU=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9FqlO0phTVXLDg9LoFRTEAYFJswgjetJC1vhOxw2RNoOu3H7KlW7uWD4wNSmVeVJeWR2OPww1joV02ho5b2QUWxhEc/PcPxpIiAQ0XHyZ3h9yJQ==</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>iGHHC8vaNVdvi6Fo5D92zl/Q/1XgbcJomkZTuwA76QuUVCrUOfMTLTCzSf4+mW5HIgAOEFmRh8ndOZPZT6fkQe2zB6wZ7QnTTCwoH76fsHRPZpJuHz7zWzuboJBi6or9Bq05wTsmQphZOBEqHypIF0M+v7Srz3ycnPbde/sAZdg=</encrypted>]]>
      </text>
    </action>

  </response>

</dir>
