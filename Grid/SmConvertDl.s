<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">  
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">  
   <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chuyển dữ liệu từ nội bộ sang thuế" e="Chuyển dữ liệu từ nội bộ sang thuế"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
  <field name="tag" type="Boolean" width="50" filterSource="Tag" >
	<header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
	<clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B/bENPhrqD6jClKUuJk3LC75ACPjEBGeY+Yjwc1UwoRqw==</encrypted>]]></clientScript>
  </field>
		
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true" readOnly="true" >
      <header v="Ngày ct" e="VC. Date"/>
    </field>
    <field name="ma_ct" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" align="right" readOnly="true">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tong_tien" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Tổng tiền" e="Amount"></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" readOnly="true">
      <header v="Tỷ giá" e="Exchange"></header>
    </field>


    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>    
  </fields>
  <views>
    <view id="Grid">
	  <field name="tag"/>
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
	  <field name="dien_giai"/>
	  
      <field name="tong_tien"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      
      <field name="stt_rec"/>
    </view>
  </views>
  <commands>
    		<command event="Loading">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3krtHE262xVHrSA6HePHtNa1kxS117iGD24jC719mrMwmRFi77g+iJ/Ll7CAekFdcIvogTdxHd94K3WemTHveVqSE7y2O4ZpKAkVshU88IlyU</encrypted>]]>
			</text>
		</command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjsTx4aoKFC/0LzfM++Agf3Fpu6I4lq+rJk2T/lWJ989igNkrtMHCGTP0xuDcKUyOpwzZw+5PofBKEnfxnInsRo=</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>      
	 &ScriptTag;	  
		<![CDATA[<encrypted>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</encrypted>]]>
    </text>
  </script>
<css>
		<text>
			<![CDATA[<encrypted>imFcyH+Wy2Qz+/KOMGmMDl8M9fQdUN8jm3T7g3O4O/t1vr72N/N7KmXxuPMqq4hz5SmHxlYkwjHFL2GVNYsuA4VEUBdFEYdq2DUNdGDB2ZwjjY63bwOkPazBeDdn6NotdGD+FTCno8mJGwGYWe+QDNcEWitZ/y7e/iF2wyDvnE8=</encrypted>]]>      
		</text>
</css>

<response>
	<action id="TransferData">
      <text>
        <![CDATA[<encrypted>4BSGsf+/73ZZcFp8YZpNLUSkHiyId2h5AoR5Rflcj+LtEcLP/kjtSBIl+yi31gAQvc8jGKmIEeCOroMLkZ8/g242HV9OoL862CPE7qyEctHl3h6+nm95BV+4MhtnQV52FIDlXd01xi++0grWu88LazC3nXKJJs4HgUcBOJkjctQ=</encrypted>]]>
      </text>
    </action>	  
</response>
  <toolbar>	
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="TransferData">
      <title v="Chuyển dữ liệu" e="Transfer data"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>