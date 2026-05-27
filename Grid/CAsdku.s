<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">
  
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
   <!ENTITY TransferID "CAsdku">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CAsdku.xlsx', @description = N'Số dư ban đầu khế ước'
else select @filename = 'CAsdku2.xlsx', @description = N'Loan Contract Opening Balance'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vcdku" code="ma_dvcs, tk, ma_ku, nam" filter="&FilterCheckAccessUnit;" order="ma_dvcs, tk, ma_ku, nam" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Vào số dư ban đầu khế ước" e="Loan Contract Opening Balance"></title>
  <subTitle v="Cập nhật số dư ban đầu khế ước" e="Information"></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="80" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" >
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_ku" isPrimaryKey="true" width="110" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Khế ước" e="Loan Contract"></header>
    </field>
    <field name="ten_ku%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khế ước" e="Description"></header>
    </field>
    <field name="du_no00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ" e="Debit Balance"></header>
    </field>
    <field name="du_co00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có" e="Credit Balance"></header>
    </field>
    <field name="du_no_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư nợ nt" e="FC Dr. Balance"></header>
    </field>
    <field name="du_co_nt00"  width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư có nt" e="FC Cr. Balance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ma_ku"/>
      <field name="ten_ku%l"/>
      <field name="du_no00"/>
      <field name="du_co00"/>
      <field name="du_no_nt00"/>
      <field name="du_co_nt00"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>6y7mM6tQ/lG5MdMZ37WL7y/dJxTpSHhGbIK/cJ8x7WY5AnqFqUduIemAD74GoU0iCj7unMm7UU+S61qPb3clmdhGZW2aN4qErzYr6qNMAA3sLyq6h3Leq9ATdTHtkWLdej5aFqChCPvs2FeH4oeMQBrpyjqA3AFIzICPng9RwykjhgIVxtsfqR6q2PBn2DXmAUefiPQk8RfCPXb7OWOjMpT5TBVh22NpD7jJB1rv5muWybX81jyCS0mfdr0lCU+q</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ku0s+MPpSw+4BviHGbpGdzmfyHR4o7kMFkgcV8IF788NeGSFsV3oPRikiY+QT/tRUqEgJ7LJBBOv5piVkre9bso=</encrypted>]]>
      </text>
    </command>
  </commands>
    <script>
    <text>
      <![CDATA[<encrypted>j1kdBnMVgUhvK68Y60qJcI7CTkYkqLGQK2Mdim/Pd2QE/uVzyhQk/ez5J88jBIVlLAT4y9w9bZQ0xjf76iffmGpkZP7/XbONeQqFMOsXyaFVfroYRTmLIReuFe5NClntsm7azNbKQ4rFL+6Hz2vMK5Rm1Q/vEv2L1LoOx3r6nVsrqdBb1SLmowTlPTMFdM96R0zX4dK4/tNT3L+6fOBizFaZDjz73g6ZQCHLzSDb3Dq4E2Kd7ykMwowSIyXyzvqGrU6jzv1w4zjuMb6k3nisyA/YDrmmkA652rsbbmytX8L2Xn1I4LEKphYI/bCcMy6uPVeAFJ2Sd/H79axL/Hzdu4C05gbB7wVAMaFq385QXxuLNkairfc+41fbFux68Zw8rEwJWVJhf7miUfjROhwbh5aElLsWsRcqRs9PSx8mn/W1LjpUftVBUQJ0vDpN7DDjxvTwUGIyV2BBf15LvhOlYNxuWgukA767Lq7nieKn9iJSH2/Dvi57ZPo7uKf1ZK6cLtIQa54bknOVURHYP2XwsNYqz6ecyqK3KwUEctHdIMMYwtjFmLPD5PLjgbsRNyv0QQaeJt/2qN3F/glZqgD5qw==</encrypted>]]>
      &DowloadScript;
    </text>
  </script>
<toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
	<button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
	
	<button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
	
	<button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
	
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
