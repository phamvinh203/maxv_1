<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "TSTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'TSDetail.xlsx', @description = N'Công cụ dụng cụ'
else select @filename = 'TSDetail2.xlsx', @description = N'Tool &amp; Supply'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmcc" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="CC1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Công cụ dụng cụ" e="Tool &#38; Supply"></title>
  <subTitle v="Khai báo CCDC (Thêm, sửa, xóa, ...)" e="Tool, Supply Information (Add New, Edit, Delete)"></subTitle>
  <partition table="icc" prime="dmcc" inquiry="icc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày chứng từ" e="VC Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="so_the_ts" width="100" allowFilter="true">
      <header v="Mã công cụ" e="Code"></header>
    </field>
    <field name="ten_ts" width="300"  allowFilter="true">
      <header v="Tên công cụ" e="Description"></header>
    </field>
    <field name="t_nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="true">
      <header v="Giá trị đã phân bổ" e="Accumulated Alloc."></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="true">
      <header v="Giá trị còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
	<field name="ma_bp" width="100" allowFilter="true">
      <header v="Bộ phận sử dụng" e="Dept Code"></header>
    </field>
	<field name="ma_phi" width="100" allowFilter="true">
      <header v="Mã phí" e="Fee Code"></header>
    </field>
	<field name="tk_ts" width="100" allowFilter="true">
      <header v="Tk công cụ" e="FA Acct"></header>
    </field>
	<field name="tk_kh" width="100" allowFilter="true">
      <header v="Tk chờ pb" e="Depri Acct"></header>
    </field>
	<field name="tk_cp" width="100" allowFilter="true">
      <header v="Tk chi phí" e="Cosst Acct"></header>
    </field>
    <field name="ma_nt" width="60" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="so_the_ts"/>
      <field name="ten_ts"/>
	  <field name="ma_nt"/>
      <field name="t_nguyen_gia_nt"/>
      <field name="t_gt_da_kh_nt"/>
      <field name="t_gt_cl_nt"/>
	  <field name="ma_bp"/>
	  <field name="tk_ts"/>
	  <field name="tk_kh"/>
	  <field name="tk_cp"/>
	  <field name="ma_phi"/>
      
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<encrypted>wXmaJyxSIu6MwMh5Npy7ekNrFepnk7ncrUFLMcWK0JCaNJsCwFX/TMmZVzeaL/iFnWqyf5WD8wOcwmxccH13ZylJCK56RrIsvCQSqJ92Yd/IQ28jH7D6XXrK/f+Sxzz3zyjYqufQ0w5gJ/QoJTKzLjg4iYmn2/6pEiYccqqCLsYbIVNTNz21yLpZ3UGCJ9fWU9HHiyBk0a8VBJfGwvvFUR9Gz02e4u9J37RjzcjHwKc=</encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>YqsqwfkynBZfvEgTok6lkMmMhhRRVNv2d6qWvpZCVsME7Im+hhMtL2N0jQyfpfKJ8S+ZAEEPvkV8Yhd+YEHccZw5Nnzolh6TgpusUIAMS9F1Goc1kpTXN0WUuy29oav9BlCMDl04BqEqUKrIZO/QosXZnUlendKFx0qxtnRLWXm8l0ekXLZKWDQst5H5GqCcntrOrlm1g8BLJA/Qnfy3kVGNhjnLENpDsD9/4mMjao/6eq9e61Yyc72i4b8Cd1sDZ55KO1Kpnd6ihZXGk5iMaAQjOkWOx6FmBDYUOR2DySsGG4A1yom8jORgjc7W4Vdiu2PIiXEAPtJ1ysjYRhcezbdeqIk4N1Ngz6mbDR072bXuz8cjvlE9vILcT4ap6xfp9/fKENIkL9jYI1xCpAXOi/9IOshlbrLwuHioR0ZO1ggwVSCUcYJtMFut3ZO4FGpZId3niYRKar53phyqUUJtxLH+lZoOkw9Q0ZOyV/VOMX77O746oztH3VnL7fiOW8NngH3LlLiJ0l2Fz7Fc9JpuL4gYuYwuZip3FS/x5NRvAaxtcgQAtkpM4hwRHY+BOZwYfAP24CPbKWxj/uUV91+wD3Zkbgzir98+Y3usga9APm0=</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>sgtq87t7Hyxl7hrExRli18JpFYsh84dsYQi40nimALcPTk2iaWSOCXaahwyXfJQqPq7AiC9PoH9meLFrYKzHZvyY2bzOuJKVlUMqNrWD6/E3ueujPv8/CCLx9MWXmYB5HkErCye0mrUXLPHSu3Yr7qrllU99bqEFGJxqaoGEp7aIQwq3VlSWskLGNx+9GAzS84j3zfyDi3YCJuZO/z9u5TffGVlIJI7XR7fvBK1ly3b7+3towyjn2o/PPLsRH1qi</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>4Hhu69h2SAFRaeNlKytgibcPcgMMMkxjmkSXxJyKHJASakV3Lr2ZobPswrYgO8Uq3b49zXjOVxNEenrXz6UdfSQu+mC0QYDSmnK4uEMFBMyvPxhm84EbWXUjcSEWYsd1MEgtayQ7q0CWjuraymEZ22sNxcfbIem0zZ8lCjh9xlhbn4dKOvc9M5goVrP78Z4xHss50wvBU641aoElpIH84eeaM/Z56NeQ6JgxOsu86SGuF1NRBp/V/VGiduC9tQHdKnktf/u5K6PqnHr9ipGoYHwsiR3vT3k+yfmD33o85H6Uz+gh0omUNlgREXvh59Y/plxsfQmrDHskkhHnnEVCstcKlNByCbCVAr6fdNphFJU=</encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlszY+jFcfpMN6+Syqe+kAAiJ5Wg+c8YWyKSfHFRGQ5ki+lCuW6VLXdmvm/zQdZolj4f5otOTy1X8AyobwhsY7+Cf9uNohRfnVvPHcI5LpVSgikgv8ZZnPSZRvyx6MUGAI4ESx3uIGzorOy6WPffm1UiVECBUGrXfjA05md7FH7EC</encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>

    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
    </button>

    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
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
