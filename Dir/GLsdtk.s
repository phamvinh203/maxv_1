<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
]>

<dir table="cdtk" code="nam, ma_dvcs, tk" order="nam, ma_dvcs, tk" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Vào số dư ban đầu tài khoản" e="Account Opening Balance"></title>
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
    <field name="tk" isPrimaryKey="true" allowSorting="true" allowFilter="true" allowNulls="false" align="left" inactivate="true" disabled="true">
      <header v="Tài khoản" e="Account"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
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
      <item value="8, 112, 100, 100, 10, 120, 100"/>
      <item value="1011000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1011000: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="1000000: [tk].Description"/>
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
        <![CDATA[<encrypted>hOqinxN1tlVyVjrI/3tIieBOnRFsePzVEz9mtU2Mn9fCYbZJF2wIpPHTAGVe9dp5z4+8e0eVtlG038CfKDbROdLG7LhX6QVZHPS9UQtKRKmXiblgxQBaLTX0lyzM7ylmRCrXuPhk0/v92X0T4i4efv9BJ5wDrL2FiCYwaExbsKFN3Qj116OZnh9LGVcZOonPif6MwgURG+10LjXzRH365LN1LnFPJXRNtVQ9M7hl6CnQc3fP3ylQdWSma4P30IzswHEWO5tbjclMiAuEzdEPC8um54xLzugTosvCsKg5jdUUPoB/Ige/E28bUvWHu+wWX0XXuHlSYsZ3R/hnWVyrviob+RlPnga9KA2C/DWWxerg/p61HeC7efWY7sb+0Kj5q6+y2mVIcRSyUM6dTJmyOXpm9Asv8DikBWWckSIOJh0vwuL/y2iR0mRvHENi1JkWRDkjito3/Uy36Hw29q5+Iw==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F5TO6PUvuzECvgYM/jXufIR3Nj1ZbutsAQTd+OJi6tddMdCYzgAEtPyREmRX9s/hERN0qqNt0VFWZjfmmJW97Wx9USjMOJOq+ZcV7rB5AcAs</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3OqmDartyEUr3ckuJgmUD40pUbpsccuA5fVd1xrpxDOHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>pUT5E+AJ7QlcP+vOCq/v3N0zTGCNHvFxECXo5wApcBVhwISmSZTwkwhrfOtCzRidnGORhTI0XBbKYcsZ+LmL63R3Sw53O0Nu6KwoXdwUomcBh5w0aY2WPD7YpVJZcu+DHnIMKGvfqQ07KaDvHulFnQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>c82nF7UXbBQKcnsEcPHQeGZja88unyotqVt0fEnSJ7m57Z0qvmwZtTHxD/XwZUXHE0HVqPjfWI0tG9rxrSIwPbghsCoFeRzy7VdTwPGCgSArak2W+YyFMu4Jot6vVHBD/79b0SFoWrBjbENuMr94sXTkwDTZb8fapMD0geFAm+YfaRqbBckAEqolUeUSlKdRBGsik8dpbJn9o4gSEOJgCKHDIo2PNmStX4BrzZqDeYzDPrVXVgR5RXev6l46kB0NUSORSbhLXu48Mf7d5d9Hy3H4DR2o69n/NbD8FX4Ll2Q11gopFIKpZx43zvKTiqbprROz1teQOV6oMQEevI9YtTEVzw1ZPay0nVNqHKaX3wc4OM+F7vzwlgwKwbLI7iWMXeIBe0ScRr8iZsB89gF0DefoX55+AtxKjQ1PB1Runmnqlcl6z+p69PE1bPO9JWFDjuqjZjnIkiduZip/xR7muqvylJhrP6YoCdccEg3j63OFCgkZsduLrW7F9ieh2OVoflZIz9zBRbyUtEUTgnqLF0FfuRY4RjbEWiY8/7hAD7+oOl8kiI0vLpnO5jfz24vJ</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>Md7GNls0Sn197ZVNR6si+1Uti14/T3u984M2SvaGVOCsWNsxIeTi7nMDBIMrgTAEq3XzlG4WA+PYjCwYLbtADnVKsf1Svk/jJmh2C/2Ve3JQ8yI0TqmaHhz3v85d8xMYw4KQYgdWdqhpj05os8ia9ljzZ6ntmsy/n24gYvVIR+439wE/2eKfLjdaK2M8CirD/XQvpIJaK0KyGfh8Z2LcIEvxUNORkzc4z8HLtFBgb1x+d63ADagd9I+i1Ip+dO9+</encrypted>]]>
    </text>
  </css>
</dir>
