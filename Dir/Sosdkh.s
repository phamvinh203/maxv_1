<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="cdkh" code="nam, ma_dvcs, tk, ma_kh" order="nam, ma_dvcs, tk, ma_kh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số dư công nợ đầu kỳ " e="Customer Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" clientDefault="Default" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = 1 and tk_cn = 1" check="loai_tk = 1 and tk_cn = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l"  readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã kh/ncc" e="Customer/Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check=" 1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ" e="Debit"></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Đầu kỳ&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Opening Balance&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPquKXYRxD5VJx4iiTZnKVTM+X1f0Ca6+Wak+TIbbEqxGk=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có" e="Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqJmxBEmyb2NxHZMCE7oIOkySBu3pAmYXEzm4YguTg6mM=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ ngoại tệ" e="FC Debit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqAe6ubMXsof7IklwCgju8Pq4puTOABb9DVV3HGL33OVXoaUmf8V17g6xdMOXpNe/Z</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có ngoại tệ" e="FC Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqaDl8kBBOrLXKOZnOrh6msh/KKqNzTHXkOk+wi7dgGHdMRB2Dot7BOaHFFjkiZBO6</encrypted>]]></clientScript>
    </field>

    <field name="du_no1" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Đầu năm&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Year-opening&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqkzi7TAbxZAiv6VmKVacER/7Y1EchkU8343HfEK/WYiY=</encrypted>]]></clientScript>
    </field>
    <field name="du_co1" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqueb5rdEPWsu8Q/UQHRrNcjxnksblWYwLnJypgqNB22c=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt1" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqsBU21Imq1fyp+6mPw5L1Ekw967bXS7IhImVXdpHXa1o=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt1" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqnY2cF0W8aUn9IEo3PeJQOdEuQ8Vgb0oNI9RiNxxkPdg=</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="8, 112, 110, 100, 10, 120, 100"/>
      <item value="1011000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1011000: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="1011000: [ma_kh].Label, [ma_kh],[ten_kh%l]"/>
      <item value="1000000: [ma_kh].Description"/>
      <item value="--11: [du_no00].Description, [du_no1].Description"/>
      <item value="-1111: [du_no00].Label, [du_no00], [du_no1], [nam]"/>
      <item value="-111: [du_co00].Label, [du_co00], [du_co1]"/>
      <item value="-111: [du_no_nt00].Label, [du_no_nt00], [du_no_nt1]"/>
      <item value="-111: [du_co_nt00].Label, [du_co_nt00], [du_co_nt1]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3knLRjLLkGo9wFyP2fBAhu7SmIO+TOPSCeHI0s8lRA63SFT0Xw9J+q+RSm/pLH80a8e7vNOiWevs9KS+2xRcZI26OkdBodj3tQg4OpvU1pGdm</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>CaXMyPkcpElM/LoGYJY9iIlVX1pbNn2NedTAwmoBXneuF9KcU1Q4u5cG5mNnulmQevzRCBPma+n/VeMOs8zjxDrYGOCpcrb8wvOkMckTSl+wmQ08h9nhwBuF9FHJ9k8BwPRiUp3auUeeukly1/BpVr1LkIVwIgs/fS4lJiylVRMpNXQ1EUhDgoi3zy8laGVNb74VeaLs6MQVAuVcHr1ld5dx8sULmO6KJisLgUerKuF0tgX7DJoRxKS3V/7T4GDwXs2QXwawKwK0ARBgS80kH5BWEWbPyCip2UxHwPItvAg6Sya2TPdSCkQnJ9oqRQ70X5zWaZa48yX/G4EhUA7SGBQifEiw/x/B8usF2LnomJxU6ISt6L4PN4R+Eq5Ej6BTget7xBsgbd8mmt/rc1v3Payu+5piprN1SrhrzHznb2olLWiBCwoV4jGdIMQtVHXRMHVf4Y82SlBtkOU33Uqvo5S9xM2kHMNu2uHULugn6rg=</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7u/oKtoI2Jct/atPcvdSHfrbM7qdzC0OS8g4IVC9xQWQ==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F5TO6PUvuzECvgYM/jXufIR3Nj1ZbutsAQTd+OJi6tddMdCYzgAEtPyREmRX9s/hERN0qqNt0VFWZjfmmJW97Wx9USjMOJOq+ZcV7rB5AcAs</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7u/oKtoI2Jct/atPcvdSHfrbM7qdzC0OS8g4IVC9xQWQ==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>c+WULWgUue4vt1P/CbvPK0wwYRpIey94oKbhO2tdeyvZnOIIFsgPUgV/9GIG4Yu0DVI+gcnbwe8H42RjrXK8IhZi01/0XDXSOICHrZ1APA/5uXnZRx8rajRHZ9/frdThS3fOmxDxm66OHeditT9IS72SLbqruF9Ub0eVHRf1OV9wDgs2z8wokqTY2Gc4D4jB7e12F0kRDAsKzB/OD+0TIjlKOAYavYB1UBhqxMeBcOs9L6GW1OUb8JgBGysxEmcQ9sRZ+4K6z/q9Gx/qrWwn/kd4il+hOk74ReY6OoQT2AmoAxsR56kj6PVOwDeHOCEDd9S7fGkzZFu8ng2xe8k+hp5a5nfJZIY/iiLch0ZVjSHjG2js5kdqz8Za7W6LEdpOv2ah544qY3wdUYSSfOwuosEh9gDc0oS45AcdJ1ecvqS3ua4lYUfFQl5ceBVt4V6SEw23S2dIeohn+jxAAhLV+52DxkPsw5vziRhhQmH9f4Q8HXafSJXakc5K4ba+WvJg</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>1Qj7NyZ7B5XexINggfsMYVaVo56ZAsOzgld9lCHkeaF83LEVK+837Q/ib9SOomcBVWURd4NZVin54uk5rvYSU9t9ASiwxIPp7oh8EYEyOt+7FCZQz4sNjlInpADoBWEfUWIVXomv2AWkcZptvnpKQ4G+RHd89I4c2UQxGcZoUzrGzhlnqUSp2J0SLhCUptRtFTR2da9g/oloiURSnK7i7E7JcbWffl/CS4bJ1jANAOW4kRUp91aCrDNKyIdIpQ6oJkVTfHmC+1OWwfIlrv3ZGkd7ryIlgUW0yilOlKr92aw=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>n+zCdGYH026VULTctH8J3eUFle6Y1a48c3EE3A5JL1X8XeaiwaYIWfQWCof1oWIezQAXphr42qyW0H4R6+pnQl9gvuk0xHIaS8KIuULXSq/02K6eP3GUHwOpZop57C+5SA5mHAm42yFvvejVXM/6VtKC63EBoFD3TPBITmKXXDhZ45KC//xZ5Cdlgjj5SP7A</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>n22/BzOXe+zhz0m4Oc3NwPlWFxm+A0VsPhFpPLbPXAKqTvLkRrbJCWrPhEK30ZqCMHMJXziTVhm2P/XHjrpntO1PL0wz76bXkYLidL1YON4KUU8tLJInfKhL9G4Oxm9Mh4nP5SA8o3T6Myij53gKoUDEk3m2PBhojdaKajHEk/ZfOJK8pUrI33NU57oLc4NZTnlMYTfEnzhJxIc99aeiqAsxG3YgNWEbzlVR7RnBn1xH0O+tCJj6xSFbn/jSjasjFOiOK4T7YKGlFljm+xUuIeUvjrY9Fyl9lPH6T+IokpYGVEoIbn3Gpz2w+nLhlWpPcyvSpVfaj6I1k2dsLxB77JzKHIQ/RatGRrcUnUB/tW9la5n/rM6mWoPoL63xlBQGfNtJOCxJBC74lWGHBMwxgpyfFpiPmsNHJMwShNxnw1pdAg3zafrmHVT6fWlVo7Dan+mIfBLZoaxUoBRV1ZxQ9UmrIVpk+7/joymuTJNT/7I=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>rTTsSDYnmIggyfWUj1xpS+K1kr8yAFaikdvU/CKnESIYOVJ//xgVbKRF41hQS/+J2n7c4kO2EH6ZX8tOwndLViwLcve8xmFOfNkWoqSlDGocjF2tTfsZ8cDRZu3i4SCxhpyRB/QKWvkoGqjDq0TRZJ1Hx40WRN0eE+KK4kA+BTSFui0nX4Ao85BPBHxNC+NrM2Ws+e4ejrtyaMkYeaS4BgHbYXc+Laef19MtYTeXo4KtpoPBph51lb+XY0Uu/EZTkC50jS4ovzjpGNawfPxMFZSVxHty+NhySuC8ESstznSG6VpX+jnIwyvNZga1Lo+d</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
        <![CDATA[<encrypted>MCiiHOhG6tLJlCo+XvfPC4iHNYbqiuj74hmaWmrSLdy3AwaIaX0tF9VFOqv33sKWH6myq+9mq9xK7PrqD4tYWPNQIh2YyTzxpj7Gtv8MZ7QQKVCj9Ws9XAZnAHqp/yB9EI/Yj/Bggs/kUdlUwlHRGg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>MCiiHOhG6tLJlCo+XvfPC4iHNYbqiuj74hmaWmrSLdwRqIN4ZSXE2891wkebkEPRLurLHCBBQZKq3PIwO5QG1bQNHa5TryV+0pE7t30Lrz/DlyZLDrofZonQy0B64Uz9</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>jD+ZacsimZBShQNQzJaQx+susi8WGSjQpeJYlnHrcxbP69O8rSzE303Hcb4mppsY+9TDFuUoCIssTjYpaSRkTyZc5Eftmm3wpZ2dste25gczyQbmDwBrvNCJqqEzJQdsxCupObUFI7Qh/h/yBSR7VH2WkQ00u/M+uJf+jb48xz93DOwmVHourUEA89VDjCw67x5t3QB/fjEgpKWrtdyMZ555kgDUxDVZ9CCo4dU1u2rLp5MysVGlq4MxLIS7HZKUwD80u6W6/hQAj5v6buSfCPanD6mWfwGugUSJqIT9WrDnFhxG5qfQE88PyM9wxkYdsndg4AVSjrB8XzhRSXZM5sIwZPrv85UbYPAWdIOmTX4zlTkHEa1OX5EgyqMptP4tlCnjO5OA/VS4ElOamB+1o9SfAWPRhI+2K4zD0+PaqlAXWITP+WsE/2lWu3EnUZtmL8L4M0aGeUUWPfDPDAGiAI3KtaRCjTxthQTxVjwbhcQ=</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>Md7GNls0Sn197ZVNR6si+1Uti14/T3u984M2SvaGVOCsWNsxIeTi7nMDBIMrgTAE/HHjub05VQPFjBPFJrGkepuGg6TW5hH082KlQ9C38WD72+q84hpmgbxZzeK6n+tAAS5gc3G4XaUKJ85k9vzZKzydOUwfIAigUSQEpeUHV64UMhpKpIoEAX7g7VuAdwAzDQ3os7ZE2gIeI8krdwt7MeVlDB7xyFeXNiEgyVDdz4SUNSXT3xj0u+sxvezmk454</encrypted>]]>
    </text>
  </css>
</dir>
