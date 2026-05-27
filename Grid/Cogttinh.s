<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
	<!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
	<!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
	<!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
	<!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">
	<!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
	<!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid table="v20vctgt" code="buoc" order="buoc" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="Tính giá thành sản phẩm" e="Calculate Cost of Product"></title>
	<subTitle v="Cập nhật các bước tính toán: thêm, sửa, xóa..." e="Add New, Edit, Delete Calculate Step..."></subTitle>

	<fields>
		<field name="tag" type="Boolean" width="60" defaultValue="0" filterSource="Tag">
			<header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
			<clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
		</field>
		<field name="buoc" isPrimaryKey="true" width="60">
			<header v="Bước" e="Step"></header>
		</field>
		<field name="stored" width="0" hidden="true" readOnly="true">
			<header v="Tệp thực thi" e="Execute"/>
		</field>
		<field name="stored_name%l" width="250" readOnly="true">
			<header v="Chương trình" e="Description"/>
		</field>
		<field name="ma_gd" width="80" readOnly="true">
			<header v="Mã giao dịch" e="Trans. Code"/>
		</field>
		<field name="ma_bp" width="80" readOnly="true">
			<header v="Bộ phận" e="Dept."/>
		</field>
		<field name="loai_yt" width="80" readOnly="true">
			<header v="Loại yt" e="Factor Type"/>
		</field>
		<field name="ma_yt" width="80" readOnly="true">
			<header v="Mã yt" e="Factor"/>
		</field>
		<field name="nhom_kho" width="80" readOnly="true">
			<header v="Nhóm kho" e="Site Group"/>
		</field>
		<field name="loai_vt" width="80" readOnly="true">
			<header v="Loại vt" e="Item Type"/>
		</field>
		<field name="tao_pxcl" width="80" readOnly="true">
			<header v="Tạo pxcl" e="Cr. Imbalance Issues"/>
		</field>
		<field name="tk_cl" width="80" readOnly="true">
			<header v="Tk chênh lệch" e="Imbalance Account"/>
		</field>
	</fields>

	<views>
		<view id="Grid">
			<field name="tag"/>
			<field name="buoc"/>
			<field name="stored"/>
			<field name="stored_name%l"/>
			<field name="ma_gd"/>
			<field name="ma_bp"/>
			<field name="loai_yt"/>
			<field name="ma_yt"/>
			<field name="nhom_kho"/>
			<field name="loai_vt"/>
			<field name="tao_pxcl"/>
			<field name="tk_cl"/>
		</view>
	</views>

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
		<button command="View">
			<title v="Toolbar.View" e="Toolbar.View"></title>
		</button>
		<button command="Calc">
			<title v="Tính" e="Calculate"></title>
		</button>
		
		<button command="Freeze">
			<title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
		</button>
	</toolbar>

	<css>
		<text>
			<![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlsW0AjXhxqF99a1gTZbDXMVWjOFL3zbk7ogcUV96VdNyo4K/0kak5azRoEMXHJY5oUVJ3B9ezEp/MU6of+dhEHyPODrsQNOms4ew6GKlAwswRJcpqEPz6QkZ5tR47sLpcq5viS6BS2q3JaQOqYyXzWI=</encrypted>]]>
		</text>
	</css>
	
	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7YYA9+XZfR6P1K1fku0D/HqMBlNb+YsJtzdF7mhaQR5dvziIzl6KQgOG0c1P2Y/8LBcR3yIZKsD2B1irxBxHACORx/93JXTJhzH0MePZr95V</encrypted>]]>
			</text>
		</command>
		
		<command event="Closing">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7eJqdIhJ+HcJL0wagazhWXvO27B+OnKQ0zPU6xdMWO6x8Pf2d7nDncXFHhDSfRpA2L1PUpQEY6AABS06OHHHdzyEfLZKEksjJYhJbMut6HHj</encrypted>]]>
			</text>
		</command>
		
		<command event="Scattering">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7dFRp2e/qftj/5f9bId98R1P5bcMDazIpprzsPt9k5lS2OemN5d1jZ7w1dER0Nd7Embod+kdtjaKR0wsknTc/No=</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>QZ9OameuSB36sqMebVbMOQzVNcpMihN5hvm2eOCJ2i+5F1P8WGKWSsiUArAh/QQw80fzYUObAIpEkOGlnJVoWpH+hsCdAt0b+hEiUdQ/JymsY+nAi22HuTIvZ5mOC7JK2beT/KLmZQs1QtAW0YjHLKcRJsJddJX1XYZX+vx01x2f9OXsCXbt3skH3gqMkPRX4jXg0mcPhrPVphsOeW47wFtDXsvhfOAw+NBFL3phVCHu9wgawI9PFy7cqF8479wQ/Rqu4rg5QVZl+Swjqk37R1Auz0ncpL8fhpxzUD2+DwMsfJgJ43RCznQgXToMG5Nv1jDNd9CfzR/yxSaE0Y3n7FVfNlhZLtZmVyyDl3V/nXOfFx+zUo9FmBdpIHQoydziKEqgszOEGqUBZHK12rUp80YrQTffar0ENXTcxGbvtjAmFMrVU6qtBY3QxBzHw1ZESQ8mfZKflVbP3T3JXh0qEln1dyOrXeUh1O4KkbC0AcRoqnLS7cVAssKHp82ON6IywrOx1W1Oz61Sk4jvJRWCWJxjCIso2nnKUE1frl0jD4vucdYx9MXwayD2nMSNqA5/iy05fnsboZznhDR/OuVFgPHwhMgjuBbbl/U9uf6BCV/FXNE5DtZVdw4glaSpnOlruI0LS9KluzylTBto/BMG0kdRffIjctUhh7DR7cZtPMT/g3EvbpK8niIV0gggA04pza5HMp2LsDFd5hbwhcrifMdXO1Ogx4QAdfh38soYmN9VoQSrndQlBoD6LGdxBAkxrrBr38cifrBBZgEQJ5udQA==</encrypted>]]>
			&JavascriptReportInit;
			&ScriptTagReport;
		</text>
	</script>
</grid>
