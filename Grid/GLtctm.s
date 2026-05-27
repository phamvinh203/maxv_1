<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "GLtctm">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128), @ext varchar(32)
select @ticket = lower(replace(newid(),'-','')), @ext = case when @circularType = '1' then '' else '_A03200' end +  + '.xlsx'
if @@language = 'v' select @filename = 'GLtctm_01BC' + @ext, @description = N'Thuyết minh tài chính'
  else select @filename = 'GLtctm_01FC' + @ext, @description = N'Interpretation of Financial'
  
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7YYA9+XZfR6P1K1fku0D/HrT+Uc3IUPd5v63GjiURZnWSmFEglbd8lRT3OSVmKSkhPjKyIdJ27BjsSQSYk/eSIE=</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>w6++7Ewh43GtS8tEd/HJcKOCvUKM/O+Q1i7qUuHwjwAv55K6pWs/MAizp3XOJI97Tj5EJos+0Dg/YS1gVWgO8Io55gcNuAn60CDdRGv5utxmhKNYW8UaX5C+f94Xy0ZHacOmfoAZeu2EXVX0JPIj7qiFkPbOfjvelx9vx8qglFm7bX87tlI1YOd/nnRPk+sT5buiT9MpN8hoyuexrKQffQoxV//zHmpYkVqa/f/JPkYdJ3uI0vQsQtWPHcqzZYX6qERxoMvE7EQJ3avLPh55W8kxTMxvgj2uQidYp6O3P3Pbm6Z7Qi69j66IdC2B2yOTaia4eKiisLujJmx/IYeT9kQjw+MCoeDrzTYgLAmnKFHaNEvxXp1f9uoj3T08aKmm8MpRk+hBJOwkst9aRrJVnd342aBnJ68SeBR2Ud2v907hoR73LJltSkhv3AZGVBNiTcYeVMPmie6M9n5yKhyjGxPlhmQ+Ce9MObFyYWpR/n/lWmsyGjNRGfyOuyOErTOcPUVyKWQq5cph7XZCbIrjtNF101q/DkQxXu6Up6iag2I3aMn9YTGSlIOJAXXdEuIiXwllApFJW9ED4sapgXMHlgCAYfuWdn9RBp4BQjV6abmer9RlG9lQ2m4XbLFU6fWVABkIyWURpy39nDskrtD+nhNp+oDszCP1EtX0+csQgP0joPNNCv4k0E8w9mr33RMprEG3sNpQreAKGHLDK1iTFlkjuELbxC0mNtXovdrUuN4zvSMaEO0P0msv/Tom+k6Sx8qS+sTCQ2vPGFAxM+XHc3+zlEKKSdMtLT4gF5KSgAAC89Gn/zhiIHThE0bKWYyNJng7OU/3GWm9tzQSxH6/1dgprQZh1CVUR6bp0OFkZhS0OlScIZfKh1olQsp33CbA4fYc8LHM7ONDIqy4tQIqj+r/9RR0rQGygVQLrklRmrTswYs0ZxGZ9/KYbF9sqOG3PsLZb2aT4ZqotLBC2fmDFrEgsN8Lsq9emmqr/yneROCLumNjo3HnK8SXD30p3dRHlfGAac5GIVuzqRgiVfj/5w==</encrypted>]]>&TransferID;<![CDATA[<encrypted>9wcEF7GUBP6W6lkCTpDR5HSHMa0b3edvYM67W835di0RWomEnOP9YsIUJ6ysFZUcvlqQBdDO47DUGPDTCJSLDjB8fhuc4ZNgxzKyktJOGKkeHE8q76Q7oOlsN110vEkh3iwIB3Qh8WSDiXSOOgi/2jq4doJTwNJ7LqaA8e1Z017TmHm23WHJaGvFar/mALwP9vdTbYbcT6SuCT/+KeEu15HgSdp992A/5Tiup2jVo2OD9EB2mZ2XaTjYo7miTD5W</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38Fljud1Xr8sCbuvguF1tuKC1LiYTJS/WU9/rocHd7MUhx11Gj9pY1p2OaDzRfRSAsZYJt6hyBwyOuhTrEdffGfEDXwO/Mc2DY2M2jm6vFwfwf3RDU2MOISiIhTUpg+7xSdeh5BmQoCrVjeGaBDaKtkKHjR/GU9UGH9jJ5ABezhM4VK</encrypted>]]>
    </text>
  </css>

  <toolbar>
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
