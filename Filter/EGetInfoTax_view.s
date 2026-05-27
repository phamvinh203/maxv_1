<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="ethongtindn" code="mst" order="mst" xmlns="urn:schemas-maxv-com:data-dir">

  <title v="Xem thông tin doanh nghiệp" e="Company Information"></title>
  <fields>
	<field name="mst" clientDefault="Default">
      <header v="Mã số thuế" e="Taxcode"></header>
    </field>
	
	<field name="ten_cong_ty" clientDefault="Default" >
      <header v="Tên công ty" e="Company Name"></header>
    </field>
	
	<field name="dia_chi" clientDefault="Default">
      <header v="Địa chỉ" e="Address"></header>
    </field>
	<field name="nguoi_dai_dien" clientDefault="Default">
      <header v="Người đại diện" e="Representative"></header>
    </field>
	<field name="quan_ly_boi" clientDefault="Default">
      <header v="Cơ quan thuế quản lý" e="Management tax agency"></header>
    </field>
	<field name="ngay_hoat_dong">
      <header v="Ngày thành lập" e="Date Establishment"></header>
    </field>
	<field name="tinh_trang">
      <header v="Tình trạng" e="Status"></header>
    </field>
	<field name="nganh_nghe_chinh" rows="5">
      <header v="Ngành nghề chính" e="Main Bussiness"></header>
    </field>
	
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 80, 50, 120, 80, 180,10"/>
	  <item value="110:[mst].Label, [mst]"/>
	  <item value="110000:[ten_cong_ty].Label, [ten_cong_ty]"/>
	  <item value="110000:[dia_chi].Label, [dia_chi]"/>
	  <item value="110000:[nguoi_dai_dien].Label, [nguoi_dai_dien]"/>
	  <item value="110:[ngay_hoat_dong].Label, [ngay_hoat_dong]"/>
	  <item value="110000:[quan_ly_boi].Label, [quan_ly_boi]"/>
	 
	  <item value="110000:[tinh_trang].Label, [tinh_trang]"/>
	  <item value="110000:[nganh_nghe_chinh].Label, [nganh_nghe_chinh]"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fV8Db63cIL6Wa9pQWQxqQ5c270Lyday4oS85jUTh7MILz7PtlSlgzHpqfpLQ9EtdC+6oFCHdSwXB+fY7U1LofI=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f1h8IuHH30pVWY0Ih8jlSK4GR23//r9+Df1x7Rxvy4fUaWT5nIzqqYkQ+lL+LaUs6TURi0Gn0dfVR8nYIBwr0Y=</encrypted>]]>
      </text>
    </command>

  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>mp+sEBDII2sgq68mZq3aamvxxCmt84G2+iocSoHh3CzLSDe0v/Q/WsBFx0M7E7LL86IaCm0xeO+e3pp5luV6PL/mQH0QN3F0tCnK6INJCNZpOesEuaSKg6GjHC3K2dAT/5d5v6PRQyd+yiblGXO0iuR9OkdHYsHECu5SAfPm+CxLLXd93Pk2v89odpnP1WIQpY263DS71eK03PQnMqtvA8tjeTY+99EZTkbkRjFNolSHUzQ/MvYECwd6GN1u2pjgEpTXysJ5s8QFIWdNajDqjGP7H6/kOvf9bXpvYAyTdhyx1YwSHzE4N5bsOteigHhdM4JM+WcS9B8e4z2QDK5L0ajB5wiw38u9CZD1mqtJoeD0D1uk9zftVS2WtpxzWDO0Y9va0gDsKw/X2miqwd+B3DkIduBvYw1UJF1YjuO3PBQtgbv9rUlH9WmAU1F5kPfPLJv7Kgk/YIBCusY/20U/FamZqYZuV2slyXsXf04pnec0YGpDxtCToHxB3U62OPYL+Ns7n6zt4uAGE15eYtUCX7PF5fKil+o1D8L3o5mY2HVT7K66exG6uuCs7FHKU/5w</encrypted>]]>
    </text>
  </script>

</dir>


