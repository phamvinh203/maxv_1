<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "rptInterpretationFinancial">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128), @ext varchar(32)
select @ticket = lower(replace(newid(),'-','')), @ext = case when @circularType = '1' then '' else '_A03200' end +  + '.xlsx'
if @@language = 'v' select @filename = 'rptInterpretationFinancial_01BC' + @ext, @description = N'Thuyết minh tài chính'
  else select @filename = 'rptInterpretationFinancial_01FC' + @ext, @description = N'Interpretation of Financial'
  
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid type="Report" xmlns="urn:schemas-moka-com:data-grid">
  <title v="Thuyết minh tài chính" e="Interpretation of Financial"></title>
  <subTitle v="%f1, từ ngày %d1 đến ngày %d2..." e="%f1, Date from %d1 to %d2..."></subTitle>
  <fields>

    <field name="xkey" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Code"></header>
    </field>

    <field name="ps" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Kỳ này" e="This Period Amt."></header>
    </field>
    <field name="ps0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Kỳ trước" e="Prev. Period Amt."></header>
    </field>
    <field name="ps_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Kỳ này nt" e="This Period FC Amt."></header>
    </field>
    <field name="ps_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Kỳ trước nt" e="Prev. FC Amt."></header>
    </field>

    <field name="ps01" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 1" e="Column 1"></header>
    </field>
    <field name="ps02" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 2" e="Column 2"></header>
    </field>
    <field name="ps03" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 3" e="Column 3"></header>
    </field>
    <field name="ps04" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 4" e="Column 4"></header>
    </field>
    <field name="ps05" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 5" e="Column 5"></header>
    </field>
    <field name="ps06" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 6" e="Column 6"></header>
    </field>
    <field name="ps07" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 7" e="Column 7"></header>
    </field>
    <field name="ps08" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 8" e="Column 8"></header>
    </field>
    <field name="ps09" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 9" e="Column 9"></header>
    </field>
    <field name="ps10" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 10" e="Column 10"></header>
    </field>
    <field name="ps11" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 11" e="Column 11"></header>
    </field>
    <field name="ps12" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 12" e="Column 12"></header>
    </field>

    <field name="ps_nt01" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 1 nt" e="FC Column 1"></header>
    </field>
    <field name="ps_nt02" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 2 nt" e="FC Column 2"></header>
    </field>
    <field name="ps_nt03" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 3 nt" e="FC Column 3"></header>
    </field>
    <field name="ps_nt04" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 4 nt" e="FC Column 4"></header>
    </field>
    <field name="ps_nt05" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 5 nt" e="FC Column 5"></header>
    </field>
    <field name="ps_nt06" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 6 nt" e="FC Column 6"></header>
    </field>
    <field name="ps_nt07" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 7 nt" e="FC Column 7"></header>
    </field>
    <field name="ps_nt08" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 8 nt" e="FC Column 8"></header>
    </field>
    <field name="ps_nt09" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 9 nt" e="FC Column 9"></header>
    </field>
    <field name="ps_nt10" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 10 nt" e="FC Column 10"></header>
    </field>
    <field name="ps_nt11" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 11 nt" e="FC Column 11"></header>
    </field>
    <field name="ps_nt12" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Cột 12 nt" e="FC Column 12"></header>
    </field>

    <field name="du_dau" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Dư đầu" e="Opening"></header>
    </field>
    <field name="tang" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Ps tăng" e="In. Arising"></header>
    </field>
    <field name="giam" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Ps giảm" e="De. Arising"></header>
    </field>
    <field name="du_cuoi" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true">
      <header v="Dư cuối" e="Closing"></header>
    </field>

    <field name="du_dau_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Dư đầu nt" e="FC Opening"></header>
    </field>
    <field name="tang_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Ps tăng nt" e="FC In. Arising"></header>
    </field>
    <field name="giam_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Ps giảm nt" e="FC De. Arising"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true">
      <header v="Dư cuối nt" e="FC Closing"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="xkey"/>
      <field name="ma_so"/>

      <field name="ps"/>
      <field name="ps0"/>
      <field name="ps_nt"/>
      <field name="ps_nt0"/>

      <field name="ps01"/>
      <field name="ps02"/>
      <field name="ps03"/>
      <field name="ps04"/>
      <field name="ps05"/>
      <field name="ps06"/>
      <field name="ps07"/>
      <field name="ps08"/>
      <field name="ps09"/>
      <field name="ps10"/>
      <field name="ps11"/>
      <field name="ps12"/>
      <field name="ps_nt01"/>
      <field name="ps_nt02"/>
      <field name="ps_nt03"/>
      <field name="ps_nt04"/>
      <field name="ps_nt05"/>
      <field name="ps_nt06"/>
      <field name="ps_nt07"/>
      <field name="ps_nt08"/>
      <field name="ps_nt09"/>
      <field name="ps_nt10"/>
      <field name="ps_nt11"/>
      <field name="ps_nt12"/>

      <field name="du_dau"/>
      <field name="tang"/>
      <field name="giam"/>
      <field name="du_cuoi"/>
      <field name="du_dau_nt"/>
      <field name="tang_nt"/>
      <field name="giam_nt"/>
      <field name="du_cuoi_nt"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>rhN89LpRfOIrMxm/JM7EayD45QmsSEcv199MG6jAtKD5BVSLD00kBtnWuF+FGuQMTtCLVEHu8tCWd2tITEd46awZKvAIxqY/BPUmKE38rBQ=</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>tPKPw2rFq9lMmpPL9n0FlJyTvbleSYhX5F1aN72SBqrFdl4T2n00TgddBQ5vq+4LvJz52ehLJQPn8z8oNlV5XWhoWn64PJxJk8hFSGGyg49HPI7Vdwd1xQhQReE+QeNUoMKSlZJ9G5UrWqFuDHJr7z+zz/9pE5js17Q8NWDHoOZiD5HzahTNU6lxveen5J/Wl3cOx0UGKYnexL+mmGq5WLXXmm1/rRONMmApFBJLRnJleh9vlBeLuZTSuZcan1t4qVq0i3mNFepwRynAvEseeAugbq5a555Oj9T4l9fWs/h9bjBKg3JmDt8SQd/xmhHbp3w7qwDjWmMcUN39G0yVfAIjTPxJx7HPvqzuC1CwiZG+D3ax0CWbtvZCm7Gde0/PzHovhLX9A95ebvF0ApSaXJW7SOBXHe8ReGNeEqP4DEGftgjujaSEekfu3H0s+aK4EmBlQZ5t0ymzN7+p6Zub7FvBfiPynaKzuvc4n57ckB9nRMBR5faRqzECkRAK2S0MjsMPp9w6g8kYAD7ldjzS6k13swkptLAuqsIIQiS8z4AtDSCqjosDRnQakr6hVEbEt/7u331TiBvouOsXaddmsSKNthqCED+Rc1P6hcE9OEHK1EJ0ywTDK+FMaRoXNvtWJaqU6hF7RldKuwlCa9cxD1GB9uVb3TBHjxza5qCZKIgFKbOh7RKCOCr/J9Ke1UhTVEmrSX0uAgHVJ5UCEoh4teOuK2aCyjR2ET0UdV28LphM58t9GynPDpTVxTHMezFWrlefi+BePvjJ+Idc3kc7EpiQeXTpxKo/B+iVe3hp/efufPl4NpOyQTfm4aGaSxjorpUWHAj+D8+fuR8O5cb++dDV5XhvlMfWfVeT2MBZdjlsnvMgrY1hjKbRbBVi2uVJ3AFPP4BX+vim2Y+rUFB8Cy5z9FMH4N8SghShUMWvj1Q1I+VU7f2dap1SyOClqmjzFZvSvQgMTnw4AKhzIAL8WJZAMsM3U2KRKmgfBXIs+wo5vlQhf0Jv3sqDSVl1vA0dphWlAkEQ9jFQD21II1SEWA==</encrypted>]]>&TransferID;<![CDATA[<encrypted>QYBdoXTe9/fIo8Y/pYPyduMACSuieHED1KLrAGmDwzSA59llEbursj6+/W8iq5V1XrZXAFj78CuFzD2gbrmdFLZmfrpqYAERHdIwDRUKQlmOo5rW2geAQXlWy/PhCUAsdM577MPlmjxsMNSHUbgmzxPiwjB5ghZZsjH+ylO12H6B5pg64naVZfahG9yJovutX1hQzoklXgLThXUzWjSngJYmlAwY9rmr4IZrY7yZMKznwWptLKP64f3ZygCogfUy</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>rhN89LpRfOIrMxm/JM7Ea3DjvI0vsntCZdEZdHqdePL++8qXHDJc8NtD/SVxP5S1AHcAy+9nuH7mWaL+CvMgXw==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>Zfm1X3iYIoYFmr19IILPoNHOXFltXH6TMtD99iuKs3DCaEwqNM39XnDL4E2dHuP1FAcVjPpvI1E/p2Jo7W7UmrKofZQbcpXpjUfCg+KMvwcFkwADGt2LBOOlhMeOtzH8wMjGPqHflfG8hb+b21NFJEEN7xJcdQF9RrEmks1lsCYQ9uU/ZfgpV/s2nOE8Cwh/</encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Upload">
      <title v="Tải lên" e="Upload"/>
    </button>
    <button command="Download">
      <title v="Tải xuống" e="Download"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
