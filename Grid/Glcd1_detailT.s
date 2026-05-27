<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbarDetail SYSTEM "..\Include\XML\StandardReportToolbarDetail.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 0" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="Sổ tổng hợp chữ T tài khoản" e="Account T-Form Summary"></title>
  <subTitle v="Tài khoản: %c. Từ ngày %d1 đến ngày %d2..." e="Account: %c - %s. Date from %d1 to %d2..."></subTitle>
  <fields>
   <field name="tk_du" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'glnkc4_detail', Controller: 'GLnkc4', Name: '[tk_du]', Value: '[tk_du] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>
    <field name="ten_tk%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Tên tk đối ứng" e="Ref. Account Name"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Debit"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Credit"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh nợ" e="Debit"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh có" e="Credit"></header>
    </field>
	<field name="systotal" type="Int32" width="0" hidden="true">
      <header v="systotal" e="systotal"></header>
    </field>
 
  </fields>

  <views>
    <view id="Grid">
	<field name="tk_du"/>
      <field name="ten_tk%l"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
	  <field name="systotal"/>
    </view>
  </views>

  <commands>
    <!--&XMLWhenReportLoading;-->
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7YYA9+XZfR6P1K1fku0D/HrT+Uc3IUPd5v63GjiURZnWSmFEglbd8lRT3OSVmKSkhPjKyIdJ27BjsSQSYk/eSIE=</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportClosing;
  </commands>
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB6yJgMoG40NMNEglR+M19lZ2XgJOE/+zcZkEwWkQGSO48UuOAeos/FJcES0tnrCdTqg==</encrypted>]]>
    </text>
  </css>
  <script>
    <text>
      <![CDATA[<encrypted>Jo5/affIH2G2D4z60wZ62aLPb9M2t8qgLgniTm+XPPq4jlfCEOMLug+i/heU+WX2zMafQb00LbgoMOyXPlBOvLKwg8pvqKar4AUsN+APV3mG7ThL/LV7e+jCLzrswrcxsCvQ3D0BVyNOmZ4dNxojwiYz3+zAw7HPR6I3RkeY5eAOQ+hIhKr7lbrpDlkFGqiyOaOv3OCV1YzqOO7Zt9S8V698kxEJTfFBEAPcVdVySFRKBMFrNWOjilzCwtaa7IVI2pORGozyqhliQcreUbySDM5t0mdm2qg4syXeXpwuY7lm3TOXIGn3ijnZ3MTmIF85SIcxMiKWsfxL2ajgV9k+UbN2pn5Yi7+s33Udp1LfNFPDsgLsQSYHA9pN5NEH/aOKKWMFOtopevZsjxRz2xW/Dyp6NqHsF2cbaNuqgc3PC7OumG4y8ZGdqknv8y6mcTQG1gpgMfc9VC7PbimdWatvdvRr5P0ZEGklh+OJLNLPmFJlX83B/z53d2acRK/bJxOWU5J+SvzMO68zucVnrt0nVZqMYDAV0UcViqgXZ1Fp/vz1Ux5VQLmRy4eYLHSQma5koYygVqPeFZOgojWHYWI0JjuR1W+hxJedPdgPR3i72cHyIYLC4sZc30ET4LsN1Hg8TUAyckZPOZ6TTCFJUA3UyOvgKviu6zyBSluQogJpweo7hkjKGNDMKYzgmGDIqRsdOe0NYryplzX62YpsU+7WqKfoF2aAyLCkbMk8wWcBnN4wE66hosJIu1dmJxwMYcxb</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbarDetail;
</grid>