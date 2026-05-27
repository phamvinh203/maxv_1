<?xml version="1.0" encoding="utf-8"?>
<dir table="dmkcgv" code="stt" order="stt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="bút toán kết chuyển giá vốn" e="Gross Transfer Declare"></title>
  <fields>
    <field name="stt" isPrimaryKey="true" type="Decimal" allowNulls="false" dataFormatString="##0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_bt" allowNulls="false">
      <header v="Tên bút toán" e="Description"></header>
      <items style="Mask"/>
    </field>
    <field name="loai_kc" dataFormatString="1 ,2, 3" clientDefault="1" align="right" inactivate="false" >
      <header v="Loại kết chuyển" e="Closing Type"></header>
      <footer v="1 - Tk có sang tk nợ, 2 - Tk nợ sang tk có, 3 - Lãi hoặc lỗ" e="1 - Cr.Account to Dr.Account, 2 - Dr.Account to Cr.Account, 3 - Profit or Loss"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_no" allowNulls="false">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="status = '1'" check="" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_co" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="status = '1'" check="" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>


    <field name="kc_vv_yn" type="Boolean">
      <header v="Dự án" e="Job"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA11P4LYlAafL5oApp5IzGV5LSs2Md97NAJcHuss9xaoWHEjDVM6IYhPrvWtzi65Jnkg==</encrypted>]]></clientScript>
    </field>


    <field name="kc_bp_yn" type="Boolean">
      <header v="Phòng ban" e="Department"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA11P4LYlAafL5oApp5IzGV5LSs2Md97NAJcHuss9xaoWHEjDVM6IYhPrvWtzi65Jnkg==</encrypted>]]></clientScript>
    </field>

    <field name="kc_hd_yn" type="Boolean">
      <header v="Hợp đồng" e="Contract"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA11P4LYlAafL5oApp5IzGV5LSs2Md97NAJcHuss9xaoWHEjDVM6IYhPrvWtzi65Jnkg==</encrypted>]]></clientScript>
    </field>


    
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="20, 100, 25, 5, 45, 25, 100, 25, 25, 35, 120, 25"/>
      <item value="1010: [stt].Label, [stt]"/>
      <item value="101000000000: [ten_bt].Label, [ten_bt]"/>
      <item value="101010000000: [loai_kc].Label, [loai_kc], [loai_kc].Description"/>
      <item value="101000100000: [tk_no].Label, [tk_no],[ten_tk_no%l]"/>
      <item value="101000100000: [tk_co].Label, [tk_co],[ten_tk_co%l]"/>

     
      <item value="100000000000: [kc_vv_yn].Description"/>

      <item value="-11---: [kc_vv_yn].Label, [kc_vv_yn]"/>
      <item value="-11---: [kc_hd_yn].Label, [kc_hd_yn]"/>
      <item value="-11---: [kc_bp_yn].Label, [kc_bp_yn]"/>

      <item value="-10000000: [kc_vv_yn].Description"/>
      <item value="101010000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ki+sGdPbkoV7oTSsjJiz4lBZ9VGc5K0uZXh8OejJ10U2pFVr98yvZxtsDB71aoCvL4KGZsTkEe/vZlTi8FTVw8c=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ZdgZVtCxIvdtWZN8liODwA9RkcFcyMZcKN8L0qv6PoBRXhQ8j2onFNdUcmxWxhx41j4w8xOdQD3KARnR2CACF7p9I3AFUadl6ptlDZNxITX</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>voflL+bNCrcW0m53FQbsHHVjkV8wD0uvnhLSiVJUk5nbE+HJyAjUIJ5tU7Nq1khOF59DeuZKAn3Vsfli3DFBz/o6tHUVaEChy/dtMh/eK5YkClLTwOaMT8igRkNu/wV8TaNZpc5LGQriEBp1Ng2FEdIZZVwapk1qYi9oah615UQb5Gza93gxm4zTvmA7OyISRRelvmnsQ/bCcRMOhJy+s1X0G8FTBO3W7Qy3N9d8WNUEuDMGQ5CASmYBeNu3OnflVSxm97XzNp29gVS0ARZlwD5xFNjdOO8OVIb3L/mymOAaxh9DO53tD4I/1UCZ7eo1BuHWySi2EL1PqpGwJs0euVz8xOUutyMzGLSABHLdBKKXeTDKSZSyd0V2GBQCoNcMBb/As1Fp5PnEPBJ98nLuRZD0Vy7F7IE0i/zqs3zR2t7TGHEKJFeEt9glDq7PlHK03F+qPFb+3+2ogASyygkCgg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>ri+364tP+6LHPexV+72EVbb4DQ3t2V3vWl08wTweoaFllSJasTN4ZpUdkV0N6a3SJpMY3SMJxQufPODt5Sn6ArigOvL+OagY7d7E0YM1vTHRSuqzOASIAArx2Upx+0wtUDyHC3LHoTy8gSOO4Lben0D2O6T2D4XUma8EMLYVlu7pcai8/7czoQY13ojXcB3akztC5ZQmRrxEG7gzdyCO/XU3V/pvjrbLk6uNn66M8gSxjwPJzXSSgeaT/LZvjXo/</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>OC62At2yl94TwmKLC+a+aj5ogQI1Tf95vqbZXC+7sQAT9c6SHXgtzknRX502+eeXz1eMlYs8Imy/u+oXL4LOLGJWsa8AXiqeWncTyhyh6zBpOxiZRDP4ogV0m4Gs5keenpYEAy7Dc/UqCHsmZ5+3pr+43z/tX+GnHwcdagt6gsytQpVyi7aLCRxVqehhY6gSbmwyoqzWnJNjXpAphvb+OBXsI1GMP7SXfC6x8tKPlHLhJLutCsY0Xi94/os5IdfUUVx/qmf3CQyywWfO4pAl8Q==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILaONaightS9Ys6VGt40B9e/UCKopUYaHmgZu6/2gGUct</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>zQBRxwh1pw+LOJX0xNCsTWhtk/4yWyG72UDqStbEGTExZNN1WsH6AVeLRu+iS9cgNAOB24YHWN+kVXDgqIlxg/ktwYNDbMq7zyZNiFAwGh5q17kNX3sYtOQ482xk7SizIUG/U9LyZ7TUwLjisU8DZf37thjoB1QH5UR1/CfbHQ02MtJV3qtKC5gya8AxOA7KHDtl0yLOpM0Gc+JEcovgm7Gx467C4sujudVe65TxBIBUeqbtAuaq25zd1m54zvMw</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>YaXthurMkhLeHVcyHI7oYobBnDP55wXFYf4uoqJk4jD8R0nx+RXHFnHmPpUWzdXxYl3NQ2cUN25cwn1ebuRSrhBHxulus91yNOffbry40PsGLzO7H6uEAcSrC2suARH7vj/VtEiIlfUPgcct0F3tk4pZ02BJU4fLoK3GEJ43TUZOqaw7IzCOntbs4crgCDlGJmsXNT3eY2R6Hap4JPoMozWNj/KFqQFvG7++a4qIg/E=</encrypted>]]>
    </text>
  </css>
</dir>


