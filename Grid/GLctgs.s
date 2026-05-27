<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid table="ctgs" code="nam, so_ctgs" order="ngay_ctgs, so_ctgs, tk" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Đăng ký số chứng từ ghi sổ" e="Journal Voucher Register"></title>
  <subTitle v="Từ ngày %s1 đến ngày %s2." e="Date from %s1 to %s2."></subTitle>
  <partition table="ctgs" prime="ctgs" inquiry="" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="nam" type="Int16" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60" external="true" aliasName="cast(0 as bit)" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Decimal" width="80" readOnly="true">
      <header v="Stt ưu tiên" e="Priority"></header>
    </field>
    <field name="so_ctgs" isPrimaryKey="true" width="100" align="right" readOnly="true">
      <header v="Số ctgs" e="Batch Number"></header>
    </field>
    <field name="ngay_ctgs" type="DateTime" width ="80" dataFormatString="@datetimeFormat" readOnly="true">
      <header v="Ngày ctgs" e="Batch Date" />
    </field>
    <field name="dien_giai" width="300" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ngay_ct1" type="DateTime" width ="80" dataFormatString="@datetimeFormat" readOnly="true">
      <header v="Từ ngày" e="Date From" />
    </field>
    <field name="ngay_ct2" type="DateTime" width ="80" dataFormatString="@datetimeFormat" readOnly="true">
      <header v="Đến ngày" e="Date To" />
    </field>
    <field name="ds_ct" width="150" readOnly="true">
      <header v="Ds chứng từ" e="VC Code"></header>
    </field>
    <field name="tk" width="150" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="no_co" type="Int16" width="60" readOnly="true">
      <header v="Nợ/Có" e="Dr/Cr"></header>
    </field>
    <field name="tk_du" width="150" readOnly="true">
      <header v="Tài khoản đối ứng" e="Reference Account"></header>
    </field>
    <field name="ma_bp" width="150" readOnly="true">
      <header v="Phòng ban" e="Department"></header>
    </field>
    <field name="ma_vv" width="150" readOnly="true">
      <header v="Dự án" e="Job"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" readOnly="true">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" readOnly="true">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="ma_dvcs" width="0" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="tag"/>
      <field name="stt"/>
      <field name="so_ctgs"/>
      <field name="ngay_ctgs"/>
      <field name="dien_giai"/>
      <field name="ngay_ct1"/>
      <field name="ngay_ct2"/>
      <field name="ds_ct"/>
      <field name="tk"/>
      <field name="no_co"/>
      <field name="tk_du"/>
      <field name="ma_bp"/>
      <field name="ma_vv"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="ma_dvcs"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>dpac2qiGIJGsfFNzvPMiGkpxV1R5ahcYBBa+psxt5CqgtKa67cw0gGbcDzlTM+wELVPGrpaez5AWbnU/7HEq+gM7WCpFRJlEq9AqAI2lut+UZO1FUwhlYMSq5kXZLvqaFgQYJxyjDzISkReu5OxcYHgEdaPPCNTksVAp1ea0Lbxr/nej/gHaPqfQG424YfLS9dKKsBBzZ5BNrnuvysPB0VIkLhDedYcvXOUHLfDJLGUGOvoS5m6xlgkpmlQcBSWCgSbki7zXvqJ7dGTzSMHsH2/oolYqL1UuPXkeM0O+CzZhrf2BfBt8vEZjA/lzKPue</encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjsTx4aoKFC/0LzfM++Agf3Fpu6I4lq+rJk2T/lWJ989igNkrtMHCGTP0xuDcKUyOpwzZw+5PofBKEnfxnInsRo=</encrypted>]]>
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
      <![CDATA[<encrypted>3EdyDwtWKazkJltIoWUhcWaKfojSLY2wYxt7WRKO1KURPrENxRM8qVCbY/DMDw9gNBBP8lOmcnW2luG8UzhS9JW/INuyi0kpvWgYBhxVXRLUHL+0AXMF3/8TwEM/IXzRJCl8I3uzH2k7L9892xgIzLxHejbuJAFBydlH0bqE9dHS7L33HYvsmmFCheyHfLcEBtdwn7+BSfmHFpKkOEws08k0JNtYrS62OjnNnEEQK2mBPexFZ8gT4onLPMljuTJtKikJFfVRTL9FAKK5aL1UDsGda7jj2ozLjCanaKkcwOxkJmVTJPF59dQVG/3U9N3it7algF20bHnjRmkJz0ZLYNM+8RkMDZ6xaqoy7tuS1NhQF6Fkw5BCHDUxZRpluaRkcRCd1bCAz0aamPkYRw0R/WDjUVHlwkNi2dHFJ6wSU/cYuUgYPi87+mHdRq0so2wNyJVmLL8gwjGSFeTDkWzYyp8qhYv+414BG3Xsp73z2RnyqIUush/U/0751JQfnFNjBBApdfnbh+SumI5Y3K1E3TIusgINCkh5dqGPDTZyHvyrdxQ2u+wwHuFvojsZQQ57MIwWLtHM5S66WgKp9g3OU0KGEO2Cc74cVTZtVgaSn5igIjw60klDgFRftaPn40yXf8Uswr39aMLSqDAgEM8thgnJuIZakb/mw9pgUBwxGy425+4smU9BO8+zq71EQqBoOIUfRUeSvdQ9+526ppU0u8qCDUBrODmMolqHy7AELTWI+9BOQb+rP+aZ1bvUG8nYkgpsK8J49f5LPQbiO8BYgBA7JDlpixxBgMvPkme6WvzZM0FdOVvdBX2Wp4KxTYXQNhaciVmqEAqLXUZO294mGd4noDMxRfOtbaN/XalFaXwIbNnLGL88m8Ir9qRuLOLOzRThgJvLsxGGtJWtKNtS4ZemPt6bkDCbh7TbA45yYEo=</encrypted>]]>
      <![CDATA[<encrypted>KloHXErm4+reD/T3PEUuQlPeSb9tQ5HLX79sxcW1W78oB55HK9TdN7Kgv1uNtBoTvZn2KJpoISpDj7ZX5X0TS3BLcUTSgb5Tsd92DZFTvEqxY6QqeUrFDNtVApJYJ5d/els+Q9EOonI5qW9nSlKre7UXZxTu+whir0KMQm9gDIAEgqY2S+foO4v8sdXBD0nyVwCYznqGl9pnlR58oRuqiYgTEQUtb7I61yQJC/xL9lKx+KOTrFlDu75dthHpjQaGuSnM4QMZRFtuuVbyerl7n4qxe8Zt7Ip2KZP3Ev1oehWljo5qdtnapMX3reB8kBsJ6/oMxbvKSHCN0RoopHYhZNFdnPyOC8P6xgR1IQLLHHB3wZRNSgPfuIRINrz+XLjl3Zbk0D27PKLX9j+ddZ2DEECGzoI6fzEbXz/9IWCIyOhauOpOO4K5YgIiQ5IGPrKExRJnPOqRDJeCXMi6EP42vqgupLzRFX4T08cVZ82F8TIHOezXGwOOMkmk+zQky6Tj+B5bB0H7Z4yYFjDds0MS5/4p2mJ8V+lzhTsbGNcofEICe8iT21Odb6vzmf4ZL/E0LB3Mkw8HJuNIRROcFUBT+xIpwrBGFTmnAelAQp1qLPnklz5m+ezZa9rm0Er9IGHNnLuGDkBsJ9/liaWzIDcH3bYWrNImtX3PjLQjRBu13DABnE6ehbNPFzAkNshJueDBiI+HI+OyLHx+v0Am1yXR6kC2n1S3CE+o4JCgHeDGXl/gpFLabd9q15GtMxL0sdEVCgOfTurtXRuDFIcs5fleeqKCYlZMUWUpoWL3hv72M9dshNVFAeG/a1U19js+8RAvL7iqmXprQPkyvsuVkOqIMlaxu5jHb6Ese6OY3UbMxHicWsX0YNZpbdUCyq1QrC3moM5xzk6W5CudWPa/gmqyDqfdNTh0BrHDdTVAt8nI9N9tf8YvaoE6CKjBSfcaY+8vXaKYkiMes7KHOmtsAQ7iHyWvxC4KqCrhcucAlIOSCGgYFbPcOnLxCKQTVA6acYSTNsOvjVFUyS8EXIlV+Yp/u9GMhM2gburxLC8+tbWIzyTicdbTNgM9F1BAG4wwmOBHTYYCDgZVOhcyfi6E1d8zWfE7AYmvXS4XRDDOEaKFpoNb9ugqN9vnmv6RcAYLs0qb3UGtaWcCFy/ZMDaBxYPlyg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Register">
      <text>
        <![CDATA[<encrypted>b1pTRJlwv7x2haEc1CENMW69BNU4OlrEg0V2aGmh1RZzGj+pOyQm+/LZcD1tjn07o63j2qXUfxLHFBblHYi4jfm+/rb7JUG/WI+WOBkA8Rma24lAzBT1pRcuV32bRkLUUVZ9qtwGWH/QZNX+3nteztap4Qgy88gmwvAyGkTNzwofN1n8wDQ2WvowlJ/ncfUeLS7+06eoZZTs/poWhzAE0CGPXORFErfGtd7z/Efpmp4Lf66sh7OxQp7ekZDwCBFT23COkfoeChPoRCtZtSlK03E8YhpStjV1L05W3Kt7NsdsSyOzTF+3R5KnAQzMt5+7cpYyDDYJL3X1JwIrY873KI36QJOu+kKQMswjhuYu0/xqZFs1DidqNMEpsRJb7YDh+/jIongUY+MxcbEXdgAua/JLfA5kLZL6Fu+RkzcAlxD8+WO/lvi6OYWBKRGe/9ot3XYMsM/p5Cn5/XvGsDqL/ydAnHNZeMGiWtPNzfbBSatJnfaNtYQvGZ9q3U4V8+G5</encrypted>]]>
      </text>
    </action>

    <action id="Truncate">
      <text>
        <![CDATA[<encrypted>GU14JZxs690pqG6H174V4WNZ7xnucYo33nb3mF/Ke/7yZ4guiThbndAu+55J9LWfb5lncHq5Y+rImpNJtmaW+PAF+lKnRE9oyWszcvP5FZKN0K6M9MivYvdKcO9xHn6u/cxg3FRTa7EBPeJtwimkd0XCXatik8tRGdZo8ySXwnfzjC8IgtUz7kGWao1c08BVcppEDQhxsHihhpgRJNUhn226Wslx2WNpQK7QhMoGQykXdHMPR1ypSJRoWhhJX8+1YxpVcOU2eSjppsgq8KlgsDd6t4CDUWZs635N/txlnPWGbI783DlBOmRqrfnPhEz+tdCFLKu3zp6c0tSUfFOlcrybEwa12sAtPqohVRtJRsVNBdxRTgg2eEhceLAjQ3STGmxi3r+Weg14hwpFSPomB0oHKku/LGsSXxRocLRnKxL9WtaDTIZzeUDZWM/w4RWVkAxlFtBxdER+qQPFTHCmzA==</encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<encrypted>eNK5GohWT12HzJoqhJX2HwscRrhS3S82ASpZ3RbwX2ZB2Fq0h8U0MOGrL7Bs2j9o39O9opf9Afc3xHXeSlC6RUa4LeUBcFt4VjJXT4kzT8J4b+LnyHehurFDZdhxRI84o+8mf323ufvxLXHj6DU91WtNc9+HWQ+ZJ8Wx5rMxjcaguI7kZiYnMazu9VYJ0TqQC08E5N1cGRXzvQsLKVbLXA==</encrypted>]]>
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
    <button command="Search">
      <title v="Chọn kỳ" e="Filter"></title>
    </button>

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>

    <button command="Register">
      <title v="Đăng ký chứng từ ghi sổ" e="Journal Voucher Register"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa đăng ký" e="Cancel Register"></title>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
