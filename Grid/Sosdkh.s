<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "Sosdkh">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Sosdkh.xlsx', @description = N'Vào số dư ban đầu khách hàng'
else select @filename = 'Sosdkh2.xlsx', @description = N'Customer Opening Balance'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vcdkh" code="nam, ma_dvcs, tk, ma_kh" filter="&FilterCheckAccessUnit;" order="nam, ma_dvcs, tk, ma_kh" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Vào số dư ban đầu khách hàng" e="Customer Opening Balance"></title>
  <subTitle v="Cập nhật số dư ban đầu khách hàng (Thêm, sửa, xóa, ...)" e="Customer Opening Balance (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="80" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="110" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" >
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100" allowSorting="true" allowFilter="true" allowNulls="true">
      <header v="Khách hàng" e="Code"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Description"></header>
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
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="du_no00"/>
      <field name="du_co00"/>
      <field name="du_no_nt00"/>
      <field name="du_co_nt00"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>JmIRqq2Bh3VLSaUkxlK9dt4kE/gP4yIPjoF4U4z/Ztm6wihRPOmrcHc6ukS7VBa9ImBl8toSy/J8mqtrv7WPbwyMFl17PRf4XTFMHjFE6FuriuIBvX8LIBCp6RwT1XKCtnGTFKuxvgr0Sxlk7NlyNY+qPqFbJAQcqydGFu2ebX5wcM5gHsANjRhew1YidvQVJ6r3SRWXQdKiNVCu3D9fUBCfTwrm5yNEbwX/lFJs9MrGdYVfa8ED8PUux4dd4EXf3sWBQt4PVnAQXmVlju2DcbsKiPWuarC51QKA70zAOcK51je0pibT8qyiTIZmPNi0sgHKjkwrBkb2/CIcEUNGI2dFcvnC2srSvpi7tgEGiIQkXYoYQ7r2UBsbo3tYOEiE+++3i56DF+SYuWQ4xMtCDzlkSqvt48NKpWzNyUxnCoG+7hiex2fCLa+yUZpbdCJYuyd1PfBHTrJCtZ7GvAIM8PfUrJ7yOTJhHydxa6+gAGEfaCJyfl1JJ4xWLTr4cT8anbGpo+PT9XxynX9qox9OZfGYRs5+WNCFdLb18RfZ5iqUXk9p6lhGVW6CmdBKrcTGvP/Ay6/hYiRqKLHQO6bnUEpBP7Li2S1HIq09ZbJU1VJkM4BpRVPQ4Pf9cHVE+g+MxFyDTtrwFUhCG066pn7iopVNFQAPUiFESDbm7Ky1SS9uWRrZKpMrbPm/twHZNDfIeR0f833IqXmpoJwd7WqJDA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>6ENxtUWBpCLwRdF2N8i9TuRU3xta5S2C/tmijaJq96oaox3vS/ihEAKtccZAnDFfTrCCl4CzfQBU01s087xP7ErTCGLf7+ZETAgKZun6JlWwIPzfPT61uGc75Gy7bZegfeCjCYSuh0cZmwTXiTBlVMv88TqBrcdXnKq748ACbnoxT/26EfeefH5NB2dXf3pwkEYZkS7B/PogKNvDZWXR7CIRr1jUwCZiUEgO1Lv+GJUpn9Sb31Hjmx14me/Y8unxhoI7CFR9ksA2jk9Hv5gNzFyKFps4acEWyikzwWuA9CMp+wzTnrjf/ngmRdUd//ZJDs0aBwKIImsuKIQQuMH70WYXmBSdIzZs8bzK9Rqmn7mrCpxJhfvsivTrw08IpQi/edJz+CxNrYlO4LFjYw8Ldgva/aE9RJdwPev4n5Wo6ilCt+sDEud6GcVL2LzmieW84guMmyfCIvzGrZdx/6hAfQh/BUTPKQwHx57OriSKNDbBL9biq4bgNoiIeKZ6E3jXtxrSMYwBQrq41uMU/AiV6jEZCsf1iajKNDgDSi577JzrIqXYzErCKrwQIlN2bHqQmLrk2VFhc/ceqmaieUy4UKZhxdTwWt+GyJxZWwjZsqU=</encrypted>]]>
      &DowloadScript;
    </text>

  </script>
  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlszY+jFcfpMN6+Syqe+kAAiJ5Wg+c8YWyKSfHFRGQ5ki+lCuW6VLXdmvm/zQdZolj4f5otOTy1X8AyobwhsY7+Cf9uNohRfnVvPHcI5LpVSgikgv8ZZnPSZRvyx6MUGAI4ESx3uIGzorOy6WPffm1UiVECBUGrXfjA05md7FH7EC</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
	<button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
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

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>
