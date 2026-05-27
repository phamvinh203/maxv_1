<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Tổng hợp nhập xuất tồn" e="Stock Summary"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'inbctk2detail', Controller: 'INbctk2', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString+String.fromCharCode(253)+[ton_dau]+ String.fromCharCode(253)+[du_dau_nt]+ String.fromCharCode(253)+[du_dau]+ String.fromCharCode(253)+[sl_nhap]+ String.fromCharCode(253)+[tien_nt_n]+ String.fromCharCode(253)+[tien_nhap]+ String.fromCharCode(253)+[sl_xuat]+ String.fromCharCode(253)+[tien_nt_x]+ String.fromCharCode(253)+[tien_xuat]+ String.fromCharCode(253)+[ton_cuoi]+ String.fromCharCode(253)+[du_cuoi_nt]+ String.fromCharCode(253)+[du_cuoi]'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
	
	<field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="Unit"></header>
    </field>

    <field name="ton_dau" allowFilter="true" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Tồn đầu" e="Opening Q'ty"></header>
    </field>
    <field name="du_dau_nt" allowFilter="true" type="Decimal" width="0" hidden="true" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Opening Amt."></header>
    </field>
    <field name="du_dau" allowFilter="true" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" hidden="true">
      <header v="Dư đầu" e="Opening Amt."></header>
    </field>

    <field name="sl_nhap" allowFilter="true" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum">
      <header v="SL nhập" e="Received Q'ty"></header>
    </field>
    <field name="tien_nt_n" allowFilter="true" type="Decimal" width="0" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" hidden="true">
      <header v="Tiền nhập nt" e="FC Receive Amt."></header>
    </field>
    <field name="tien_nhap" allowFilter="true" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" hidden="true">
      <header v="Tiền nhập" e="Receive Amt."></header>
    </field>

    <field name="sl_xuat" allowFilter="true" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum">
      <header v="SL xuất" e="Issued Q'ty"></header>
    </field>
    <field name="tien_nt_x" allowFilter="true" type="Decimal" width="0"  dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" hidden="true">
      <header v="Tiền xuất nt" e="FC Issued Amt."></header>
    </field>
    <field name="tien_xuat" allowFilter="true" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" hidden="true">
      <header v="Tiền xuất" e="Issued Amt."></header>
    </field>

    <field name="ton_cuoi" allowFilter="true" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Tồn cuối" e="Closing Q'ty"></header>
    </field>
    <field name="du_cuoi_nt" allowFilter="true" type="Decimal" width="0" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" hidden="true">
      <header v="Dư cuối nt" e="FC Closing Amt."></header>
    </field>
    <field name="du_cuoi" allowFilter="true" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" hidden="true">
      <header v="Dư cuối" e="Closing Amt."></header>
    </field>

    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ckntxt" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
       <field name="ma_vt"/>
    
      <field name="ten_vt%l"/>
    <field name="dvt"/>

      <field name="ton_dau"/>
      <field name="du_dau_nt"/>
      <field name="du_dau"/>

      <field name="sl_nhap"/>
      <field name="tien_nt_n"/>
      <field name="tien_nhap"/>

      <field name="sl_xuat"/>
      <field name="tien_nt_x"/>
      <field name="tien_xuat"/>

      <field name="ton_cuoi"/>
      <field name="du_cuoi_nt"/>
      <field name="du_cuoi"/>


      <field name="systotal"/>
      <field name="ckntxt"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>qpwbGA59f1E3Pv3w7DKihZFPeQfPE3sD8ErZRt71gHCTQuKESuGCdLq6yE32H1SjMV0vw1YbpWGJeCILkMt07Ed4t+ph9KSmTs38pXNJIRL33a3ADg7e2YcIIDhkrnDK+eu8Es9j4MaXM5LBFtbUTODciRf68EBla9fSAgF/uOvdprca0Q1WLbqSGHizI3OLli8eEMLcblQ60zcvosjJdjfo3zNk7wZ+u+BHixhjzeVxVSgTP6Guo4hCp3hDDTznegShe7Mn+WkSmolF5iv4qnpCNV85JOw5jlqd4qfKyUXqfO3ri7lCeZnEHZaC1/iDeMYkp4Ptw4ZPZFjPDsAo62Bz/JlxX96ahksgUsO6S/CEptXop4lDKqq6haYHTuSrHYFPAlCADe9chHfqkqkejN9lPPLoncnBxkP8CucwlK8=</encrypted>]]>
    </text>
  </script>
   <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FNRmb1GUljl7TT5kwkkjIrSfG1w+hCXYzHWvvqZs0ZqPN/yDMNpe/idlHa6yONnxkk=</encrypted>]]>
    </text>
  </css> 
  &XMLStandardReportToolbar;
</grid>
