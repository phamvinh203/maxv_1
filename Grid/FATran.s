<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "FATran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'FADetail.xlsx', @description = N'Tài sản cố định'
else select @filename = 'FADetail2.xlsx', @description = N'Fixed Asset'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dmts" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="TS1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Tài sản cố định" e="Fixed Asset"></title>
  <subTitle v="Cập nhật thông tin TSCĐ (Thêm, sửa, xóa, ...)" e="Fixed Asset Information (Add, Edit, Delete, ...)"></subTitle>
  <partition table="its" prime="dmts" inquiry="its" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90"  allowFilter="true">
      <header v="Ngày chứng từ" e="Date"></header>
    </field>
    <field name="so_ct" width="90" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="so_the_ts" width="100" allowFilter="true">
      <header v="Thẻ tài sản" e="Code"></header>
    </field>
    <field name="ten_ts" width="300" allowFilter="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="t_nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" clientDefault="0.00" allowFilter="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" clientDefault="0.00" allowFilter="true">
      <header v="Giá trị đã khấu hao" e="Accumulated Depr."></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" clientDefault="0.00" allowFilter="true">
      <header v="Giá trị còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
	<field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80"  allowFilter="true">
      <header v="Ngày mua" e=" Pur. Date"></header>
    </field>
	<field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="80"  allowFilter="true">
      <header v="Ngày khấu hao" e=" Start. Date"></header>
    </field>
	 <field name="so_ky_kh" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="60" clientDefault="0.00" allowFilter="true">
      <header v="Số kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
	<field name="ma_bp" width="80" allowFilter="true">
      <header v="Bộ phận" e="Dept Code"></header>
    </field>
	<field name="ma_phi" width="80" allowFilter="true">
      <header v="Mã phí" e="Fee Code"></header>
    </field>
	<field name="tk_ts" width="80" allowFilter="true">
      <header v="Tk tài sản" e="FA Acct"></header>
    </field>
	<field name="tk_kh" width="80" allowFilter="true">
      <header v="Tk khấu hao" e="Depri Acct"></header>
    </field>
	<field name="tk_cp" width="80" allowFilter="true">
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
	  
	  <field name="ngay_mua"/>
	  <field name="ngay_kh0"/>
	  <field name="so_ky_kh"/>     
	  
	  <field name="ma_nt"/>
      <field name="t_nguyen_gia_nt"/>
      <field name="t_gt_da_kh_nt"/>
      <field name="t_gt_cl_nt"/>
	  
	  <field name="ma_bp"/>
	  <field name="ma_phi"/>
	  <field name="tk_ts"/>
	  <field name="tk_kh"/>
	  <field name="tk_cp"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<encrypted>wXmaJyxSIu6MwMh5Npy7en6eDSm16h0alsTnlvS0gpU4RWyqzllU+FB3232350dMv5pKcvV4EKo7PPU+/DypXr0LVv/6d3XwU+HiEc6JgsaobUzivP9q7L1fiMWLNRd5zWgiHfXEaFu4dyjx03FEh3xJ1sMxSn3p3NeJ2M6UlCvEaEVshPSq+9rlG0hYatr5MI4q1s8WBDzhR/Weux+4oiTMa2zwkYR0pc0HONflajU=</encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>NzMU0nFv13GgueUErw7ZXjetaG6mAxnO/IgIn+y3eMYBTdzLgDKV4JlBf5LMaxz37EyGFQZ0zqJ6EzgQ8z+0iYxumYvm1g3++kGzjE8cjNSUKqryclr35CCKiKi9HIL2bGr6tjHp/rvQ7eZS/tJFlaPIhO1o+UlJvZHfH0/iMVeFIBBxJay7SeT4rkZ5VupJ9jy8IuUnC8qc+hmsiTBZsAr7e81StR6QSPdo8BTHCFfUOil9h/9yWeoj5fLjMcmHEfI1+Ogewl7KlFDJMmz54r0qhdHrzGYulvWltqvH5x5yZijyveoOW1q6j5bueeszM9OHXG7z/SlNF+dVAgyezyvigI0FqqQuAHUASygGo1reVbdUJSNvkS6lXqhoJVUI5T3BazEiTDkg8K611ckJavlODgbhP5OdEdn8GMAwtGzXuSQMQWX9oNGfRHsZyIwLQlYd1qUVBUfA11xlqakLVVEsz4LnFe4hpkzJT0ffkKaBMB/ss7nDugIIMco3mOZpLKReqeRIt7xLsSXJOxew9hylgKpuJpMtjmvhe7jiOq6rt04QjmiByDS4AkOyJEjEaFrGiQWDNFWW1gNrOrcvDkURE5GSSvHX8iPbrBxtLDcZPylteroKvyoJl3pjNu9i</encrypted>]]>
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
		
    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
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
