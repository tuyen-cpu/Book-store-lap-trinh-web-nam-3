create database BookStore;
go
use BookStore;
go
create table Account(
UserName varchar(30) primary key,
MatKhau varchar(100) not null,
Quyen int,
TrangThai bit
)
go
create table KhachHang(
MaKH int IDENTITY(1,1)primary key not null,
HoTen nvarchar(50) ,
UserName varchar(30) FOREIGN KEY REFERENCES dbo.Account(UserName),
Email varchar(100),
SDT varchar(100),
DiaChi nvarchar(200),
GioiTinh nvarchar(3),

)
go

create table ChuDe(
MaChuDe varchar(50) primary key not null,
TenChuDe nvarchar(50) not null

)

create table NhaXuatBan(
MaNXB varchar(50) primary key not null,
TenNXB nvarchar(50) not null,
DiaChi nvarchar(200),
DienThoai varchar(50) 
)

create table TacGia(
MaTacGia int IDENTITY(1001,1) primary key not null,
TenTacGia nvarchar(50) ,
DiaChi nvarchar(200),
TieuSu nvarchar(MAX) ,
DienThoai varchar(50) 

)

create table Sach(
MaSach int IDENTITY(1001,1) primary key not null,
TenSach nvarchar(50) ,
GiaBan float, 
Mota nvarchar(MAX) ,
Anh nvarchar(50) ,
NgayCapNhat datetime ,
SoLuong int ,
MaNXB varchar(50) ,
MaChuDe varchar(50) ,
GiamGia float ,
TrangThai bit,
CONSTRAINT Sach_FK1
		   FOREIGN KEY (MaChuDe)
		   REFERENCES ChuDe (MaChuDe),
CONSTRAINT Sach_FK2
		   FOREIGN KEY (MaNXB)
		   REFERENCES NhaXuatBan (MaNXB)
)
create table VietSach(
MaSach int not null,
MaTacGia int not null,
VaiTro nvarchar(50) ,
Vitri nvarchar(50) ,
CONSTRAINT VietSach_PK PRIMARY KEY (MaSach, MaTacGia),
CONSTRAINT VietSach_FK1
		   FOREIGN KEY (MaTacGia)
		   REFERENCES TacGia (MaTacGia),
CONSTRAINT VietSach_FK2
		   FOREIGN KEY (MaSach)
		   REFERENCES Sach(MaSach)



)
create table DonHang(
MaDonHang int IDENTITY(1,1) primary key not null,
DaThanhToan int ,
TinhTrangGiaoHang int ,
NgayDat datetime ,
NgayGiao datetime ,
MaKH int ,
CONSTRAINT DonHang_FK
   FOREIGN KEY (MaKH)
   REFERENCES KhachHang (MaKH)
)

create table ChiTietDonHang(
MaDonHang int  not null,
MaSach int not null,
SoLuong int ,
DonGia float ,
CONSTRAINT CTDH_PK PRIMARY KEY (MaDonHang, MaSach),
CONSTRAINT CTDH_FK1
		   FOREIGN KEY (MaDonHang)
		   REFERENCES DonHang (MaDonHang),
CONSTRAINT CTDH_FK2
		   FOREIGN KEY (MaSach)
		   REFERENCES Sach (MaSach)
)


insert into Account values('admin','123', 1,1)

insert into NhaXuatBan values('1001',N'Nhà xuất bản Kim Đồng',N'55 Quang Trung, Hai Bà Trưng, Hà Nội','0337734098')
insert into NhaXuatBan values('1002',N'Nhà xuất bản Trẻ',N'161B Lý Chính Thắng, Phường 7, Quận 3, Thành phố Hồ Chí Minh.','0337709098')
insert into NhaXuatBan values('1003',N'Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh',N'62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM','0337734012')
insert into NhaXuatBan values('1004',N'Nhà xuất bản chính trị quốc gia sự thật',N'Số 6/86 Duy Tân, Cầu Giấy, Hà Nội;','0337734066')
insert into NhaXuatBan values('1005',N'Nhà xuất bản giáo dục',N' 81 Trần Hưng Đạo, Hà Nội','0337734079')
insert into NhaXuatBan values('1006',N'Nhà xuất bản Hội Nhà văn',N'Số 65 Nguyễn Du, Hà Nội','0337734004')

insert into ChuDe values('cdKT',N'Kinh Tế')
insert into ChuDe values('cdVH',N'Văn Học')
insert into ChuDe values('cdLT',N'Lập Trình')
insert into ChuDe values('cdKH',N'Khoa Học')
insert into ChuDe values('cdTruyen',N'Truyện')
insert into ChuDe values('cdNN',N'Nước Ngoài')

insert into TacGia(TenTacGia) values(N'Daron')
insert into TacGia(TenTacGia) values(N'Maktaoum')
insert into TacGia (TenTacGia)values(N'SonHongBing')
insert into TacGia(TenTacGia) values(N'Dan Senor')
insert into TacGia(TenTacGia) values(N'Deaton')
insert into TacGia(TenTacGia) values(N'Thaler')
insert into TacGia (TenTacGia)values(N'Friedman')
insert into TacGia(TenTacGia) values(N'Dan Ariely')
insert into TacGia (TenTacGia)values(N'John Perkins')
insert into TacGia(TenTacGia) values(N'Steven D.Levitt')
insert into TacGia(TenTacGia) values(N'Pride')
insert into TacGia (TenTacGia)values(N'Nicholas Sparks')
insert into TacGia(TenTacGia) values(N'Jane Eyre')
insert into TacGia (TenTacGia)values(N'Jojo Moyes')
insert into TacGia (TenTacGia)values(N'John Green')
insert into TacGia (TenTacGia)values(N'Audrey Niffenegger')
insert into TacGia (TenTacGia)values(N'Margaret Mitchell')
insert into TacGia(TenTacGia) values(N'Graeme Simsion')
insert into TacGia (TenTacGia)values(N'Colleen McCullough')
insert into TacGia(TenTacGia) values(N'Jenny Hàn')
insert into TacGia(TenTacGia) values(N'Rosie Dickins')
insert into TacGia(TenTacGia) values(N'Phạm Huy Hoàng')
insert into TacGia(TenTacGia) values(N'Jeff Atwood')
insert into TacGia (TenTacGia)values(N'Nguyễn Bảo Thùy')
insert into TacGia (TenTacGia)values(N'Ray Harris')
insert into TacGia(TenTacGia) values(N'Phạm Phương Hoa')
insert into TacGia(TenTacGia) values(N'Trương Thị Ngọc Phượng')
insert into TacGia (TenTacGia)values(N'Nguyễn Xuân Huy')
insert into TacGia(TenTacGia) values(N'Nguyễn Thị Hậu')
insert into TacGia (TenTacGia)values(N'Simon Singh')
insert into TacGia (TenTacGia)values(N'Richard Wiseman')
insert into TacGia (TenTacGia)values(N'Melanie Barnum')
insert into TacGia (TenTacGia)values(N'Anna Marianis')
insert into TacGia (TenTacGia)values(N'Brian L. Weiss')
insert into TacGia (TenTacGia)values(N'TADA Project')
insert into TacGia (TenTacGia)values(N'Sherwin B. Nuland')
insert into TacGia (TenTacGia)values(N'Alexandra David Neel')
insert into TacGia (TenTacGia)values(N'Dr Penny Sartori')
insert into TacGia (TenTacGia)values(N'Dalai Lama')
insert into TacGia (TenTacGia)values(N'Tiêu Tường Ngân')
insert into TacGia (TenTacGia)values(N'Vân Tình')
insert into TacGia (TenTacGia)values(N'Hiểu Tường')
insert into TacGia(TenTacGia)values(N'Kara King')
insert into TacGia (TenTacGia)values(N'Hương Nguyên')
insert into TacGia (TenTacGia)values(N'Michelle')
insert into TacGia (TenTacGia)values(N'Lois P. Frankel')
insert into TacGia (TenTacGia)values(N'Karren Karbo')
insert into TacGia(TenTacGia) values(N'Ivanka Trump')
insert into TacGia(TenTacGia) values(N'Maud Guillaumin')
insert into TacGia (TenTacGia)values(N'Sheryl Sandberg')
insert into TacGia (TenTacGia)values(N'Mario Puzo')
insert into TacGia (TenTacGia)values(N'J.R.R Tolkien')
insert into TacGia (TenTacGia)values(N'F. Scott Fitzgeralo')
insert into TacGia (TenTacGia)values(N'Winston Groom')
insert into TacGia (TenTacGia)values(N'Jeffrey Archer')
insert into TacGia (TenTacGia)values(N'Ayn Rand')
insert into TacGia (TenTacGia)values(N'Colleen McCullough')
insert into TacGia (TenTacGia)values(N'Thomas Harris')
insert into TacGia (TenTacGia)values(N'Jonas Jonasson')
insert into TacGia (TenTacGia)values(N'Harper Lee')



insert into Sach (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values( N'Tại Sao Các Quốc Gia Thất Bại', 70000, N'Sử dụng lịch sử Đông-Tây kim-cổ đã diễn ra trên tất cả các châu lục của trái đất này, hai tác giả lập luận rằng những quốc gia thất bại là những đất nước bị cai trị bởi một nhóm quyền thế tập trung, và những nhóm này đã tổ chức xã hội để phục vụ cho quyền lợi riêng của họ trong khi đại đa số quần chúng nhân dân phải trả giá. Thế lực chính trị bị tập trung trong một nhóm nhỏ, được sử dụng để tạo ra tài sản khổng lồ cho những người nắm giữ quyền lực.',N'hinh1.jpg',2,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Tầm Nhìn Thay Đổi Quốc Gia', 80000, N'Từ một Tiểu quốc có nhiều người dân chết đói trong một nền kinh tế kiệt quệ, Dubai vụt nổi lên như một hiện tượng thành công vượt trội và được cả thế giới ngưỡng mộ. Chỉ trong 20 năm, với dân số khoảng 2 triệu người trên một diện tích 4.000 km2, Dubai đã phát triển thần kỳ, trở thành một thành phố toàn cầu và là một trung tâm kinh tế của thế giới với các với các trung tâm tài chính, công nghệ thông tin, du lịch, cảng biển, bất động sản, các công trình đồ sộ bậc nhất thế giới: The Palm – quần đảo nhân tạo lớn và đẹp nhất thế giới; Burj Khalifa – tòa nhà cao nhất thế giới; Jebel Ali – cảng nước sâu nhân tạo lớn nhất thế giới,…',N'hinh2.jpg',10,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Chiến Tranh Tiền Tệ',90000,N'“Chiến tranh tiền tệ” đề cập đến một cuộc chiến khốc liệt, không khoan nhượng và dai dẳng giữa một nhóm nhỏ các ông trùm tài chính – đứng đầu là gia tộc Rothschild – với các thể chế tài chính kinh tế của nhiều quốc gia. Đó là một cuộc chiến mà đồng tiền là súng đạn và mức sát thương thật là ghê gớm. Một cuốn sách thực sự làm sửng sốt với những ai muốn tìm hiểu về bản chất tiền tệ để từ đó nhận ra những hiểm hoạ tài chính tiềm ẩn nhằm chuẩn bị tâm lý cho một cuộc chiến tiền tệ “không đổ máu”.', N'hinh3.jpg',8,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values( N'Quốc Gia Khởi Nghiệp',80000,N'Với ngòi bút sắc sảo, phong phú và tập trung những lời nhận xét thực tế từ những doanh nhân thành công hàng đầu, “Quốc gia khởi nghiệp” đã đem đến những cái nhìn mới mẻ về con người và đất nước Israel, làm sáng tỏ phần nào những thành công tưởng chừng như không tưởng của đất nước nhỏ bé này. Cá tính quyết liệt, dám thách thức và sáng tạo không ngừng của những con người Do Thái lưu vong, chạy trốn và sống sót sau những cuộc thảm sát trong Chiến tranh thế giới thứ II, không cam chịu cuộc sống nghèo khó, họ đã cùng với những người theo Chủ nghĩa Phục quốc Do Thái gây dựng và bảo vệ đất nước Israel bằng chính sức lực của mình và khiến cả thế giới phải kinh ngạc.',N'hinh4.jpg',12,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Cuộc Đào Thoát Vĩ Đại',90000,N'Trong Cuộc đào thoát vĩ đại, Angus Deaton – một trong những chuyên gia đầu ngành nghiên cứu về phát triển kinh tế và đói nghèo – kể một câu chuyện bắt đầu từ 250 năm trước, khi một phần thế giới thực hiện bước nhảy vọt, tạo ra khoảng cách với phần còn lại.Deaton xoáy sâu vào những mẫu hình quốc gia thịnh vượng cả trong quá khứ lẫn hiện tại, nhấn mạnh sự cần thiết phải giúp đỡ những nước bị bỏ lại phía sau. Deaton chỉ ra rằng những phát kiến của nhân loại như thuốc kháng sinh, phòng trừ sâu bệnh, tiêm chủng và nước sạch chỉ tiếp cận được một phần nhân loại có điều kiện tiếp cận chúng; trong khi nghèo đói là bạn đồng hành của các đại dịch như HIV/AIDS.',N'hinh5.jpg',10,1001,'cdKT')
insert into Sach (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe) values(N'Cú Hích',70000,N'Ông Thaler cũng đặt ra thuật ngữ “cú hích” (nudge), ý chỉ các tác động cần thiết để giúp con người vượt qua định kiến, loại bỏ thói quen làm theo người khác để tránh phạm lầm ngớ ngẩn khi phải đưa ra quyết định. “Mỗi ngày, chúng ta thực hiện đủ loại quyết định, nhưng đáng tiếc là chúng ta thường có những lựa chọn tồi tệ (…). Lý do là vì con người dễ bị tác động bởi nhiều định kiến khác nhau, mà lắm lúc chúng làm ta trở nên thật ngớ ngẩn (…). Người ta cần những cú hích trước những quyết định khó khăn và hiếm khi xảy ra, mà hiện thời họ không có đủ thông tin” – lời giới thiệu của quyển sách viết.',N'hinh6.jpg',10,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Thế Giới Phẳng',50000,N'Chúng ta đã quen với những tác phẩm kinh điển trong văn học, nghệ thuật nhưng “Thế Giới Phẳng”, theo tôi là một tác phẩm kinh điển về thế kỷ 21 trong lĩnh vực kinh tế, chính trị và sự vận động của thế giới. Đây không phải là một cuốn sách lịch sử thế giới mà là một tác phẩm hoành tráng về thế giới trong thế kỷ 21, thế kỷ của bùng nổ công nghệ số và xu hướng toàn cầu hóa. Tác giả đã làm phẳng thế giới khi bỏ qua những rào cản về địa giới, văn hóa, tôn giáo… để nói về một thế giới với những vấn đề chung, những cơ hội và thách thức của các quốc gia, của toàn thế giới.',N'hinh7.jpg',8,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Phi Lý Trí',60000,N'Bạn sẵn sàng rút 2 nghìn đồng cho một người ăn mày nghèo khổ trên đường. Nhưng cũng chính bạn lại cò kè từng 2 nghìn bạc với bà đồng nát khi bán mớ báo cũ trong nhà. Bạn sẵn sàng bỏ ra 10 triệu để chụp bộ ảnh cưới thật đẹp mà chỉ xem một vài lần rồi cất vào tủ. Nhưng chắc chắn bạn sẽ rất cân nhắc và suy tính cẩn thận khi quyết định mua một chiếc máy ảnh với giá 10 triệu trong khi bạn có thể dùng nó nhiều năm liền.',N'hinh8.jpg',12,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Lời Thú Tội Của Một Sát Thủ Kinh Tế',10000,N'John Perkins hẳn là phải rõ – ông đã từng là một kẻ sát thủ kinh tế. Công việc của ông là thuyết phục các nước có tầm quan trọng mang tính chiến lược đối với Mỹ – từ Inđônêxia cho đến Panama – chấp nhận vay những khoản tiền khổng lồ để phát triển cơ sở hạ tầng và đảm bảo rằng, các tập đoàn Mỹ thầu sẽ thắng thầu những dự án béo bở đó. Bị chất chồng bởi gánh nặng nợ nần, các nước này phải chịu sự kiểm soát của Chính phủ Mỹ, Ngân hàng Thế Giới và các tổ chức viện trợ khác mà Mỹ có ưu thế, họ như những kẻ cho vay nặng lãi – tự định đoạt các điều khoản trả nợ và ép chính phủ các nước phải quy phục.',N'hinh9.jpg',13,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Kinh Tế Học Hài Hước',120000,N'Nói đến kinh tế học, người ta thường coi đây là một ngành khoa học ít nhiều khá khô khan, thường liên quan đến các con số, các khuôn mẫu hay chỉ đơn thuần là tiền bạc, tài chính. Ngay cả những người được giải Nobel kinh tế cũng ít khi được dư luận quan tâm như những người được giải Nobel Hoà bình, văn học hay vật lý. Kinh tế học dường như là một ngành khoa học quá hàn lâm, quá phức tạp, quá xa với thế giới thực, một thừ gì đó mà người ta chỉ có thể quan sát từ xa chứ ít khi tham gia trực tiếp.',N'hinh10.jpg',14,1001,'cdKT')



insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Kiêu Hãnh Và Định Kiến',50000, N'Khắp làng trên xóm dưới Herfordshire xôn xao: Netherfield sắp có người thuê, mà còn là một quý ông chưa vợ với khoản lợi tức lên đến năm nghìn bảng mỗi năm. Chao ôi, quả là tin đáng mừng đối với gia đình ông bà Bennett, vốn có tới năm cô con gái cần phải gả chồng. Giữa những quay cuồng vũ hội cùng âm mưu toan tính của cả một xã hội ganh đua nhau tìm tấm chồng tốt cho các cô gái, nổi lên câu chuyện tình của cô con gái thứ cứng đầu Elizabeth và chàng quý tộc Darcy – nơi lòng Kiêu hãnh phải nhún nhường và Định kiến cần giải tỏa để có thể đi đến kết cục hoàn toàn viên mãn.',N'hinh11.jpg', 20, 1002, 'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Nhật Ký', 40000,N'Allie là cô con gái nhà giàu nhân kỳ nghỉ hè theo gia đình về vùng quê yên tĩnh. Tại đây cô tình cờ gặp một chàng trai non trẻ nhưng yêu Allie ngay từ lần đầu trông thấy nàng. Noah – tên chàng trai – dáng thư sinh, hiền hòa và bộc trực. Anh khiến Allie buộc phải chú ý đến mình khi nhảy ào lên đu quay, đòi buông tay té xuống đất nếu như Allie không chịu đồng ý lời mời đi chơi với chàng. Chuyện tình của đôi trẻ mới lớn bắt đầu với tất cả sự trong sáng và thơ mộng cho đến khi gia đình Allie không đồng ý vì những chênh lệch về tuổi tác, địa vị xã hội. Noah ôm nỗi tự ái, đau đớn rời xa người yêu trong khi Allie vẫn nhất mực yêu chàng.',N'hinh12.jpg',18,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Jane Eyre',30000,N'Jane Eyre là cuốn tiểu thuyết nổi tiếng của nữ tác giả người Anh Charlotte Bronte thế kỷ 19. Tác phẩm nói về cuộc đời của một người con gái nghèo tỉnh lẻ đã kiên cường vật lộn với số phận phũ phàng để bảo vệ phẩm giá và tự khẳng định vị trí xã hội của mình bằng cuộc sống lao động lương thiện.Với văn phong trữ tình, kết hợp hài hòa giữa chủ nghĩa nhân văn, hiện thực lãng mạn, bút pháp tinh tế điêu luyện, tác giả đã tạo cho tiểu thuyết một sức sống mạnh mẽ, sức cuốn hút thi vị và một vẻ đẹp thơ mộng.',N'hinh13.jpg',18,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Trước Ngày Em Đến',70000,N'Cô biết từ trạm xe buýt đến nhà có bao nhiêu bước chân. Cô ý thức được rằng mình thích làm việc trong quán cà-phê Bánh Bơ, cũng như cô không còn yêu gã bạn trai Patrick nữa. Điều Lou không thể nào ngờ tới chính là cô sắp bị mất việc và sắp sửa phải đối diện với một chuyện kinh hoàng.Will Traynor thì thừa hiểu tai nạn mô-tô đã cướp đi mọi ước muốn sống của anh. Anh biết rằng mọi thứ trong cuộc đời này chẳng có ý nghĩa gì, cũng như niềm vui là một thứ gì đó ở đâu đâu ngoài tầm với. Anh còn biết được làm cách nào để đặt dấu chấm hết cho tất cả những điều này.',N'hinh14.jpg',17,1002,'cdVH')
insert into Sach (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe) values(N'Khi Lỗi Thuộc Về Những Vì Sao',100000,N'Mặc dù phép màu y học đã giúp thu hẹp khối u và ban thêm vài năm sống cho Hazel nhưng cuộc đời cô bé đang ở vào giai đoạn cuối, từng chương kế tiếp được viết theo kết quả chẩn đoán. Nhưng khi có một nhân vật điển trai tên là Augustus Waters đột nhiên xuất hiện tại Hội Tương Trợ Bệnh Nhi Ung Thư, câu chuyện của Hazel sắp được viết lại hoàn toàn. Sâu sắc, táo bạo, ngang tàng, và thô ráp, Khi lỗi thuộc về những vì sao là tác phẩm thương tâm và tham vọng nhất của John Green, tác giả của những giải thưởng, nhưng đồng thời lại khám phá một cách khéo léo nét hài hước, li kỳ, và bi thảm của việc sống và việc yêu.',N'hinh15.jpg',16,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Vợ Người Du Hành Thời Gian',60000,N'Henry DeTamble mang trên mình một gen lạ, nó khiến anh có thể du hành thời gian. Rắc rối ở chỗ anh không thể tự chủ được thời gian và địa điểm đến. Tệ hơn, khi du hành, anh không thể mang theo bất cứ thứ gì. Bởi vậy, phần lớn thời giờ trong cuộc sống của anh là trần truồng, chạy trốn, ăn trộm quần áo, thức ăn, tiền bạc, đánh lộn, chống lại cảnh sát… Đó là chuỗi dài những tháng ngày bi kịch, bị đau đớn và dằn vặt cả về tâm hồn lẫn thể xác, anh trượt dài trong những ký ức đau buồn về cái chết của mẹ, về sự tuột dốc của cha và về sự kỳ dị lạc loài của chính mình. Anh hoàn toàn chán nản và tuyệt vọng.',N'hinh16.jpg',15,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Cuốn Theo Chiều Gió',70000,N'Lấy bối cảnh từ cuộc nội chiến vô cùng khốc liệt giữa Bắc và Nam Mỹ, Cuốn Theo Chiều Gió với cốt truyện rõ ràng, logic, dễ hiểu, đã khắc họa một cách tài tình tâm trạng, tính cách và thân phận của nhiều lớp người trong chiến tranh và thời hậu chiến. Nhân vật chính của tiểu thuyết là cô gái Scarlett O’hara cùng với Rhett Butler trở thành cặp nhân vật điển hình, thuộc loại thành công nhất trong văn học Hoa Kỳ.',N'hinh17.jpg',14,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Dự Án Rosie',80000,N'Tình yêu chưa bao giờ là một dạng thức khoa học chính xác. Tuy nhiên, có một người muốn chứng minh điều ngược lại. Chàng là Don Tillman, nhà di truyền học đẹp trai, năng lực trí tuệ có thừa nhưng con tim chưa từng thổn thức dù đã ở độ tuổi “băm mấy nhát”. Bất chấp tiền đề chưa-từng-hẹn-hò-được-với-bất-kì-cô-gái-nào-đến-lần-thứ-hai, chàng quyết tâm lập Dự Án Vợ, với niềm tin mãnh liệt rằng bản điều tra khảo sát dằng dặc đầy rẫy những thông số sẽ đưa nửa còn lại hoàn hảo đến với chàng. Đời không như mơ, hay cuộc đời đích thực là một giấc mơ?',N'hinh18.jpg',13,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Tiếng Chim Hót Trong Bụi Mận Gai',90000,N'Tác phẩm này có thể gọi là “Xaga về gia đình Cleary”. Xaga là hình thức văn xuôi cổ có tính anh hùng ca, kể chuyện một cách điềm đạm về những con người hùng dũng. Cuốn tiểu thuyết này viết về lịch sử nửa thế kỷ của ba thế hệ một gia đình lao động – gia đình Cleary. Loại tiểu thuyết lịch sử gia đình từ trước đã có những thành công như thiên sử thi vè dòng họ Foocxaitơ của Gônxuocthy, “Gia đình Tibô” của Rôgiê Mactanh duy Gar. “Gia đình Artamônôp” của M. Gorki. Đặc điểm chung của các tác phẩm đó là số phận gia đình tiêu biểu cho số phận của giaia cấp tư sản, các thế hệ sau đoạn tuyệt với truyền thống của gia đình. ',N'hinh19.jpg',12,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Những Chàng Trai Năm Ấy',50000,N'Bạn đã khi nào yêu đơn phương một chàng trai và rồi vì một lý do nào đó, không thể hoặc không đủ can đảm để nói ra? Cô bạn người Mỹ gốc Hàn Lara Jean Song thì có tới 5 “mối tình” như vậy tính cho tới năm 16 tuổi. Và để những mỗi tình đó “yên ngủ”, Lara Jean đặt dấu kết thúc bằng những lá thư không-bao-giờ-gửi, trong đó trút hết tất cả những rung động, suy nghĩ dành cho chàng trai đó. Và rồi một ngày, những bức thư riêng tư đó bất ngờ bị ai đó gửi đi. Đáng lo nhất là bức thư gửi cho Josh, người-yêu-vừa-chia-tay của chị gái cô bạn. ',N'hinh20.jpg',11,1002,'cdVH')



insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Tớ Học Lập Trình',180000,N'Cẩm nang hướng dẫn hoàn chỉnh và đơn giản nhất dành cho bạn trẻ bắt đầu học lập trình. Ngôn ngữ lập trình Scratch đặc biệt phù hợp cho bạn trẻ mới học, vì tính tương tác trực quan, đồ họa sống động, ra sản phẩm liền tay mà vẫn đảm bảo khoa học và liên thông tri thức sau này. Chỉ cần nắm và kéo các khối lệnh đầy màu sắc có sẵn để lắp ghép thành một kịch bản điều khiển các đối tượng trên màn hình.',N'hinh21.jpg',17,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Code Dạo Kí Sự',120000,N'Về tác giả của blog Tôi đi code dạo, anh tên thật là Phạm Huy Hoàng, một Developer Full Stack, cựu sinh viên trường FPT University, hiện tại anh đang học Thạc sĩ Computer Science tại Đại học Lancaster ở Anh (học bổng $18000). Trước khi qua Xứ Sở Sương Mù, anh đã từng làm việc tại FPT Software và ASWIG Solutions.',N'hinh122.jpg',13,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Lập Trình Và Cuộc Sống',80000,N'Jeff Atwood bắt đầu viết blog Coding Horror vào năm 2004, và tin rằng nó đã làm thay đổi cuộc đời của mình. Anh cần một cách để theo dõi sự phát triển của phần mềm theo thời gian-bất cứ điều gì anh ta nghĩ đến hoặc làm việc trên nó. Jeff đã nghiên cứu các chủ đề mà anh cảm thấy thú vị, sau đó ghi lại nghiên cứu của mình bằng một bài đăng trên blog mà anh có thể dễ dàng tìm lại và tham khải sau này. Theo thời gian, ngày càng có nhiều độc giả truy cập blog tìm thấy các bài viết hữu ích, liên quanvaf thú vị. Hiện nay, có khoảng 100.000 độc giả truy cập blog mỗi ngày cũng rất nhiều bình luận và tương tác trên web đó.',N'hinh23',1,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Hướng Đối Tượng & Cơ Sở Dữ Liệu C#',90000,N'Nội dung cuốn sách sẽ hướng dẫn cách lập trình hướng đối tượng căn bản qua các bài tập mẫu . Ngoài ra, có hướng dẫn thêm cách in các bảng bằng Crystal report và cách thực hiện để phân phối ứng dụng khi đã hoàn thành xong chương trình.',N'hinh124.jpg',13,'1003','cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Lập Trình Cơ Bản PHP Và MySQL',70000,N'Đây là cuốn đầu tiên trong bộ sách về lập trình PHP và MySQL gồm 2 cuốn Lập trình cơ bản PHP và MySQL và Lập trình nâng cao PHP và MySQL. Nếu cuốn thứ nhất đưa bạn khởi động nhanh với PHP và MySQL thì ở cuốn thứ hai, các bạn sẽ được hướng dẫn sử dụng các kỹ năng nâng cao để lập trình với PHP và MySQL ở mức độ chuyên sâu. Các lập trình viên có kinh nghiệm có thể lướt nhanh một số phần ở cuốn Lập trình cơ bản, dành nhiều thời gian hơn cho cuốn Lập trình nâng cao, trong khi những người mới bắt đầu có thể thoải mái lĩnh hội kiến thức mới ngay từ những chương đầu của cuốn thứ nhất của bộ sách.',N'hinh25.jpg',15,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Lập Trình Với C# Xây Dựng Ứng Dụng',140000,N'C# là một ngôn ngữ lập trình hướng đối tượng đơn giản, hiện đại, được phát triển bởi Microsoft bên trong phần khởi đầu .NET của hãng, C# có nền tảng dựa trêm các ngôn ngữ lập trình C và C++ đã và đang được các trường chuyên ngành tin học đưa vào giảng dạy, vì thế, một khi nếu bạn đọc đã có những kiến thức cơ bản về C hay C++, thì việc học và khai thác sử dụng C# trong công việc sẽ dễ dàng hơn.',N'hinh26.jpg',18,1006,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Lập Trình Android',190000,N'Lập trình Android cung cấp cho người đọc những thông tin chi tiết về nền tảng Android và các kĩ năng lập trình trên nền tảng này. Cuốn sách thật sự rất phù hợp cho những ai yêu thích lập trình, đặc biệt là lập trình cho các thiết bị di động và có mong muốn xây dựng ứng dụng riêng cho mình. Toàn bộ nội dung sách được chia làm 4 phần, mỗi phần đều có những ví dụ minh họa thực tế, giúp cho người đọc, dù chưa quen với lập trình, vẫn có thể tiếp cận tìm hiểu dễ dàng.',N'hinh27.jpg',20,1003,'cdLT')
insert into Sach (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe) values(N'Sáng Tạo Trong Thuật Toán Và Lập Trình',130000,N'Bộ sách cung cấp những kiến cơ bản về lập trình trong Pascal và C++ cho các bạn học sinh, sinh viên và những bạn đọc muốn hoàn thiện tri thức trong lĩnh vực giải thuật và lập trình. Các kỹ thuật lập tình được minh họa qua những bài toán cụ thể tương đương với trình độ nâng cao của học sinh và sinh viên.Các kỹ thuật lập trình và phương pháp xây dựng thuật giải cho những bài toán thường được dùng rộng rãi trong quá trình thiết kế và cài đặt các phần mềm ứng dụng trong thực tiễn, Vì vậy việc sớm làm chủ các tri thức này mới thật sự là cần thiết. Ngoài ra, Bộ sách còn cung cấp các chương trình viết bằng ngôn ngữ lập trình Pascal, C# và C++ để bạn đọc tiện so sánh với lời giải của mình.',N'hinh128.jpg',13,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Mạng Xã Hội',200000,N' câu chuyện về quá trình hình thành và phát triển một cách nhanh chóng của mạng xã hội lớn nhất hiện nay: Facebook. Đặc biệt, trong phim có tiết lộ những bí ẩn trong đời tư và tình cảm của Mark Zuckerberg, người sáng lập ra Facebook.',N'hinh129.jpg',16,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Mật Mã Tử Thần',450000,N'Tay hacker nổi tiếng Will Farmer đụng độ một nhân vật mang tên Ripley trên hệ thống mạng của chính phủ trong một trò chơi khủng bố online. Dần dần sau những lần tiếp cận, Will biết được Ripley là một chương trình lập ra để tìm ra những thành phần khủng bố trong xã hội nhưng thật không may khi hệ thống này có những lỗi nhỏ đã làm cho nó làm việc khác với mục đích chế tạo ra nó.',N'hinh30.jpg',12,1003,'cdLT')



insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Tại Sao Thầy Bói Nói Đúng',50000,N'Con người lúc nào cũng tò mò với những hiện tượng kỳ bí không thể lý giải. Chúng ta hào hứng khi xem ảo thuật, phấn khích với những câu chuyện kinh dị, luôn tò mò về các thế lực siêu nhiên và đặc biệt ưa thích việc bói toán. Chỉ cần biết mỗi tên tuổi và ngày sinh, thầy bói đã có thể đọc vanh vách về tiểu sử và tương lai của bạn. Bạn trầm trồ ngạc nhiên và thán phục về khả năng nhìn thấu quá khứ vị lai của họ. Nhưng thực sự thầy bói có khả năng siêu nhiên như vậy hay đằng sau họ là những mánh lới nào khác?',N'hinh31.jpg',20,1003,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Cuốn Sách Về Các Biểu Tượng Tâm Linh',120000,N'Cuốn sách về các biểu tượng tâm linh kể những câu chuyện hấp dẫn và đưa ra cách lý giải về cảm giác mơ hồ nhưng gây sốc, những sự trùng hợp ngẫu nhiên đáng nhớ, một số giấc mơ kỳ lạ,… mà chúng ta thường gặp. Những điều tưởng chừng bình thường ấy thực chất lại là thông điệp quan trọng đến từ thế giới siêu nhiên, hoặc từ bản thể vũ trụ. Hãy cởi mở trước những lời chỉ dẫn như thế bằng cách nhận ra và giải mã các dấu hiệu cũng như những hiện tượng tương ứng. Hãy mở rộng nhận thức về các biểu tượng trong cuộc sống, cải thiện trực giác, mạnh dạn bày tỏ ước muốn của bạn.',N'hinh32.jpg',15,1003,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Nhà Tiên Tri Vanga Và Vũ Trụ Huyền Bí',110000,N'Nhắc tới cái tên Vanga có lẽ không ít người cảm thấy tò mò. Một người có khả năng tiên tri và thấu thị có cuộc sống ra sao? Họ biết được những bí ẩn nào của nhân loại, của thế giới và thậm chí của cả vũ trụ? Nhà tiên tri Vanga và Vũ trụ huyền bí sẽ hé mở cho bạn tấm màn bí mật ấy. Cuốn sách dựa trên những lời tiên tri và giáo huấn của Vanga, so sánh và kết hợp với một triết thuyết cổ xưa, Agni Yoga, để vẽ nên một bức tranh tương đối đầy đủ về những điều cực kỳ quan trọng, nhưng có lẽ không nhiều người biết, về cuộc sống này.',N'hinh33.jpg',25,1003,'cdKH')
insert into Sach (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe) values(N'Kiếp Nào Ta Cũng Tìm Thấy Nhau',90000,N'Kiếp nào ta cũng tìm thấy nhau nói về những linh hồn tri kỷ, những người có mối liên kết vĩnh viễn với nhau bằng tình yêu thương, luôn gặp lại nhau hết lần này đến lần khác, qua hết kiếp này tới kiếp khác. Chúng ta sẽ tìm thấy và nhận ra tri kỷ của mình như thế nào, rồi đưa ra những quyết định làm thay đổi cuộc sống của chính mình ra sao là những khoảnh khắc quan trọng và xúc động nhất trong cuộc đời mỗi người.',N'hinh34.jpg',35,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Hành Trình Tarot',250000,N'Bộ bài Tarot khởi đầu vốn chỉ là một trò chơi của giới quý tộc Ý từ giữa Thế kỷ 15. Cho đến tận cuối Thế kỷ 18, người ta mới nhận ra những hình ảnh mang tính biểu tượng, những câu chuyện xuất xứ từ các huyền thoại trong lá bài Tarot là một công cụ tuyệt vời để khám phá thế giới tinh thần và dự đoán tương lai. Tarot hiện đại cho rằng các lá bài như một phòng chiếu phản ánh tâm lý người xem bài. Bởi thế, Tarot đã trở thành một bộ môn dành cho mọi người, mọi lứa tuổi, chỉ cần bạn là một người biết nghe và muốn lắng nghe.',N'hinh35.jpg',40,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Hiểu Về Sự Chết',100000,N'Cuốn Hiểu về sự chết chính vì vậy là một của hiếm. Bởi lẽ, nó được chắp bút bởi một giáo sư lâm sàng về phẫu thuật, một người không phải thường xuyên nhưng chắc chắn đã chứng kiến nhiều người ra đi hơn chúng ta. Ông viết cuốn sách này nhằm vén bức màn bí ẩn của quá trình chết, giúp chúng ta – những người luôn tò mò về cái chết – hiểu rõ những đặc trưng của tiến trình mà ai trong chúng ta rồi cũng sẽ phải trải qua khi dần chết đi. Chết có nghĩa là sự ngừng trệ của hệ tuần hoàn, là hiện tượng thiếu sự vận chuyển oxy tới các tế bào, là sự lụi dần của chức năng não bộ, là sự suy yếu của các bộ phận cơ thể, là sự phá hủy các tế bào sống.',N'hinh36.jpg',30,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Huyền Thuật Và Các Đạo Sĩ Tây Tạng',40000,N'Trong cuốn Huyền Thuật Và Các Đạo Sĩ Tây Tạng, xin mời bạn đọc theo dõi cuộc hành trình của bà Alexandra David Neel, một phụ nữ người Pháp, đi khắp xứ này với mục đích tìm hiểu và ghi nhận những sự kiện lạ lùng, huyền bí mà chưa có người ngoại quốc nào được chứng kiến. Không như Lạt ma Govinda chỉ chú trọng vào những tài liệu, kinh điển Phật giáo, bà David Neel đã quan sát tất cả các pháp thuật huyền bí, phương pháp tu luyện lạ lùng của nhiều tôn giáo khác nhau.',N'hinh37.jpg',25,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Trải Nghiệm Cận Tử',90000,N'Với hơn 20 năm kinh nghiệm nghiên cứu về trải nghiệm cận tử (gọi tắt NDE) và chứng kiến nhiều nhân chứng tường thuật về trải nghiệm cận tử của chính mình, Sartori hiểu rằng đây là sứ mệnh của cô, cần chia sẻ kiến thức này để giúp mọi người hiểu hơn về trải nghiệm cận tử. Hơn bao giờ hết, con người cần nhận thức về mối liên kết giữa tâm trí, cơ thể và linh hồn.',N'hinh38.jpg',20,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Vũ Trụ Trong Một Nguyên Tử',80000,N'Galileo, Copernicus, Newton, Niels Bohr, Einstein. Những khám phá của họ đã thay đổi hoàn toàn quan niệm của chúng ta về việc chúng ta là ai và chúng ta đang ở đâu trên thế giới này. Những khám phá đó đặt ra vấn đề về sự cùng tồn tại không đơn giản giữa khoa học và tôn giáo, niềm tin và đòi hỏi thực nghiệm. Đâu là chân lý? Đâu là con đường đúng đắn để nhận thức thực tại?',N'hinh39.jpg',30,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Bí Mật Thuật Thôi Miên',60000,N'Thuật thôi miên thực sự là một môn nghệ thuật diệu kỳ, nhưng không huyền ảo như người ta tưởng. Trên thế giới, thuật thôi miên đã có lịch sử mấy ngàn năm, được ứng dụng rộng rãi trong cuộc sống. Là một phương pháp chữa trị tâm lý độc đáo, nó có thể trực tiếp đối thoại với tiềm thức, tạo điều kiện cho đời sống nội tâm của chúng ta phát triển trọn vẹn, từ đó giúp tâm lý được lành mạnh, loại bỏ tất cả những suy nghĩ lệch lạc, lo lắng, ưu phiền.',N'hinh40.jpg',20,1004,'cdKH')




insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Khí Chất Bao Nhiêu, Hạnh Phúc Bấy Nhiêu',50000,N'Cũng giống như trái dứa, khi một người phụ nữ đủ bản lĩnh để chống đỡ và vượt qua nghịch cảnh, đủ tĩnh tại để tận hưởng trọn vẹn niềm vui cuộc sống, thì đó chính là lúc họ đội lên đầu chiếc vương miện và trở thành nữ hoàng trong thế giới của chính mình.',N'hinh41.jpg',18,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'All The Rule – Bình Tĩnh Khi Ế, Mạnh Mẽ Khi Yêu',20000,N'Cuốn sách dành cho những người “lận đận tình duyên” , cho những cô gái thật sự nghĩ mình xứng đáng với những người đàn ông tốt nhất, những cuộc tình đáng giá nhất, chứ không chỉ là thoáng qua!',N'hinh42.jpg',18,'1005','cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đặc Quyền Của Gái Hư',98000,N'Với “ĐẶC QUYỀN CỦA GÁI HƯ”, bạn sẽ tìm được đáp án của riêng bạn cho tất cả những câu hỏi còn bỏ ngỏ đó. Nhưng dù câu trả lời bạn chọn có là gì, thì khi khám phá hết 12 sức mạnh tiềm ẩn của phái đẹp (tương đương với 12 chương sách), bạn cũng sẽ hiểu ra rằng: Bạn có thể lấy mọi thứ bạn muốn từ đàn ông mà không còn cần phải lo sợ việc sẽ bị tổn thương, bị lừa, hay bị đá.',N'hinh43.jpg',18,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Thay Cách Mặc Đổi Cuộc Đời',100000,N'Thay Cách Mặc, Đổi Cuộc Đời cung cấp cho độc giả những kỹ năng cốt lõi để biến đổi hoàn toàn hình ảnh bản thân, từ chỗ ăn mặc chấp nhận được trở thành ăn mặc ấn tượng tuyệt vời. Từ đây, người đọc cũng sẽ rút ra được những phương pháp thay đổi diện mạo thực tế và phù hợp với lối sống, tính cách và túi tiền của mình. Tác giả cũng sẽ chỉ cho người đọc những kỹ thuật giúp tiết kiệm thời gian và tăng hiệu quả tối đa cho các khoản chi phí bạn bỏ ra. Trên hết, là sẽ hướng dẫn cách tạo ra một lợi thế phong cách, để bạn luôn trở nên đặc biệt, nổi bật và đáng nhớ.',N'hinh44.jpg',18,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Bắt Đầu Từ Chính Căn Nhà Của Bạn',120000,N'Muốn ít đi – Hạnh phúc nhiều hơn ghi lại những trải nghiệm sắp xếp đồ đạc trong ngôi nhà của Michelle – người phụ nữ có một gia đình đông đúc với cuộc sống thường xuyên phải dịch chuyển. Để có một không gian thoải mái, thuận tiện mà vẫn gọn gàng dù sống ở Mỹ hay Nhật, cô đã chọn cách tối giản để bắt đầu cuộc “cách mạng” nhà cửa của mình.',N'hinh45.jpg',18,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Phụ Nữ Thông Minh Không Ở Góc Văn Phòng',130000,N'Người ta thường nói rằng: Phụ nữ phải làm việc gấp đôi nam giới và chỉ được đánh giá như họ.Họ làm việc chăm chỉ như những chú kiến nhỏ – Làm việc, làm việc và làm việc. Mặc dù không ngừng than phiền mình phải làm nhiều việc hơn tất cả mọi người nhưng họ vẫn miệt mài làm việc! Chính vì vậy nhiều phụ nữ vẫn lầm tưởng họ được thăng tiến vì đức tính chăm chỉ cần cù. Sự thật là một người được thăng tiến không đơn thuần chỉ vì họ làm việc chăm chỉ.Để thành công mỗi chúng ta đều phải sở hữu nhiều tố chất quan trọng khác nhau như: Thân thiện, biết xây dựng chiến lược, biết làm việc nhóm…',N'hinh46.jpg',18,1006,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Thánh Kinh Theo Coco Chanel',123000,N'Coco Chanel là biểu tượng thời duy nhất được ghi nhận và góp mặt trong danh sách 100 người có sức ảnh hưởng lớn nhất của thế kỷ XX do tạp chí TIME bình chọn. Bà đã đem đến cuộc cách mạng trong thời trang, giải phóng cơ thể phụ nữ khỏi lối ăn vận cổ điển, khởi xướng và cổ súy tinh thần tự do trong thời trang và tư tưởng. Kinh đô thời trang Paris trong thời kì vàng son hưng thịnh bậc nhất xoay quanh Bà Đầm. Coco gây dựng đế chế “Chanel” với khối tài sản kếch sù từ ngành công nghiệp thời trang, đến nay “Coco Chanel” vẫn luôn là niềm khao khát của bất cứ tín đồ trên thế giới.Phụ Nữ Hiện Đại Viết Lại Luật Thành Công',N'hinh47.jpg',18,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Phụ Nữ Hiện Đại Viết Lại Luật Thành Công',148000,N'Cuốn sách trang bị cho phụ nữ hiện đại những kỹ năng hiệu quả nhất về nắm bắt cơ hội, chuyển đổi nghề nghiệp, phương pháp đàm phán, lãnh đạo nhóm, khởi nghiệp, quản lý công việc và gia đình, đồng thời giúp thay đổi cuộc sống tốt hơn vì quyền lợi của phụ nữ.',N'hinh48.jpg',18,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Bản Lĩnh Jackie Kennedy',151000,N'300 trang sách của “Bản lĩnh Jackie Kennedy” sẽ kể cho bạn nghe một cách chân thực và tường tận về hành trình cuộc đời của một trong những người đàn bà nổi tiếng nhất hành tinh – từ khi còn là một thiếu nữ đôi mươi cho đến khi nhắm mắt xuôi tay vào năm 1994. Bạn chắc chắn sẽ thấy bội phục người đàn bà nhỏ bé này, và theo dõi theo cách mà Jackie đã dũng cảm vượt qua biến cố để tìm kiếm hạnh phúc, chắc hẳn sẽ ít nhiều truyền tới cuộc đời bạn một niềm cảm hứng sống mạnh mẽ.',N'hinh49.jpg',18,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Dấn Thân',112000,N'Sheryl Sandberg hiện là giám đốc hoạt động của facebook, là nhân vật đứng thứ hai sau tổng giám đốc và người sáng lập facebook. Cô được xem là một phụ nữ quyền lực ở thung lũng Silicon. Cô từng giữ chức vụ lớn tại Google, tại bộ Tài chính Mỹ.Thông qua quyển sách này, Sheryl Sandberg chia sẻ cuộc đời mình, những vươn lên cùng với thành công, để qua đó nhằm kêu gọi và truyền cảm hứng cho phụ nữ.',N'hinh50.jpg',18,1005,'cdTruyen')



insert into Sach (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe) values(N'Bố Già',70000,N'Thế giới ngầm được phản ánh trong tiểu thuyết Bố già là sự gặp gỡ giữa một bên là ý chí cương cường và nền tảng gia tộc chặt chẽ theo truyền thống Mafia xứ Sicily với một bên là xã hội Mỹ nhập nhằng đen trắng, mảnh đất màu mỡ cho những cơ hội làm ăn bất chính hứa hẹn những món lợi kếch xù. Trong thế giới ấy, hình tượng Bố già được tác giả dày công khắc họa đã trở thành bức chân dung bất hủ trong lòng người đọc.',N'hinh51.jpg',20,'1005','cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Chúa Tể Những Chiếc Nhẫn',80000,N'Kỷ Đệ Nhất, các Valar kết liễu Morgoth. Kỷ Đệ Nhị, Tiên và Người đánh bại Sauron. Và nay, giữa Kỷ Đệ Tam tưởng đã hòa bình, báu vật của Sauron lại ngóc đầu trong lòng núi. Và thêm một anh chàng Hobbit bỗng thấy mình từ biệt tổ ấm yên bình, dấn vào cuộc phiêu lưu mỗi bước lại thêm xa, thêm gian nan, thêm hệ trọng.',N'hinh52.jpg',30,'1006','cdNN')
insert into Sach (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe) values(N'Đại Gia Gatsby',90000,N'“Gatsby đã tin vào đốm sáng xanh ấy, vào cái tương lai mê đắm đến cực điểm đang rời xa trước mắt chúng ta năm này qua năm khác. Ừ thì nó đã tuột khỏi tay chúng ta, nhưng có làm sao đâu – ngày mai chúng ta sẽ lại chạy nhanh hơn, vươn tay ra xa hơn…”. Là bức chân dung của “Thời đại Jazz” (Jazz Age, cái tên do chính Fitzgerald đặt cho thời kỳ 1918 – 1929), đại gia Gatsby nắm bắt vô cùng sâu sắc tinh thần của thế hệ cùng thời ông: những ám ảnh thường trực về thành đạt, tiền bạc, sang trọng, dư dật, hào nhoáng; song đồng thời là nỗi âu lo trước thói sùng bái vật chất vô độ và sự thiếu vắng đạo đức đang ngày một lên ngôi.',N'hinh53.jpg',20,'1006','cdNN')
insert into Sach (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe) values(N'Forrest Gump',90000,N'Cuốn sách này được viết ra không nhằm cho ta một bài học về tài chính hay kinh doanh gì cả. Một cuốn sách được viết với phong cách nhẹ nhàng, đơn giản và dễ hiểu. Nó không cỗ vũ chúng ta tin vào số mệnh hay vận may rủi. Cuốn sách đơn giản cho chúng ta nhìn cuộc sống qua một lăng kính khác, lăng kính của một người có chỉ số IQ thấp, một người mà chúng ta cho rằng bất thường hơn so với số đông còn lại. Chúng ta biết và hiểu được cuộc sống cũng như cách suy nghĩ của Forrest Gump. Nhờ đó, ta thấy cuộc đời thực ra rất đơn giản, như cách mà Forrest Gump sống và trải nghiệm nó vậy.',N'hinh54.jpg',40,'1005','cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Hai Số Phận',60000,N'Hai Số Phận (có tên gốc tiếng Anh là: Kane and Abel) là một cuốn tiểu thuyết được sáng tác vào năm 1979 bởi nhà văn người Anh Jeffrey Archer. Tựa đề Kane and Abel dựa theo câu chuyện của anh em: Cain và Abel trong Kinh Thánh Cựu Ước. Tác phẩm được xuất bản tại Vương quốc Anh vào năm 1979 và tại Hoa Kỳ vào tháng 2 năm 1980, cuốn sách phổ biến thành công trên thế giới. Sách đạt danh hiệu sách bán chạy nhất theo danh sách của tờ New York Times và năm 1985 nó được đưa lên chương trình truyền hình miniseries của CBS với tên là Kane & Abel bắt đầu với Peter Strauss vai Rosnovski và Sam Neill vai Kane.',N'hinh55.jpg',50,'1005','cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Suối Nguồn',50000,N'Bản chất của con người – và của bất cứ sinh vật nào – không phải là đầu hàng, hoặc phỉ nhổ và nguyền rủa sự tồn tại của mình; điều ấy thực ra đòi hỏi cả một quá trình suy đồi mà tốc độ của nó tuỳ thuộc mỗi người. Một vài người đầu hàng vào lần đầu tiên tiếp xúc với áp lực; một vài người mặc nhiên đầu hàng; một số khác đi xuống từ từ và cứ thế mất dần ngọn lửa mà chính họ cũng không hề nhận ra nó đã tàn lụi như thế nào.',N'hinh56.jpg',30,'1006','cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Tiếng Chim Hót Trong Bụi Mận Gai',30000,N'Tình yêu giữa Meggie với Ralph thật đáng nể phục. Cô gái Mecghi chỉ yêu một lần trong đời, nhưng yêu bằng tình yêu mãnh liệt nhất thế gian. Mecghi vượt lên nỗi đau đớn thân xác và linh hồn để chiến thắng Chúa Trời. “Nỗi đau cũng chính là niềm kiêu hãnh trong nàng. Bởi có ai dám vì tình yêu mà giành giật cả linh mục (Ralph) – người sinh ra vốn đã thuộc về Chúa?',N'hinh57.jpg',50,'1006','cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Sự Im Lặng Của Bầy Cừu',70000,N'Sự Im Lặng Của Bầy Cừu kể về vụ án giết người hàng loạt xảy ra nhưng không để lại dấu vết. Điều kỳ lạ là Lecter – một bác sĩ tâm lý bị tâm thần đang điều trị tại Dưỡng Trí Viện biết rất rõ về hành vi của kẻ sát nhân nhưng chỉ im lặng. Cho đến khi con gái của thượng nghị sĩ bị bắt cóc thì cuộc đối đầu của nữ nhân viên thực tập FBI và vị bác sĩ tâm thần đã đến cực điểm. Cuối cùng tất cả cũng đều lộ diên, thủ phạm là một tên có nhân cách bệnh hoạn, một kẻ tâm thần rối loạn cựu kỳ nguy hiểm…',N'hinh58.jpg',20,'1006','cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Ông Trăm Tuổi Trèo Qua Cửa Sổ Và Biến Mất',80000,N'Vào ngày sinh nhật lần thứ 100 của mình, cụ ông Allan Karlsson đột nhiên trèo qua của sổ ngôi nhà dưỡng lão – Nhà Già – và biến mất. Ở cái tuổi 100 hiếm ai đạt tới thì cụ có thể đi đâu được? Một cuộc truy tìm trên khắp nước Thụy Điển diễn ra từ phía những người có trách nhiệm chăm nom cụ cũng như chính quyền sở tại. Song song với cuộc truy tìm nhân đạo ấy, một cuộc truy tìm đuổi bắt khác gay cấn hơn, xảy đến từ một tên tội phạm, kẻ đã ngớ ngẩn hoặc đúng hơn, bất cẩn trao vali 50 triệu crown vào tay cụ già này. Nhưng một người đã sống qua một thế kỷ thì không dễ gì tóm cụ ta được.',N'hinh59.jpg',40,'1004','cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Giết Con Chim Nhại',50000,N'Câu chuyện trong quyển sách mang lại rất nhiều bài học quí về tình người và cho người đọc cảm nhận được cuộc sống của những con người vào thời điểm ấy. Một ông luật sư tận tâm với thân chủ của mình và đấu tranh chống lại cái bất công trong xã hội với chế độ phân biệt chủng tộc tàn nhẫn mà người da đen Mỹ đã phải hứng chịu suốt một thời gian dài. Câu chuyện mang lại một bài học nhân văn sâu sắc về tình người, về cuộc sống, về sự bất công trong xã hội. Rất hay, rất đáng đọc.',N'hinh60.jpg',20,'1005','cdNN')





insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Nhà Tự Nhiên Kinh Tế',70000,N'Kinh tế học không chỉ bó hẹp trong giảng đường hay ngân hàng. Môn khoa học này tồn tại ở khắp mọi nơi và ảnh hưởng tới mọi thứ chúng ta làm hoặc nhìn thấy trên phim ảnh cũng như ngoài đời thực. Nó có thể giúp ta lý giải những “bí ẩn” lý thú trong cuộc sống.',N'hinh61.jpg',40,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Kinh Tế Tự Nhiên',80000,N'“Mỗi ngày, chúng ta thực hiện đủ loại quyết định, nhưng đáng tiếc là chúng ta thường có những lựa chọn tồi tệ (…). Lý do là vì con người dễ bị tác động bởi nhiều định kiến khác nhau, mà lắm lúc chúng làm ta trở nên thật ngớ ngẩn (…). Người ta cần những cú hích trước những quyết định khó khăn và hiếm khi xảy ra, mà hiện thời họ không có đủ thông tin” – lời giới thiệu của quyển sách viết.',N'hinh62.jpg',40,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Dầu Mỏ, Tiền Bạc Và Quyền Lực',90000,N'Dầu Mỏ, Tiền Bạc Và Quyền Lực khắc họa toàn cảnh lịch sử ngành công nghiệp dầu mỏ – cuộc giao tranh giành tiền bạc và quyền lực có xung quanh vấn đề dầu mỏ. Cuộc chiến này đã làm rung chuyển nền kinh tế toàn cầu, phản ánh hậu quả của các cuộc chiến tranh thế giới và khu vực, đồng thời thay đổi vận mệnh nhân loại nói chung và các quốc gia nói riêng.',N'hinh63.jpg',10,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Nóng, Phẳng, Chật',40000,N'Trong cuốn sách Nóng, phẳng, chật mới và quan trọng này, Friedman đưa ra một cách nhìn mới, rất khiêu khích về hai trong số những thách thức lớn nhất mà hiện nay nước Mỹ đang đối mặt: đó là khủng hoảng môi trường toàn cầu về việc Mỹ đánh mất trọng tâm và mục tiêu quốc gia một cách đáng ngạc nhiên kể từ sau sự kiện 11/9. Cuốn sách mô tả một cách đột phá vị thế hiện nay của nước Mỹ và cho thấy giải pháp của hai vấn đề này có quan hệ với nhau như thế nào: làm thế nào để phục hồi thế giới đồng thời lại vừa tái sinh nước Mỹ.',N'hinh64.jpg',20,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Các Cuộc Chiến Tranh Tiền Tệ',50000,N'Cuộc chiến tranh tiền tệ được định nghĩa là cuộc chiến do một quốc gia khởi xướng bằng cách hạ thấp giá trị đồng tiền của chính quốc gia đó. Hành động này tạo ra những kết cục tàn phá và đáng sợ nhất với hệ thống kinh tế thế giới. Hệ lụy kinh tế đi kèm với chiến tranh tiền tệ là tăng trưởng đình trệ, lạm phát, các biện pháp khắc khổ và hoảng loạn tài chính.',N'hinh65.jpg',20,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Lịch Sử Giao Thương: Thương',60000,N'Toàn cầu hóa ra không phải là một hay thậm chí là một chuỗi sự kiện; mà đó là tiến trình diễn ra chậm rãi trong một thời gian rất, rất dài. Thế giới không đột nhiên trở nên “phẳng” với phát kiến về Internet, và thương mại không bất ngờ bị các tập đoàn lớn tầm cỡ toàn cầu chi phối vào cuối thế kỷ 20. Khởi đầu bằng hàng hóa giá trị cao được ghi nhận trong lịch sử.',N'hinh66.jpg',30,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Siêu Kinh Tế Học Hài Hước',70000,N'Kinh tế học hài hước – cuốn sách bán chạy nhất theo bình chọn của New York Times. Với hơn 4 triệu bản được dịch ra 35 thứ tiếng, đây thực sự là cuộc cách mạng trong tư duy khiến bất cứ ai từng đọc qua cũng phải thay đổi cách nhìn nhận về thế giới xung quanh. ',N'hinh67.jpg',30,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Blockchain – Khởi Nguồn Cho Một Nền Kinh Tế Mới',80000,N'Bitcoin đang bắt đầu bước vào giai đoạn trưởng thành trên cương vị một đồng tiền số, nhưng công nghệ Blockchain đằng sau nó có thể mang nhiều ý nghĩa lớn lao hơn. Cuốn sách này sẽ đưa bạn vượt ra khỏi phạm trù tiền tệ (“Blockchain 1.0”) và hợp đồng thông minh (“Blockchain 2.0”) để thấy blockchain có thể trở thành mô hình điện toán đột phá thứ năm (sau máy chủ cỡ lớn, máy tính cá nhân, mạng internet, và mạng di động/xã hội) như thế nào.',N'hinh68.jpg',10,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Châu Á Vận Hành Như Thế Nào',90000,N'Cuốn Châu Á vận hành như thế nào? tập trung vào phân tích mức độ đúng sai của các chiến lược, chính sách kinh tế khác nhau giữa hai nhóm nước. Tác giả chỉ ra rằng thành công hay thất bại của một quốc gia tùy thuộc chủ yếu vào năng lực và hiệu quả chỉ đạo của người cầm quyền của mỗi quốc gia, một yếu tố hoàn toàn mang tính chất chủ động. Joe Studwell đúc kết lại có ba nhóm chính sách quan trọng nhất đã tạo ra khác biệt giữa thành công Đông Bắc Á và thất bại Đông Nam Á.',N'hinh69.jpg',10,1001,'cdKT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Vĩ Đại',60000,N'Nhưng theo Deaton, viện trợ quốc tế là hình thức không hiệu quả, thậm chí có hại. Ông cho rằng tác động như ưu đãi các công ty dược và nâng hạn chế thương mại sẽ giúp các nước nghèo thực hiện “cuộc đào thoát vĩ đại” của riêng mình.',N'hinh70.jpg',20,1001,'cdKT')


insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Phố Của Những Cửa Hiệu U Tối',70000,N'Sự xuất hiện của Patrick Modiano vào cuối thập kỷ 60 được coi như một hiện tượng vǎn học Pháp đương đại. Tác phẩm Phố những cửa hiệu u tối, đạt giải thưởng Goncourt, giải vǎn học quan trọng nhất của Pháp,là nỗi khắc khoải triền miên về nguy cơ đánh mất danh tính và bản cách.',N'hinh71.jpg',40,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Nhà Thờ Đức Bà Paris',80000,N'Nhà thờ Đức Bà Paris là tác phẩm tiêu biểu cho phong cách sáng tác theo khuynh hướng lãng mạn của Victor Hugo. Cũng nhờ thành công của tác phẩm mà ông được biết đến như một nhà văn nhân đạo, lãng mạn bậc nhất của nước Pháp. Bằng cốt truyện khá bi thảm, nặng nề, các tình tiết xếp đặt khéo léo, mang kịch tính và hình ảnh tô đậm, phóng đại, lẫn lộn thực hư, kết hợp với bút pháp miêu tả thật rực rỡ, kỳ thú, Victor Hugo đã vẽ nên một bức tranh thu nhỏ về xã hội Pháp thế kỷ XV.',N'hinh72.jpg',40,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đi Tìm Thời Gian Đã Mất',90000,N'Đi tìm thời gian đã mất là bộ tiểu thuyết gồm 7 tập của nhà văn Pháp Marcel Proust, được viết từ 1908-1909 đến 1922 và xuất bản từ 1913 đến 1927, trong đó 3 tập cuối chỉ được xuất bản sau khi tác giả qua đời. Tiểu thuyết này được xếp vào trong số 10 cuốn tiểu thuyết được thanh niên Pháp ưa thích nhất trong thế kỷ 20.',N'hinh73.jpg',10,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Người Xa Lạ',40000,N'Người xa lạ của Albert Camus được khởi thảo năm 1938, hoàn tất năm 1940 và xuất bản lần đầu năm 1942. Tiểu thuyết khắc họa chân dung nhân vật Meursault trong khoảng thời gian kể từ ngày mẹ của Meursault chết ở trại tế bần dành cho người già cho đến gần cái chết của chính anh ta. Cuốn sách được chia thành 2 phần với 11 chương, với kiểu tự thuật về cuộc đời của nhân vật tôi – Meursault, một nhân viên thư ký lãnh việc gửi hàng hóa.',N'hinh74.jpg',20,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Bà Bovary',50000,N'Bà Bovary là cuốn tiểu thuyết cỡ lớn, mô tả các nhân vật tầm thường mà không thể quên được. Tác phẩm kể về nàng Emma Bovary, con một nông dân khá giả chịu ảnh hưởng của tiểu thuyết lãng mạn nên ước mơ một cuộc sống phóng khoáng, phong lưu nhưng cuối cùng nàng lấy phải một anh chồng đần độn và nàng bị giam hãm vào cuộc sống tư sản chật hẹp, buồn tẻ tầm thường nơi tỉnh nhỏ.',N'hinh75.jpg',20,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đỏ Và Đen',60000,N'Đỏ và đen (Le Rouge et le Noir) là tiểu thuyết đầu tiên của Stendhal, được xuất bản vào năm 1830. Tiểu thuyết mô tả về những nỗ lực của một người thanh niên trẻ vượt lên khỏi tầng lớp xã hội dưới của bản thân nhờ tài năng, làm việc chăm chỉ, mánh khóe và đạo đức giả, chỉ tìm thấy chính mình khi bị phản bội bởi chính người yêu của anh ta.',N'hinh76.jpg',30,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Hai Vạn Dặm Dưới Biển',70000,N'Giáo sư Aronnax cùng anh bạn giúp việc vui tính Conseil là những người say mê khám phá sinh vật biển. Họ đã quyết định khám phá bí mật của quái vật biển. Được sự giúp đỡ của anh chàng thợ săn cá voi siêu hạng Ned Land, họ đã sẵn sàng một cuộc đi săn mà không biết có bao điều nguy hiểm đang chờ đợi mình ở phía trước.',N'hinh77.jpg',30,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Bóng Ma Trong Nhà Hát',80000,N'Nhà hát có “ma”??? Nhà hát lớn Paris.Những sự việc lạ lùng liên tiếp xảy ra từ khi các ngài Moncharmin và Richard tiếp quản vị trí: cái chết của trưởng bộ phận dàn dựng sân khấu trong tư thế treo cổ dưới tầng hầm, bức thư nặc danh đe dọa hai tân giám đốc, diva Carlotta bỗng “hát như cóc kêu” trên sân khấu, đèn chùm trong khán phòng rơi đè chết người…',N'hinh78.jpg',10,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Hoàng Tử Bé',90000,N'Tôi cứ sống cô độc như vậy, chẳng có một ai để chuyện trò thật sự, cho tới một lần gặp nạn ở sa mạc Sahara cách đây sáu năm. Có thứ gì đó bị vỡ trong động cơ máy bay. Và vì ở bên cạnh chẳng có thợ máy cũng như hành khách nào nên một mình tôi sẽ phải cố mà sửa cho bằng được vụ hỏng hóc nan giải này. Với tôi đó thật là một việc sống còn. Tôi chỉ có vừa đủ nước để uống trong tám ngày.',N'hinh79.jpg',10,1002,'cdVH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Bá Tước Monte Cristo',60000,N'Sắp được giao trọng trách làm một thuyền trưởng, chuẩn bị cưới nàng Mercédès xinh đẹp dịu dàng, có một người cha hết mực thương yêu, được anh em bè bạn mến phục, tương lai của chàng thanh niên Edmond Dantès thật rạng ngời hạnh phúc. Nhưng số mệnh nghiệt ngã, vẽ nên viễn cảnh tươi sáng để rồi bôi đen tất cả.',N'hinh80.jpg',20,1002,'cdVH')



insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Dữ Liệu Lớn',70000,N'Hiện nay, thế giới đang trở nên thông minh hơn. Chúng ta đang theo dõi và lưu trữ dữ liệu về mọi thứ, nên chúng ta có khả năng tiếp cận với nhiều khối dữ liệu lớn. Tuy nhiên, có rất nhiều vấn đề xoay quanh các khối dữ liệu lớn này. Tất cả chúng ta đều cần phải biết nó là gì và hoạt động như thế nào. ',N'hinh81.jpg',40,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Big Data Tuyển Tập Dữ Liệu Lớn',80000,N'Big Data – Dữ liệu lớn – là thuật ngữ dùng để chỉ một tập hợp dữ liệu rất lớn và rất phức tạp mà những công cụ, ứng dụng xử lí dữ liệu truyền thống không thể nào đảm đương được.',N'hinh82.jpg',40,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'A Revolution That Will Transform How We Live',90000,N'Quyển sách đề cập đến khả năng phát triển của tất cả những chủ thể bao quanh nó, cả tốt lẫn xấu, từ kiến thức, tiện ích cho đến cả nặc danh, giả mạo.. Và cuộc cách mạng Internet này sẽ thay đổi cách chúng ta nghĩ về kinh doanh, sức khỏe, chính trị, giáo dục và đổi mới trong những năm sắp tới. Nó cũng đặt ra các mối đe dọa mới, liệu quyền riêng tư của chúng ta có còn được tôn trọng',N'hinh83.jpg',10,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'The Human Face of Big Data',40000,N'Những hình ảnh và câu chuyện được truyền tải trong The Human Face of Big Data là kết quả của một hành trình dài, công phu về nhận diện mỗi chúng ta trong cuộc cách mạng dữ liệu lớn. Big Data được định nghĩa là thu thập, phân tích và hiển thị thời gian thực của một lượng lớn thông tin.',N'hinh84.jpg',20,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Big Data For Dummies',50000,N'Quản lý dữ liệu lớn là một trong những thách thức to lớn với các tổ chức kinh doanh, công nghiệp và phi lợi nhuận. Dữ liệu được thiết lập như là cách giao dịch của khách hàng đối với nhà bán lẻ, thời tiết đối với các nhà khí tượng học,.. Nếu bạn cần phát triển hoặc quản lý các giải pháp dữ liệu lớn, bạn sẽ đánh giá cao cách bốn chuyên gia định nghĩa, giải thích và hướng dẫn bạn thông qua khái niệm mới và thường gây nhầm lẫn này. ',N'hinh85.jpg',20,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Kẻ Thành Công Phải Biết Lắng Nghe',60000,N'Đồng nghiệp không ưa bạn, khách hàng thất vọng về bạn, hay nhân viên hoài nghi bạn… – làm thế nào bạn có thể khiến những người này làm theo những điều bạn muốn? Trong Hãy lắng nghe, chuyên gia tâm thần học và chuyên gia kinh doanh hàng đầu Mark Goulston mang đến cho độc giả những bí mật giúp tiếp cận tất cả mọi người xung quanh, ngay cả khi những cách thức giao tiếp hiệu quả nhất cũng không đem lại kết quả như mong đợi.',N'hinh86.jpg',30,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Sức Mạnh Của Lắng Nghe',70000,N'Trong kinh doanh, việc không đánh giá đúng vấn đề luôn gây hậu quả nghiêm trọng. Dù các thông tin cần thiết thường có sẵn, người kinh doanh đôi khi không biết làm thế nào để tìm thấy hoặc không nhìn ra vấn đề.nhà sách online Lý do ư ? Kỹ năng lắng nghe kém.',N'hinh87.jpg',30,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đôi Tai Thấu Suốt Thế Gian',80000,N'Cuốn sách giúp bạn nắm bắt và làm chủ được kĩ năng Lắng nghe của bậc thầy giao tiếp. Cuốn sách nằm trong tủ sách Tâm lý kĩ năng của tác giả Oopsy (Tác giả bộ sách Phất tay lung lay thế giới và Cất tiếng làm điếng thế gian).',N'hinh88.jpg',10,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Kỹ Năng Lắng Nghe Trong Giao Tiếp',90000,N'Chúng ta lắng nghe để tìm hiểu sâu sắc hơn.Vì vậy, bằng cách trở thành một người giỏi lắng nghe, bạn không những cải thiện được hiệu quả, cũng như khả năng gây ảnh hưởng/thuyết phục/đàm phán, mà còn tránh được mọi xung đột/hiểu lầm – những yếu tố càn thiết để giúp bạn thành công trong công việc và cuộc sống.',N'hinh89.jpg',10,1003,'cdLT')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Lắng Nghe Tiếng Nói Cơ Thể',60000,N'Con người ta thường mắc bệnh do nhiều nguyên nhân, do sự miễn dịch của cơ thể chưa được hoàn hảo, môi trường xung quanh bị ô nhiễm, hay do thời tiết khắc nghiệt… Nếu không phát hiện và điều trị kịp thời, bệnh có thể sẽ biến chứng và gây nên những hậu quả đáng tiếc.',N'hinh90.jpg',20,1003,'cdLT')


insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Bàn Về Tinh Thần Pháp Luật',70000,N'Bàn về tinh thần pháp luật là tuyệt tác triết học của Montesquieu, là một trong những tác phẩm vĩ đại trong lịch sử triết học chính trị và trong lịch sử luật học. Mục đích cuốn sách, như chính tác giả đã nêu, là: Trình bày những nguyên nhân quyết định nền pháp lý cho mỗi quốc gia; trình bày sự phù hợp cần thiết giữa luật lệ và chế độ cai trị của một nước; trình bày những quan hệ giữa các luật lệ với nhau. Ông đã phải mất gần 20 năm cho tác phẩm này.',N'hinh91.jpg',40,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Bàn Về Khế Ước Xã Hội',80000,N'Khế ước xã hội là tên gọi vắn tắt của bản luận văn lớn mà J. J. Rousseau đặt dưới một nhan đề khá dài: Bàn về khế ước xã hội hay là các nguyên tắc của quyền chính trị (Du Contrat social – ou principes du droit politique).',N'hinh92.jpg',40,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Cộng Hòa',90000,N'Cuốn sách được xem là cột mốc lớn của triết học phương Tây. Tác phẩm được trình bày dưới dạng đối thoại giữa Plato và những người khác. Mặc dù chủ đề chính là về một nhà nước lý tưởng nhưng nó cũng xoay quanh giáo dục, tâm lý, đạo đức và chính trị. ',N'hinh93.jpg',10,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Quân Vương – Thuật Cai Trị',40000,N'Cuốn sách nhỏ của Niccolò Machiavelli đã hội tự những nguyên tắc làm nền móng cho khoa học quản trị nói chung và chính trị học nói riêng.',N'hinh94.jpg',20,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Chính Trị Luận',50000,N'Tác phẩm nổi tiếng viết về các khái niệm mà từ đó định hình các quốc gia và chính phủ. Mặc dù, Aristotle cổ vũ mạnh mẽ cho chế độ nô lệ lạc hậu, quan điểm của ông về Hiến pháp và cách điều hành chính phủ lại rất kinh điển. Dù chỉ thảo luận về nhà nước và các định chế thời Hy Lạp cổ nhưng tác phẩm này của ông đã đặt nền tảng cho khoa học chính trị hiện đại',N'hinh95.jpg',20,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Triết học luật pháp',60000,N'Triết học luật pháp là một dẫn nhập về pháp luật sinh động và dễ tiếp cận. Cuốn sách đề cập và thảo luận về nhiều chủ đề bao gồm quyền của phụ nữ, vấn đề phân biệt chủng tộc, bảo vệ môi trường, bàn về cuộc chiến tranh Iraq và cách đối phó với các nghi phạm khủng bố.',N'hinh96.jpg',30,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Tương Lai Của Quyền Lực',70000,N'Xem giá bán Trong cuốn Tương lai của quyền lực, với lối phân tích gọn gàng chặt chẽ, tác giả đã đưa ra những gợi ý cho việc thảo luận về chủ đề nòng cốt: “Làm thế nào để Hoa Kỳ vẫn giữ được ảnh hưởng tốt đẹp nơi cộng đồng thế giới trong thế kỷ XXI hiện nay?”. ',N'hinh97.jpg',30,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Odyssey',80000,N'Bản anh hùng ca Odyssêy là bức tranh hoành tráng, hào hùng của người Hy Lạp trong cuộc chinh phục thiên nhiên và di dân mở đất. Tác phẩm gồm 12.110 câu thơ, chia làm 24 khúc ca, kể lại hành trình gian nan của Odysseus trên đường trở về quê hương sau khi quân Hy Lạp hạ được thành Troa.',N'hinh98.jpg',10,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Iliad',90000,N'liad được kết hợp bởi truyện truyền khẩu và thần thoại gồm 24 khúc với 15.693 câu thơ, kể về một giai đoạn ngắn vào năm thứ 10 của cuộc chiến thành Troa, về những nỗi uất hận mà vị anh hùng Hy Lạp Achilleus cực chẳng đã phải mang trong lòng, những cảnh ác liệt đẫm máu của chiến trường, sự xung đột sâu sắc của thần linh và mọi thứ như đều nằm dưới bàn tay nghiệt ngã của định mệnh.',N'hinh99.jpg',10,1004,'cdKH')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Chính Trị – Nghề Nghiệp Và Sứ Mệnh',60000,N'Max Weber – Tư tưởng gia người Đức, có vai vai trò nổi bật trong quá trình phát triển môn xã hội học hồi cuối thế kỉ XIX, đầu thế kỉ XX.',N'hinh100.jpg',20,1004,'cdKH')



insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đầu Tư Bất Động Sản',70000,N'Với kinh nghiệm và bài học thực tế từ các nhà đầu tư bất động sản hàng đầu thế giới, nội dung cuốn sách chỉ cho bạn con đường gần nhất, dễ dàng nhất để thành công trong kinh doanh bất động sản cỡ nhỏ. Bạn sẽ khám phá ra cách thức hoàn hảo nhất để kinh doanh bất động sản mà không cần nguốn tài chính lớn, cách đọc hiểu thị trường và mua bất động sản vào thời điểm hợp lý nhất…',N'hinh101.jpg',40,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đầu Tư Quốc Tế',80000,N'Bằng viêc cung cấp tất cả thông tin và chiến lược cần thiết trong đầu tư bất động sản, đây là cuốn cẩm nang thiết thực và toàn diện nhất trong sự nghiệp kinh doanh bất động sản của bạn. Một cuốn sách hữu ích giúp bạn có thể thu lợi nhuận tối đa trong kinh doanh bất động sản…',N'hinh102.jpg',40,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Nhà Đầu Tư Thông Minh',90000,N'Là nhà tư vấn đầu tư vĩ đại nhất của thế kỷ 20, Benjamin Graham đã giảng dạy và truyền cảm hứng cho nhiều người trên khắp thế giới. Triết lý “đầu tư theo giá trị“ của Graham, bảo vệ nhà đầu tư khỏi những sai lầm lớn và dạy anh ta phát triển các chiến lược dài hạn, đã khiến Nhà đầu tư thông minh trở thành cẩm nang của thị trường chứng khoán kể từ lần xuất bản đầu tiên vào năm 1949.',N'hinh103.jpg',10,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đầu Tư Vào Vàng',40000,N'Đầu tư vào vàng bao giờ cũng đúng song những sự kiện kinh tế gần đây càng làm thứ kim loại quý này trở thành một yếu tố quan trọng hơn trong danh mục đầu tư được chỉ định, cũng như một loại hàng hoá đặc biệt tốt cho việc kinh doanh lâu dài.',N'hinh104.jpg',20,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Luật Đầu Tư',50000,N'Nội dung sách bao gồm các văn bản quy phạm pháp luật quy định về hoạt động đầu tư nhằm mục đích kinh doanh; quyền và nghĩa vụ của nhà đầu tư; bảo đảm quyền, lợi ích hợp pháp của nhà đầu tư; khuyến khích và ưu đãi đầu tư; quản lý nhà nước về đầu tư tại Việt Nam và đầu tư từ Việt Nam ra nước ngoài.',N'hinh105.jpg',20,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Sai Lầm Chết Người Trong Đầu Tư',60000,N'Xem giá bán Sai lầm chết người trong đầu tư: Những thương vụ tệ nhất của những nhà đầu tư đỉnh nhất soi rọi ánh sáng khai mở lên những bài học hổ thẹn của hơn một chục nhà đầu tư nổi tiếng nhất thế giới. Nghiên cứu và sao chép những chiến lược và hành vi của các nhà đầu tư thành công để tăng lợi nhuận là một con đường đã mòn cũ, nhưng tìm hiểu những ý tưởng điên rồ và những cơ hội bị bỏ lỡ đã không thể làm chệch đường sự nghiệp hiển hách của họ còn khiến ta vỡ vạc khôn ngoan.',N'hinh106.jpg',30,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Blockchain Và Đầu Tư ICOs Căn Bản',70000,N'Hiện nay, thuật ngữ Blockchain đã trở thành từ khóa tìm kiếm phổ biến tại Việt Nam. Tuy nhiên hầu hết các tài liệu là nước ngoài và gây khó khăn cho độc giả trong việc tiếp cận. Vì sự phát triển của Blockchain Việt Nam và với mục tiêu chia sẻ kiến thức với cộng đồng, trang bị kiến thức cho các nhà đầu tư trẻ trong thị trường tiền tệ số, Satoshi Hunters And Rocking Experts phối hợp với Nhà xuất bản Thanh Niên xuất bản cuốn sách mang tên “Blockchain và đầu tư ICOs căn bản”.',N'hinh107.jpg',30,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đầu Tư – Kế Hoạch 12 Tháng Đến Với Tự Do Tài Chính',80000,N'Danielle Town, con gái của nhà đầu tư thành công và là tác giả cuốn sách tài chính bán chạy nhất Rule #1, Phil Town, đã dành phần lớn cuộc đời trưởng thành của mình để tránh đầu tư cho đến khi cô nhận ra với nghề luật sư tốn thời gian cô không được gì ngoài bị công việc kiểm soát cuộc sống hay tiền bạc của mình. ',N'hinh108.jpg',10,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đầu Tư Phi Lý Trí',90000,N'Thông qua cuốn sách Đầu tư phi lý trí, nhà kinh tế học Terry Burnham lý giải rằng những hành động phi lý của chúng ta là đều là do tác nhân sinh học. Não bộ của con người chứa đựng những tập tính di truyền từ thời tiến hóa cổ xưa mà đến nay chúng ta vẫn bị ảnh hưởng và cư xử theo những tập tính đó một cách hoàn toàn vô thức.',N'hinh109.jpg',10,1005,'cdTruyen')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Đầu Tư Và Kinh Doanh Khách Sạn Hiệu Quả',60000,N'Ngày nay, kinh doanh khách sạn không chỉ đơn thuần là cung cấp dịch vụ phòng ngủ, nhà hàng. Kinh doanh khách sạn còn là việc mang lại trải nghiệm khác biệt cho khách, dù là người đó đi công tác hay đi du lịch, tham quan. Chính vì vậy, lĩnh vực kinh doanh khách sạn cần tạo ra các sản phẩm chất lượng cao. ',N'hinh110.jpg',20,1005,'cdTruyen')



insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Ông Trăm Tuổi Trèo Qua Cửa Sổ Và Biến Mất',70000,N'Vào ngày sinh nhật lần thứ 100 của mình, cụ ông Allan Karlsson đột nhiên trèo qua của sổ ngôi nhà dưỡng lão – Nhà Già – và biến mất. Ở cái tuổi 100 hiếm ai đạt tới thì cụ có thể đi đâu được? Một cuộc truy tìm trên khắp nước Thụy Điển diễn ra từ phía những người có trách nhiệm chăm nom cụ cũng như chính quyền sở tại. ',N'hinh111.jpg',40,1006,'cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Bột Mì Vĩnh Cửu',80000,N'A.Beljaev được đánh giá là “một trong những người đặt nền móng cho loại truyện khoa học viễn tưởng Xô-viết”, với những tác phẩm như: Người bay Ariel, Người cá, Bột mì vĩnh cửu, Đầu giáo sư Dowel…',N'hinh112.jpg',40,1006,'cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Không Gia Đình',90000,N'Không gia đình kể chuyện một em bé không cha mẹ, không họ hàng thân thích, đi theo một đoàn xiếc chó, khỉ, rồi cầm đầu đoàn ấy đi lưu lạc khắp nước Pháp, sau đó bị tù ở Anh, cuối cùng tìm thấy mẹ và em. Em bé Rêmi ấy đã lớn lên trong gian khổ. ',N'hinh113.jpg',10,1006,'cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Hai Số Phận',40000,N'“Hai số phận” (Kane & Abel) là câu chuyện về hai người đàn ông đi tìm vinh quang. William Kane là con một triệu phú nổi tiếng trên đất Mỹ, lớn lên trong nhung lụa của thế giới thượng lưu. Wladek Koskiewicz là đứa trẻ không rõ xuất thân, được gia đình người bẫy thú nhặt về nuôi. Một người được ấn định để trở thành chủ ngân hàng khi lớn lên, người kia nhập cư vào Mỹ cùng đoàn người nghèo khổ.',N'hinh114.jpg',20,1006,'cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Không Theo Lối Mòn',50000,N'Bạn là một đứa trẻ 4 tuổi bỗng nhiên được cho 1 cái kẹo với lời nói: “Nếu con cố gắng giữ không ăn cái kẹo trong vòng 15 phút thì con sẽ được thêm 1 cái kẹo nữa.” Bạn sẽ lựa chọn thế nào? Ăn ngay hay cố gắng chờ đợi?',N'hinh115.jpg',20,1006,'cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Hai Vạn Dặm Dưới Biển',60000,N'Hai Vạn Dặm Dưới Đáy Biển là một cuốn tiểu thuyết giả tưởng hiện đại không chỉ dành cho lứa tuổi thiếu nhi mà còn dành cho mọi thế hệ người đọc.',N'hinh116.jpg',30,1006,'cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Chuyện Con Mèo Dạy Hải Âu Bay',70000,N'Thế giới này đầy những nghịch lý và khác biệt, nhưng bỏ qua những khác biệt đó để hướng đến tình yêu thương thì cuộc sống sẽ tốt đẹp hơn.“Chuyện con mèo dạy hải âu bay” của nhà văn Chi Lê nổi tiếng Luis SéPulveda.là một câu chuyện thấm đẫm tình mèo, tình người như thế.',N'hinh117.jpg',30,1006,'cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Lời Vàng Của Bố',80000,N'Shit My Dad Say – Lời vàng của bố sẽ giúp độc giả hình dung về cuộc sống gia đình người Mỹ trung lưu, không phải cuộc sống trong phim ảnh, mà là cuộc sống thật với vô vàn khó khăn của nó. Đó là các nhà biên kịch tương lai làm bồi bàn trong nhà hàng, và chuyên gia trong lĩnh vực “dược phẩm hạt nhân” làm việc cật lực hàng ngày tới tận tối khuya với rất nhiều áp lực.',N'hinh118.jpg',10,1006,'cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Quẳng Gánh Lo Đi Và Vui Sống',90000,N'Bất kỳ ai đang sống đều sẽ có những lo lắng thường trực về học hành, công việc, những hoá đơn, chuyện nhà cửa,… Cuộc sống không dễ dàng giải thoát bạn khỏi căng thẳng, ngược lại, nếu quá lo lắng, bạn có thể mắc bệnh trầm cảm. Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn hãy khóa chặt dĩ vãng và tương lai lại để sống trong cái phòng kín mít của ngày hôm nay. Mọi vấn đề đều có thể được giải quyết, chỉ cần bạn bình tĩnh và xác định đúng hành động cần làm vào đúng thời điểm.',N'hinh119.jpg',10,1006,'cdNN')
insert into Sach  (TenSach,GiaBan,Mota,Anh ,SoLuong,MaNXB,MaChuDe)values(N'Những Bài Học Cuộc Sống',60000,N'Những bài học cuộc sống có giá trị như một người thầy thông thái về kinh nghiệm sống đối với hàng triệu bạn đọc khắp thế giới. Cuốn sách thể hiện 20 bài học sâu sắc, đúng đắn và có giá trị vĩnh hằng được đúc kết từ những trải nghiệm thực tiễn của một đời người luôn suy tư, trăn trở về cuộc sống. Cuốn sách sẽ giúp chúng ta nhận ra được những điều quan trọng nhất để tạo nên một cuộc sống có ý nghĩa thực sự.',N'hinh120.jpg',20,1006,'cdNN')


insert into VietSach values(1001, 1001,N'Sáng tác',N'Nhà văn Việt Nam')
insert into VietSach values(1002, 1002,N'Sáng tác',N'Nhà văn viết truyện ngắn')
insert into VietSach values(1003, 1003,N'Sáng tác',N'Nhà báo')
insert into VietSach values(1004, 1004,N'Đồng sáng tác',N'Nhà triết học')
insert into VietSach values(1005, 1005,N'Đồng sáng tác',N'Nữ văn sĩ ')
insert into VietSach values(1006, 1006,N'Sáng tác',N'Nhà ngữ văn, tiểu thuyết gia')
insert into VietSach values(1007, 1007,N'Đồng sáng tác',N'Nhà văn và nhà thơ')
insert into VietSach values(1008, 1008,N'Sáng tác',N'Tiểu thuyết gia, thi sĩ, nhà hàn lâm')
insert into VietSach values(1009, 1009,N'Sáng tác',N'Tiểu thuyết gia và là một nhà văn tiểu luận')
insert into VietSach values(1010, 1010,N'Đồng sáng tác',N'Nhà văn lớn viết truyện ngắn')



insert into VietSach values(1011, 1011,N'Sáng tác',N'Nhà báo')
insert into VietSach values(1012,1012,N'Đồng sáng tác',N'Nữ văn sĩ ')
insert into VietSach values(1013, 1013,N'Sáng tác',N'Nhà văn viết truyện ngắn')
insert into VietSach values(1014, 1014,N'Đồng sáng tác',N'Nhà ngữ văn, tiểu thuyết gia')
insert into VietSach values(1015, 1015,N'Sáng tác',N'Nhà văn và nhà thơ')
insert into VietSach values(1016, 1016,N'Đồng sáng tác',N'Tiểu thuyết gia và là một nhà văn tiểu luận')
insert into VietSach values(1017, 1017,N'Sáng tác',N'Tiểu thuyết gia, thi sĩ')
insert into VietSach values(1018, 1018,N'Đồng sáng tác',N'Nhà triết học')
insert into VietSach values(1019, 1019,N'Sáng tác',N'Nhà văn Việt Nam')
insert into VietSach values(1020, 1020,N'Đồng sáng tác',N'Tiểu thuyết gia và là một nhà văn tiểu luận')



insert into VietSach values(1021, 1021,N'Sáng tác',N'Nữ văn sĩ ')
insert into VietSach values(1022, 1022,N'Đồng sáng tác',N'Nhà ngữ văn, tiểu thuyết gia')
insert into VietSach values(1023, 1023,N'Sáng tác',N'Tiểu thuyết gia, thi sĩ')
insert into VietSach values(1024, 1024,N'Đồng sáng tác',N'Nhà văn Việt Nam')
insert into VietSach values(1025, 1025,N'Sáng tác',N'Nhà báo')
insert into VietSach values(1026, 1026,N'Sáng tác',N'Nhà văn lớn viết truyện ngắn')
insert into VietSach values(1027, 1027,N'Đồng sáng tác',N'Tiểu thuyết gia và là một nhà văn tiểu luận')
insert into VietSach values(1028, 1028,N'Sáng tác',N'Nhà triết học')
insert into VietSach values(1029, 1029,N'Đồng sáng tác',N'Nhà văn và nhà thơ')
insert into VietSach values(1030, 1030,N'Đồng sáng tác',N'Nhà văn viết truyện ngắn')




insert into VietSach values(1031, 1031,N'Sáng tác',N'Nhà triết học')
insert into VietSach values(1032, 1032,N'Đồng sáng tác',N'Tiểu thuyết gia, thi sĩ')
insert into VietSach values(1033, 1033,N'Sáng tác',N'Tiểu thuyết gia và là một nhà văn tiểu luận')
insert into VietSach values(1034, 1034,N'Đồng sáng tác',N'Nhà văn lớn viết truyện ngắn')
insert into VietSach values(1035, 1035,N'Đồng sáng tác',N'Nhà văn viết truyện ngắn')
insert into VietSach values(1036, 1036,N'Sáng tác',N'Nhà báo')
insert into VietSach values(1037, 1037,N'Đồng sáng tác',N'Nhà văn Việt Nam')
insert into VietSach values(1038, 1038,N'Sáng tác',N'Nhà văn và nhà thơ')
insert into VietSach values(1039, 1039,N'Đồng sáng tác',N'Nhà ngữ văn, tiểu thuyết gia')
insert into VietSach values(1040, 1040,N'Sáng tác',N'Nữ văn sĩ ')




insert into VietSach values(1041, 1041,N'Sáng tác',N'Nhà văn viết truyện ngắn')
insert into VietSach values(1042, 1042,N'Sáng tác',N'Nhà văn lớn viết truyện ngắn')
insert into VietSach values(1043, 1043,N'Sáng tác',N'Tiểu thuyết gia, thi sĩ')
insert into VietSach values(1044, 1044,N'Sáng tác',N'Nhà triết học')
insert into VietSach values(1045, 1045,N'Sáng tác',N'Tiểu thuyết gia và là một nhà văn tiểu luận')
insert into VietSach values(1046, 1046,N'Đồng sáng tác',N'Nhà văn và nhà thơ')
insert into VietSach values(1047, 1047,N'Đồng sáng tác',N'Nhà ngữ văn, tiểu thuyết gia')
insert into VietSach values(1048, 1048,N'Đồng sáng tác',N'Nhà văn Việt Nam')
insert into VietSach values(1049, 1049,N'Đồng sáng tác',N'Nữ văn sĩ ')
insert into VietSach values(1050, 1050,N'Đồng sáng tác',N'Nhà báo')



insert into VietSach values(1051, 1051,N'Đồng sáng tác',N'Nhà ngữ văn, tiểu thuyết gia')
insert into VietSach values(1052, 1052,N'Đồng sáng tác',N'Nhà văn và nhà thơ')
insert into VietSach values(1053, 1053,N'Đồng sáng tác',N'Tiểu thuyết gia và là một nhà văn tiểu luận')
insert into VietSach values(1054, 1054,N'Đồng sáng tác',N'Nhà văn viết truyện ngắn')
insert into VietSach values(1055, 1055,N'Đồng sáng tác',N'Nhà văn lớn viết truyện ngắn')
insert into VietSach values(1056, 1056,N'Sáng tác',N'Nữ văn sĩ ')
insert into VietSach values(1057, 1057,N'Sáng tác',N'Tiểu thuyết gia và là một nhà văn tiểu luận')
insert into VietSach values(1058, 1058,N'Sáng tác',N'Tiểu thuyết gia, thi sĩ')
insert into VietSach values(1059, 1059,N'Sáng tác',N'Nhà báo')
insert into VietSach values(1060, 1060,N'Đồng sáng tác',N'Nhà văn Việt Nam')

