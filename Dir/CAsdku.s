<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="cdku" code="nam, ma_dvcs, tk, ma_ku" order="nam, ma_dvcs, tk, ma_ku" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số dư đầu kỳ khế ước" e="Loan Contract Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ku" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Khế ước" e="Loan Contract"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="status='1'" check="1=1" information="ma_ku$dmku.ten_ku%l" new ="Default"/>
    </field>
    <field name="ten_ku%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ" e="Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPq5nBcVJMVUcSR6+GJGQ+XGPe4SVeh2lk4rGi73JHLOxo=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có" e="Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqhoO/yUEppLuYCVG8M/7IwtZsW1DhPQoGMq6f5lOdU88=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ ngoại tệ" e="FC Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPq0O1D2X/ETf5PQbkdXoHqBN9g78szMDgrThUjUCsLIaw=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có ngoại tệ" e="FC Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPq5TUF/SHqk5ApU1r4Zm9/pFl9+MeXWycakelM3D+J6T8=</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="110, 110, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="111: [du_no00].Label, [du_no00], [nam]"/>
      <item value="11: [du_co00].Label, [du_co00]"/>
      <item value="11: [du_no_nt00].Label, [du_no_nt00]"/>
      <item value="11: [du_co_nt00].Label, [du_co_nt00]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7W+/WiT6FegCvJc5gl4Wc9AzY2+7fHzhPzoilbZSKN1kkWMSFth4lXgPTBvoczCrOKU2+gDGHJdS+RCmV0m1vWavvIUxXCmFPffYR1b5oaxh</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>WJlfIzJ2P3yqezLQAm9Jn64Rlnz4pHWV2zBOT29SvzuEucoRe6ZLT3pGCegQe/4N5Hifx2VBqI4/RMC4tGEAyoXQTHroFXj7G6SsT4w7z6jyxVJlSu9q9grrYPQXh7ajeM4AaS0kavopjZniFsuBcbTCKHK4Yr0XfDiqT+6kbOExi0mwJ8EqiV/tgWppZ+a3/pUfilHSMpLBX3kgSv0zbKRHZ4UMoPO4mahpBhOBZsxOhVwuTypA7qUdYmgCJrVFd7w5pUHcDYAZLLT7GJgLxbEkoq2I8KEQ9FCI/q0/ReM=</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/pTDAmEOOulB9FyHngy2IpiKlohh6/2013rpnfF0SOwCFOjXghltq420KTTeiNruX8qHA0bAPF4CBcWC/aMNIVqx8WlFpLjBSA8PXkAzcC/Q==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>/iQ1KnZZgFFsVXe8DEsWj++/uxwMoIuc5rJGdv6T6cAd9N+mS2lPbSgpHuEmUFANygZUyzmWW48FWzz4Bla9OOlGbiOlXabhUwSzmu2vGetdZLpEhJS3AGytIo3P4tMXuXJmnC04m12MorA9Y0Bs/mjTxLnsAFT/TYzbcxsjDjWd/B7g9+Zl/s9RF0u1CMCpPv+FxWkPXPa75P2aZ3BbnT0y3N50aHX4iHatu17waIrzwsbqszxFbzOzZ6JXSHoL4WCJ9tjk5f6PkkJVB4E3NbHcZTx1aEsCefVrMMwdCKYNEgGwQBmvRwd0RuWNEhHixrNC66zH+AmTU6wdSGTcSfA5cYXvvmZiy/tHt+DtT28VjJjcVr45f0TCmmwNKYJu0U+46Nw1Epa/LIIutr56R2WoIh7KZFSZH3Lojv10dna+vZ5vYLwkS0kOfbniZd2OXyDYz+y/lHFwGGFq+46HbKqrsxjQuNndj0h+v1GUtx58sMKMxAnLKh6g6sNQc2b6</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>zXgTQJUBsQoDdIKfpZJzCuiEEE6Z1Kv/PP8SpAurl7NqR/3HG5P05D+oO6zadlKYV8wTV3N5JJYgxBoxXAbwlSi+xb3VMR53QeUVGyKWaUDIQDhQY+njiM3EAWac+3H6XNeXXwQLJfSXRAXpEim2Qmsh/VrE17XuIjqGam74vwrQnS2OV8LIdZUZwUR8OLhbBa7h4hs6o2wVGNoO9bcgZudanSJFyalbhdexjWy737ugtwNY8YrG5pzugUcpVTsprDnkRStUmpTAJ/HX1T23byuq9oMl4nJeZYadUt4TyYo=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>oSPezELn7nDZk7ycz90Ar8Mr15o6oHMy6WIPWEprF+BbaUvlCYk8MEoX9orkpLIrHcHlvBwx+zmw+Zv1sUnSwpnw32C14OqRefWLDBmw9pwKpvCaCVDujc3P0/ya6UT7CDQCb2SfwLxbtxV4BPZ6NC/JVQ0CajxHyCP6FGMRFwDYyY5yXejfDZnW/c7LbggRaWw+aIfHUrugDcmTnFE4bxma95RlQeiInfFzuI5vdfFYJmu+kKBFaGfHaJYPR605i+fd+0+icC4CAjXLDYn9GPdPeayoIoow3kjnD3vstC68M7WNFQ11JOA/u9Ud3/jS86fDyLx8PYCIz3BxC3hCouZiQkQiHzvM9NyzYPLqbt/oZ9Z1YgYppjbCPOmSfi9AaQ/gygGadV1Ex9d3gQ7dqg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>bydUI4/IgGaGz+NWZh9zkYOiv7pSK50EkS9e8cjhCq653rPhgDUQw8CwBycWFseXLs+zJneTJSd+SqgXgeJdcKDzazM4XvgrNtHfOF8EvSZCrVQULuKQJJG/wgEIRrUFRueDbm/JcapTvuzijzjTcFzKcrv0H+YZ2Vq1QFLuxyU=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>B0N4mmS2zuD5t78mAF+48dz0ATNIo4WKWXhndXXa2rFL++IdcWI7II/Nkbbzd1bfBmSd0dgAuhcAE88Ok7Mt8vwP+I/J6xu2GWC3cL/OK1k/n0rhAZPLVjZGwOb7aB9BHcLkMwqtG9FtPR3UnbKB/J0wWUQ+tGr14sFO/QxEXbbEXadudnOGaOKafy38VRrLkS0piIBSt2ykOC//JiZ4VZT4VuqiCvMlVGPB1bzTtdZ25lM+lAU8NcuoyIrhjmJFoLRnl7Ph94jAdU/tww+JlxrgGBr3xrVW3KySgyaa95E9fGccBLT7UVKLO8jmzj1rDJDtUU1D1pX8aDXwVm75yFpC9LHXqBatNeUa598LaWGRbxfRv0IEcL3DMej9OCfv</encrypted>]]>
    </text>
  </script>

</dir>
