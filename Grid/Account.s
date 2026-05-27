<?xml version="1.0" encoding="utf-8"?>

<grid table="dmtk" code="tk" order="tk" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục tài khoản" e="Chart of Accounts"></title>
  <subTitle v="Cập nhật tài khoản (Thêm, sửa, xóa, ...)" e="Account (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="tk" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
	<field name="tk_me" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk mẹ" e="Parent Account"></header>
    </field>
    <field name="ma_nt" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="loai_tk" type="Byte" width="80" allowSorting="true" allowFilter="true">
      <header v="Loại tk" e="Type"></header>
    </field>
    <field name="tk_cn" type="Byte" width="80" allowSorting="true" allowFilter="true">
      <header v="Công nợ" e="AR/AP"></header>
    </field>
    <field name="tk_sc" type="Byte" width="80" allowSorting="true" allowFilter="true">
      <header v="Tk sổ cái" e="GL Account"></header>
    </field>

    <field name="bac_tk" type="Byte" width="80" allowSorting="true" allowFilter="true">
      <header v="Bậc tk" e="Level"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk"/>
      <field name="ten_tk%l"/>
	  <field name="tk_me"/>
      <field name="ma_nt"/>
      <field name="loai_tk"/>
      <field name="tk_cn"/>
      <field name="tk_sc"/>
      <field name="bac_tk"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>PMom5up4OZjSOrMUmeByFkzZWMG2HmKI6uRpX4YU+QMinBV3liRTmOrrEr27b2NTe2BlXjbpgZIRIU/H/VDOcqvbbfg6p/TAtWmOhxi9joQubMF8NcoLTkp0VkQZLfHXQTl2eZGzSr0CIGjlx+qQwxt8Gu2AKkWXtLEVjSeZY636g6Xp6I1a3mzioGzY1Ev2njdLY7W5XMdxA+/R5Jp86GPjZ6UnaakWxXWhTPMznuI=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>3llT5z1X3Aoq8rmZKuAWykS5Pgb/XC8q5yG0nQWQGbxCJAHCLZ+MeUwcl7IPGo0IaMFEcQ8RQSO2gOwGkZz/Bw/IUJ49jD1dxKCxQGJQU2bGalH6byH6hOK0yeYAblGP</encrypted>]]>
      </text>
    </command>
  </commands>
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
  <script>
    <text>
    <![CDATA[<encrypted>1uCye3tCSFt3s9H5eZOhJkSY6p6S+f7pSDGrYLdacatxub6oqzMhkgSMqoWWO1B0kMAUkKTe8UvfyVwySXeEdjKAV24eSS8j6ivdEXsSoRyPhIXyejO8SErTq0kMCNlot/3KBsbfQA93v5gQFCCHXBsIbko9m+Meay5NRhMA90CMw3dSqWx3SWIICOJt8f3sSfH0ugi5wLwdXix8gQj4y73ai2QsJ77x7bGkpzGn3+72KupgUopn9yTuNhMkNMC5tWNOSnoEtTbGzeu3qK068BtuoSrOWvPTUhZmk/0OICQaQ8jdya/YklE9aA6W5VdNAgySRDraGNwsX+e6Z0mg9Wet0Dd3LwO1o2thmuDZ2J92BL7PdbNhn4X6uoQraPGD5mqhBymFRD3XIU+/PsF2BBkQKTkAqFWtG59P5jp8823+GJtUCfhTs6dnQq4Z2FNobhvkJOQbDVcAb9GMgZB4u0T/BOIGUm90n4XeYJ/JnoIv+5jiXApG6M6LeIIxb18G45owb1Z35PTRfRePBOw0hq+SPhb0hs063RmIFsGZ45FDFoqVvvxoA4ck/lnYRuAHbrnztIdzIv5LIk42rKZHIvo+4Om5DcIiaZKNBBVqW/0=</encrypted>]]>
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
	<button command="ChangeCode">
      <title v="Đổi mã" e="ChangeCode"></title>
    </button>
	
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
