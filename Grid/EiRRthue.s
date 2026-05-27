<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "EiRRthue">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'EiRRthue.xlsx', @description = N'Danh sách doanh nghiệp có rủi ro thuế'
else select @filename = 'EiRRthue.xlsx', @description = N'List of Company with tax risks'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="edmruirothue" code="mst" order="mst" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Danh sách doanh nghiệp có rủi ro thuế" e="List of Company with tax risks"></title>
  <subTitle v="Danh sách doanh nghiệp có rủi ro thuế (Thêm, sửa, xóa, ...) " e="List of Company with tax risks (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="mst" isPrimaryKey="true" width="110" allowSorting="true" allowFilter="true" >
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="ten_dn%l" width="380" allowSorting="true" allowFilter="true">
      <header v="Tên doanh nghiệp/Người nộp thuế" e="Company Name"></header>
    </field>
    <field name="ten_cq_thue" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên cơ quan thuế" e="Tax Company Name"></header>
    </field>
     <field name="ngay_dong" type="DateTime" dataFormatString="@datetimeFormat" width="150" allowFilter="true">
      <header v="Ngày đóng trạng thái tổ chức" e="Close date"></header>
    </field>
    <field name="tt_canh_bao" width="250" allowSorting="true" allowFilter="true">
      <header v="Thông tin cảnh báo" e="Alert Information"></header>
    </field>
    <field name="ghi_chu" width="400" allowSorting="true" allowFilter="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="mst"/>
      <field name="ten_dn%l"/>
	  <field name="ten_cq_thue"/>
	  <field name="ngay_dong"/>
	  <field name="tt_canh_bao"/>
	  <field name="ghi_chu"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>TEyKS+GJHioof+4hdxDjkVAEPFONvfdyGydrh7kuqrEVzyNhM1JUo8irw3f6V4YKbCatid/iu6vbRzyBSuAKFjG9SDyr1FL4H4FQzxaLf+fXwc2qaPZnq2M/KdqE4ju0wXYZGWGm9tYxuq6+OKXb0M7nY12Fpo8dCbOFDLkDbx7ZuHIFufOPA8AydhsxTb4nvhfhgtuKKm3WZpXuV8MOyR3f6opBKQALrK/2XJF45OiUcT8rwCIFXx6FtSbPdGwX</encrypted>]]>
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
      <![CDATA[<encrypted>MfzRul0eY1yMmOt7//DLrDp7b+azpRP4PW5hFnufMCTzJZzjOsmvMaE2UZ5FNMAEQ1BFKJxejTkcDyVw7FTsUL1a/5/zMGqUDV5ZYp6TUbZAZ3ethCr0rVf2T2J3UApmP9fgSY93H+nqDYdNzIdBP/H2nGoy4YmUxZvQcx1fYQAe76gErf1DfBW4p+pagpXoztNfCxWecoj0u4lfTIOm4OqA/54r92DAKTiDaSUKbt4UD1CUst7Nv1vvhBJzZIv0E0Sf/Eqa+lzlY6/UFYb7tX+Vy5v4YdwRPGacAQ20CZ7EHyo0itZEI93toTvFZS2ysFYyDVT59ZQOdQWUxNupR2LNV5Y6ejTSjIEmvRM/ZzIGLSVPPqO+5FABnL8NyHfQ8y7ue2FzDo1CEnUDYYqDY+O5rkAAP4a1zdEJuDTFxSwCv9WUSDYBvJznFn6hPnJyo9ojlhiRf7ORULfFnBdu9e4JIJNKqdyymjjl08kvRWwbYvIyZ39d9QWzs2zjy5+GRbWq8EWdESWmuA9GITM6G1Ek4qiAOJirno/pai025e2qywNuac1hWhPOpgxTYZyjkGZsmv3zc1yf0e8KtKWQ9T9/wewSUQpMfs0vETPKV5IuB+3Qcta3gM/dNdoyGqZiyGEGuDVBPBgB7Bx0GH4PQOLMT5S8dgfZn10lOF33NyIf+85ggaJ5h+7dtzSSxXopHeWLjRu32c71wAQCTgBD/l5K+y4OprfCu26F/dDEUxfJbYxy8DFbZFosdqc85PaxSZOECu+1tPbqAqQ1n/f/HubsxLGwUozIviDyiKByE+2yT+uAF4Dx00SSKCPoQ8GN1gx/N2SVGNRFkCvISEmjft+rmwy5tq9yCkbEEDnQHVl/zXRwlxDyYibLoemRAfdTga5jkv+wKEAdVzOSuZJNZuNjpKXGl+6Rh+9jkphIcAyOh8FQy0hIr7K+qcmk5ksx9xSMkT8ttw/tTXl102GttXbIWs1tm8qAft//wp30cHtm382wjQYhLtqGkj5ueejBaDwlEVbvnb70Lf+stayKIXSL9HK8gfu4hvYxhY7yPyLDVxQgpECWXLdM/4CGPbkL+bjR/rlxlgEAS+ewO4m2RVYZOA2Xnd+1pG8jT5F+QM2c+BEuAiFBqblNJveYw68Nlk1zU6cOFveOcxcKwm7tq4SjhDR0ziZC/paUHVmq1vA8vhlXBEZqh/EJyQjMDdv/pn9owNYptTIx7Cz2ZJOeZRGt6H5QUoXkN3M/WNDBMEY0ILx+LQLZQrVmcRtLUiEJT49w+2DDGg1rmm2B3Q4DNZkl1UPJn2eryJPS23v6QCKcOMA/dG1QzUucbSACXCqjP2pewEk+LBrq2oSB1RpK0v1Wmr6qxmhck+CqsuTckVe9uk3twboFWAMSbxSpkMtodtBIs+U+7xOuCYseFEgSk6FOiMfykAayCL2XxMDQI/1MpGr6LBqfcXViW/tyUdDVdmW3DU5ECno+5tegd2akHg==</encrypted>]]>
      &DowloadScript;
    </text>
  </script>
   <response>
    <action id="GetInfoTax">
      <text>
        <![CDATA[<encrypted>F4DN1QVNwt8tZNi+3cCJc58F1XjNcAr5zbMKU8BXFfHRqGrxCYmcuBHS7nc7YJjqUmivHvUcqdo5fLLCHNfIwm3nVNwjvBMW/sZOQvdcUZq98pzTGZgiMNL6Xjw7iiJ96/T3PHWM18N5dfn7/XtdY7BlrOybtsd/0e7z0wFChfVqIJLnoePvi2E9DJS7q317hqCCitorPXLoub0LEWPuLeqHnknpmY7VWGjPDfuGojeEWzsTSET2JIdEa8JB8hpGxOVZZtf0OMkB4Lv9b297QMfz9wACeNlCcmf77bg6ZnE9gZe0mKjsHiqkV4ewIZjvDJMK/bGaV4T33ETtAQPwDsRh76wpx+pwZH3MK3aS3uE=</encrypted>]]>
      </text>
    </action>
    <action id="GetInfoTaxDetail">
      <text>
        <![CDATA[<encrypted>iXn28AmU6uSGGVZ0SYY8Mvg0ZeONTWYJcRAXApTQAF+ST4GeVuDBysHaHidMsymTzVMbkM6eGg08zx20dn3Sz48Cs0opmqGcFt0sl8cMsqtpvXDlupYmWUmOMIHy4xdPMae+dV/n8OPpndxz3QPHuldPHuUnbyk8RrxWDPuXETlIPDvOtabEWq6oD+zOcMgBfZz/RKQNr7Dv6cUF10x9iskjzp5oNMzYjdi0Olonz39j8p0cKacBfp9cWYCJ32vzCasBV/MrMES5ejn9U7BSVsvuWuCYdTcEUqizHQ+XHeBx4P2zxXVioUb2DiKqUVaeHexDUwwvkhrqQYmUiv8F+UXOzQ5UR8iugCYH+qQFkeIBLInqS6699tPCiVQqGVPsNH4UcEEwWUEYaYZnIgGyN5mO+lG7ksq+ODrmGsH/WwuRgh5oMcVEUz7Z+JaHb5hNmvaNRNyz7+3k7Fau2ljTlCb91N+Yi9/VhjP4kLJeuP41gqVPot4UiCzyO3VTfl2Igf9PbTMk43tfYff5qtTI7sVUGwsCoGYbiM8VAnnncr8JyyHRbW8d9up5p1Yix3v6</encrypted>]]>
      </text>
    </action>

  </response>
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
   <button command="View_mst">
      <title v="Xem thông tin doanh nghiệp" e="Buyer Information"></title>
    </button>
	<button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

	<button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ Excel" e="Import Data from Excel"></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu Excel" e="Download Template Excel"/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
	
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
  <css>
    <text>
      <![CDATA[<encrypted>EbYG0wcERw7ky2NXvdiMXrH1oCeFO1wl5HbbzLH5vkLHTvlfsO9XCnsFGN3NFMfcJv6nkG9fwmYtK3JSm2Z55PZXLqAYA8hU0nDYs1YWrZtVPmx9WfLDc58HwImU+q8fTVQh79Ie8AtH5ZNEA/86bg==</encrypted>]]>
    </text>
  </css>

</grid>
