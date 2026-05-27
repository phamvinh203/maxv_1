<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "BMTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'BMDetail.xlsx', @description = N'Định mức nguyên vật liệu'
else select @filename = 'BMDetail2.xlsx', @description = N'Bill of Materials'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="phdm" code="stt_rec" order="ma_sp" type="Voucher" id="DM1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Định mức nguyên vật liệu" e="Bill of Materials"></title>
  <subTitle v="Cập nhật định mức nguyên vật liệu (Thêm, sửa, xóa, ...)" e="Bill of Materials (Add, Edit, Delete, ...)"></subTitle>
  <partition table="phdm" prime="phdm" inquiry="idm" field="" expression="''" increase="" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" width="100" aliasName="a" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product Code"></header>
    </field>
    <field name="ten_vt%l" width="300" external="true" aliasName="b" clientDefault="Default" defaultValue="''">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="dvt" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ma_bp" width="100" aliasName="a">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="c" hidden="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
	<field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="120">
      <header v="Định mức" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_sp"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
	  <field name="t_so_luong"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<encrypted>wXmaJyxSIu6MwMh5Npy7et192U1hpuCSZO9DxzlJhR10wxqfzJf2imeJYAAL10QwX9GMGMGUHT7FUHZJIW3ZhEpG1dn/ETnSlYqPL9Sz1wYLC8gLIzr5J0GDJ9kwg9vE0dvF9XPaRjG3t8FCd5sm5v9QYq6yIA+RKlUFvRq7Z3zv/dDwaHK59nYWbmTVpsDVSkn29YLFCRuZkQZL8HX9LzP8RARHtZgZThs7yeJP3mU=</encrypted>]]>
        &CommandWhenVoucherAfterInit;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>EPZ5xdXxB62mY+Z8X/Tjx7HvqcSTa5oLgfhRNz1io8A/3B45kZEiqnUFnEfTjClT4rPcTyqv4mJKACVqlGOLQ7xfFU0vlC05QWSAsVGTco4U1LyK15Jy6QqJBtZrZy9ls9E72ihRyvJ0wO0TMxUt4DvMGngAxbGVL0PBfafdmFgk34rw1ztaXQIRwkU1m1uXjYEaoqqTRrwA8ffpLIwecUkB9qBmALF7bk7bxGhcAKnptomp+nRgw22yjqj+Zb+h4xk66/t8ULl81+1XmPo4oT7k0trOKPvkWmzMT1D6iaU9moK1eL8KZem7o2sszGRpOk/pNufpwR65ytS+ZGNWolET8pnbPNdxOQBG0Rd3BamEhZ9yI19KEhyL2Ysjlj6teKAvcEEmSO87z6E44rLu+D/1N0razwlXwe+5raesUAZY+z3zvn/nCj1kVuiO5/YJ5dqQeXJLlExfo0kl/T8G7YoCyWzSFnAf0WFicPNFuSJswA+QPLp8bsd5K6VTfeqnDGFOo5ePCYEZz2oL2jOcd7PagfkVt1UOWphLERokceD1AHtzmYOKxd283EgAOaufsr2oCzK1SlUZiWgUp3BKCBM0/Zo0q8lBuZLemHfgPso=</encrypted>]]>
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
        <![CDATA[<encrypted>odUh2ixB6zGUu5BpF3X76Y6C9BW3yz4R4zevvftNlHGzxxO/72Pa7TBrVHG1Em1P/z1tVseQx0JdXYF6Z1faowbPsnfKcrMFPjvVe21SzUXe/FnMRV8bjyGw8s7QPLrjyA+pjrPkt9PYri3rny3EYU4+lc6o18LdzD482L4wuNMwgFBkM/hpzSb4iM+fQbOnk/+CdBgQwQQJM//BK5wmvkUfuPCf3d/wGbojtge5qKKushbAVsHOiWu2lVx2/rrVFpr4E4lOP5QkMj9kORt4cnsm/6jMjiLHCrFX3kNz0N0=</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>EK2KT0xG+mcfJmKpTN1FKpNXgIDG1JUjryBggMmCH1HQlvBWiBoaoaSdoXWEVHNxGy5K1U6OMWVo9OavVlykn6WelADNSv55KlWqHrJdSEjgmtyU3neW+XVhn/+/i+LKKdUyjjvXLoQGahIeyWJuZcKDe5AGzZH7KEziIv8VUV7Jo3g6/GdH4aezn+mq1aSUZD7CVqHP4WQEqtpYYs+p9er3LlIPcvGJRmuk8Klhn4gfxDFd5Cra6bh1LQUV6cUlCS38YZ+Jl/R8tmUKGfKoKBOJzld890qaFs2ZPAZOBBAVaG0EoRHluOUblq7gbpKPC89yzxeJW0niC63tT+4JKMlPW8r4is/rVXPeoP2YpGXb8aX29SDEhdIScghZixM+</encrypted>]]>
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
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
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
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
