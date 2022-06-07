DROP database IF EXISTS web;
CREATE DATABASE web;
USE web;


CREATE TABLE `PRODUCT` (
  `id` int AUTO_INCREMENT,
  `type` int,
  `name` varchar(255)  DEFAULT NULL,
  `price` int  DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `content` varchar(10000)  DEFAULT NULL,
  `img` varchar(255)  DEFAULT NULL,
  primary key (id)
);


CREATE TABLE `NEWS` (
  `id` int AUTO_INCREMENT,
  `status` boolean DEFAULT NULL,
  `date` datetime  DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `content` varchar(10000)  DEFAULT NULL,
  `title` varchar(255)  DEFAULT NULL,
  primary key (id)
) ;

CREATE TABLE `CATEGORYNEWS` (
  `id` int AUTO_INCREMENT,
  `name` varchar(255),
  primary key (id)
) ;

CREATE TABLE `ALLNEWS` (
  `id` int AUTO_INCREMENT,
  `status` boolean DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `category_id` int,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `content` mediumtext,
  primary key (id),
  foreign key (category_id) references CATEGORYNEWS(id) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `USER` (
  `phone` varchar(10),
  `profile_photo` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  primary key (phone)
) ;

CREATE TABLE `COMMENT` (
  `id` int AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `approved` BOOLEAN,
  `content` varchar(10000),
  `news_id` int,
  `user_id` varchar(255),
  `parent` int DEFAULT NULL,
  primary key (id),
  foreign key(news_id) references NEWS(id) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key(user_id) references USER(phone) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE `COMMENT`
ADD foreign key (parent) references COMMENT(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `ADMIN` (
  `username` varchar(255),
  `password` varchar(255) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  primary key (username)
);

CREATE TABLE `COMPANY` (
  `id` int AUTO_INCREMENT,
	`name` varchar(255),
  `address` varchar(1000) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  primary key(id)
);


-- Example data 
INSERT INTO `ADMIN` (username, password) VALUES ('admin', '');
INSERT INTO `ADMIN` (username, password) VALUES ('username', '');

INSERT INTO `USER` (phone, password, fname, lname, day, month, year, gender)
VALUES ('123456789', '123456789', 'TRAN TRUNG', 'TUAN', 1, 1, 1, 'Nam');

-- INSERT INTO `USER` (email, fname, lname, gender, age, phone, password)
-- VALUES ('user@hcmut.edu.vn', 'Nguyen Van', 'B', 0, 30, '0123456789', '');

INSERT INTO PRODUCT (type, price, name, description)
VALUES (1, 5000, 'ST5K', '500MB sử dụng đến 24h ngày đăng ký (gia hạn tự động)');

INSERT INTO PRODUCT (type, price, name, description)
VALUES (1, 10000, 'ST10K', '2GB sử dụng đến 24h00 ngày đăng ký');

INSERT INTO PRODUCT (type, price, name, description)
VALUES (1, 15000, 'ST15K', '3GB tốc độ cao sử dụng trong 3 ngày (gia hạn tự động)');

INSERT INTO PRODUCT (type, price, name, description)
VALUES (1, 10000, 'ECOD10', '500MB sử dụng trong 30 ngày (trả trước), hết tháng (trả sau).');

INSERT INTO PRODUCT (type, price, name, description)
VALUES (1, 20000, 'ECOD20', '1.5GB sử dụng trong 30 ngày (trả trước), hết tháng (trả sau).');

INSERT INTO PRODUCT (type, price, name, description)
VALUES (1, 5000, 'DC5', '1GB trong 24h kể từ thời điểm đăng ký');

INSERT INTO PRODUCT (type, price, name, description)
VALUES (2, 500000, 'D500T', 'Có 60GB data tốc độ cao. Chu kỳ 360 ngày.');

INSERT INTO PRODUCT (type, price, name, description)
VALUES (2, 70000, 'V70C', 'Có 500MB/ngày data tốc độ cao. Chu kỳ 30 ngày.');

INSERT INTO PRODUCT (type, price, name, description, content, img)
VALUES (3, 0, 'Gọi có hình', 
'Gọi Quốc tế có hình (Video call quốc tế) là dịch vụ giúp khách hàng của Viettel có thể 
nhìn thấy hình ảnh trực tiếp của người nhận cuộc gọi.',
'<ul class="list-group list-group-flush">
	<li class="list-group-item">
		<h3 class="product-detail-title">Lợi ích khi sử dụng dịch vụ</h3>
		<p>Chất lượng hình ảnh rõ nét và âm thanh chất lượng cao giúp truyền tải chân thực cảm xúc của người nghe và người gọi. Tiết kiệm chi phí cho khách hàng với phương thức tính cước 6 giây + 1 giây.</p>
	</li>
	<li class="list-group-item">
		<h3 class="product-detail-title">Cách gọi</h3>
		<p>Quý khách có thể tra mã quốc gia và vùng lãnh thổ được gọi theo quy định của gói cước gọi quốc tế VoIP: [00] + [Mã quốc gia] + [Mã vùng] + [Số điện thoại]</p>
	</li>
	<li class="list-group-item">
		<h3 class="product-detail-title">Giá cước</h3>
		<p>Cước sử dụng dịch vụ: 8.000 đ/phút (đã bao gồm 10% VAT)</p>
	</li>
</ul>',
"public/img/products/inter-video-call.png");

INSERT INTO PRODUCT (type, price, name, description, content, img)
VALUES (3, 0, 'Gọi thông thường', 
'Giữ liên lạc với bạn bè, người thân và đối tác nước ngoài dù bạn ở bất kỳ đâu trên lãnh 
thổ Việt Nam với giá cước tốt nhất và chất lượng tốt nhất.',
'<ul class="list-group list-group-flush">
	<li class="list-group-item">
		<h3 class="product-detail-title">Đối tượng sử dụng</h3>
		<p>Khách hàng đang sử dụng dịch vụ di động, dịch vụ cố định của Viettel</p>
	</li>
	<li class="list-group-item">
		<h3 class="product-detail-title">Lợi ích khi sử dụng dịch vụ</h3>
		<p>Viettel cam kết luôn cung cấp dịch vụ Thoại Quốc tế với chất lượng thoại tốt nhất, đảm bảo trung thực và thời gian kết nối nhanh nhất. Khách hàng có thể thực hiện cuộc gọi thoại quốc tế từ bất kỳ thuê bao điện thoại nào của Viettel với cách quay số đơn giản.</p>
	</li>
	<li class="list-group-item">
		<h3 class="product-detail-title">Đăng ký/Hủy dịch vụ</h3>
		<p>Quý khách soạn tin nhắn QT OFF hoặc QT ON gửi 133 (miễn phí tin nhắn) để hủy/đăng ký dịch vụ.</p>
	</li>
</ul>',
"public/img/products/inter-call.png");

INSERT INTO PRODUCT (type, price, name, description, content, img)
VALUES (3, 0, 'MMS quốc tế', 
'Dịch vụ tin nhắn đa phương tiện quốc tế giúp khách hàng thuê bao di động của Viettel gửi 
và nhận tin nhắn đa phương tiện (file văn bản, hình ảnh, âm thanh) tới các thuê bao điện thoại 
(di động, cố định,…) thuộc các quốc gia và vùng lãnh thổ khác trên thế giới.',
'<ul class="list-group list-group-flush">
	<li class="list-group-item">
		<h3 class="product-detail-title">Lợi ích khi sử dụng dịch vụ</h3>
		<p>Quý khách có thể gửi, chia sẻ tin nhắn văn bản, hình ảnh, video chất lượng đến các thuê bao quốc tế với thời gian nhanh nhất. Quý khách có thể sử dụng dịch vụ MMS quốc tế tại bất kỳ thời điểm nào và bất cứ địa điểm nào, dù đang ở tại Việt Nam hay tại nước ngoài.</p>
	</li>
	<li class="list-group-item">
		<h3 class="product-detail-title">Hướng dẫn sử dụng</h3>
		<p>Để gửi tin nhắn MMS quốc tế, quý khách làm theo hướng dẫn sau: [+] + [Mã quốc gia] + [Mã vùng] + [Số điện thoại]</p>
	</li>
</ul>',
"public/img/products/MMS.png");

INSERT INTO PRODUCT (type, price, name, description, content, img)
VALUES (3, 0, 'SMS quốc tế', 
'Dịch vụ giúp khách hàng gửi tin nhắn (SMS) tới thuê bao di động thuộc các quốc gia và vùng 
lãnh thổ trên thế giới. Dịch vụ được hỗ trợ kết nối tới tất cả các mạng viễn thông/di động, do 
đó khách hàng có thể dễ dàng liên lạc với bạn bè, người thân, đối tác ở bất kỳ nơi nào trên thế 
giới một cách đơn giản và nhanh chóng nhất.',
'<ul class="list-group list-group-flush">
	<li class="list-group-item">
		<h3 class="product-detail-title">Lợi ích khi sử dụng dịch vụ</h3>
		<p>Tin nhắn quốc tế được gửi đi và đảm bảo tới đích với thời gian nhanh nhất. Quý khách có thể gửi tin nhắn SMS quốc tế tại bất kỳ thời điểm nào và bất cứ địa điểm nào, dù đang ở tại Việt Nam hay tại nước ngoài.</p>
	</li>
	<li class="list-group-item">
		<h3 class="product-detail-title">Hướng dẫn sử dụng</h3>
		<p>Gửi tin nhắn SMS quốc tế đến thuê bao di động: [+] + [Mã quốc gia] + [Số điện thoại]</p>
	</li>
</ul>',
"public/img/products/SMS.png");

INSERT INTO `NEWS` (status, date, title, description, content)
VALUES (1, '2021-11-11', 'Ca nhiễm tăng, TP.HCM kiểm soát di biến động dân cư ra sao?', 
'TTO - TP.HCM không lập lại các chốt kiểm soát để kiểm tra di biến động dân cư như trước đây. Tuy vậy người dân từ các tỉnh thành đến TP.HCM sẽ phải đăng ký tạm trú tạm vắng để địa phương có biện pháp kiểm soát.',
'UBND TP.HCM yêu cầu tăng cường kiểm soát chặt chẽ di biến động dân cư. Các địa phương phải nắm chắc tình hình người dân khi ra, vào địa bàn, người có nguy cơ đang lưu trú, làm việc tại các địa phương, doanh nghiệp như lái xe, phụ xe liên tỉnh, người làm việc ngoài tỉnh về địa phương lưu trú… Từ đó sẽ chủ động các biện pháp quản lý phù hợp.
Tuy nhiên trước chủ trương này của thành phố, nhiều người dân bày tỏ sự băn khoăn, không biết liệu thành phố có lập lại các chốt kiểm soát và cần phải chuẩn bị những thủ tục gì khi đến TP.HCM.
Trao đổi về vấn đề này, thượng tá Lê Mạnh Hà - phó trưởng Phòng tham mưu Công an TP.HCM - cho biết TP.HCM không lập lại các chốt kiểm soát để kiểm tra di biến động dân cư như trước đây.
Theo thượng tá Hà, biến động dân cư được hiểu là sự thay đổi về dân cư, thường trú, tạm trú, không phải là lực lượng chức năng kiểm soát người dân đi lại ở các chốt.
Hiện nay Công an TP.HCM đang thực hiện các công tác quản lý di biến động dân cư như: đăng ký thường trú, tạm trú, rà soát hộ khẩu, những ai có mặt thực tế ở địa phương. Công an TP cũng đang rà soát, đối sánh các dữ liệu dân cư, cấp mã số định danh cá nhân.
Bên cạnh đó ngành công an cũng đang kiểm tra diện thường trú, tạm trú, những người đang lưu trú ở khách sạn, nhà nghỉ... khai báo để quản lý chặt chẽ và thực hiện các chính sách an sinh xã hội.');
INSERT INTO `NEWS` (status, date, title, description, content)
VALUES (1, '2021-11-11', '50% ca tử vong ở TP.HCM chưa tiêm vắc xin, thành phố đang "đánh chặn" số ca chuyển nặng', 
'TTO - Với việc ban hành hướng dẫn gói chăm sóc sức khỏe cho F0 cách ly tại nhà phiên bản 1.6, ngành y tế TP.HCM cho thấy quyết tâm tập trung "đánh chặn từ xa" bằng việc kiểm soát F0 cách ly tại cộng đồng không để trở nặng.',
'Không phải F0 nào cũng cách ly tại nhà
Theo thống kê, trong tổng số ca F0 hiện tại có khoảng 70% trường hợp có triệu chứng nhẹ, hoặc không có triệu chứng đang được cách ly chăm sóc tại nhà hoặc khu cách ly tập trung. Làm gì để giảm số ca mắc chuyển nặng? Hướng dẫn mới nhất từ TP.HCM được "chi tiết hóa" từ phân loại người F0 nào được cách ly ở nhà; chăm sóc ra sao; nên và không nên làm gì; dấu hiệu cần báo ngay cho y tế và kê đơn, cấp cứu F0 tại nhà...
Hướng dẫn lần này quy định rõ hơn về đối tượng được chăm sóc tại nhà khi đảm bảo đủ 2 điều kiện bao gồm không triệu chứng hoặc triệu chứng nhẹ (không có suy hô hấp SpO2 lớn hơn hoặc bằng 96% khi thở khí trời, nhịp thở bằng hoặc dưới 20 lần/phút). Chỉ những F0 có độ tuổi từ 1 - 50 tuổi, không có bệnh nền, không đang mang thai, không béo phì mới được cách ly ở nhà.
Ngoài ra quy định này chỉ cho phép một số trường hợp không thỏa các điều kiện nêu trên có thể xem xét cách ly ở nhà nếu có bệnh nền ổn định, bảo đảm tiêm đủ 2 mũi vắc xin hoặc sau 14 ngày kể từ ngày tiêm mũi đầu tiên.
TP Thủ Đức (TP.HCM) là một trong các địa phương được ghi nhận có số ca mắc tăng nhanh gần đây. Ông Nguyễn Văn Chức - giám đốc Trung tâm Y tế TP Thủ Đức - cho biết để "đánh chặn từ xa", ngoài 32 trạm y tế cố định, các trạm y tế lưu động, các phường triển khai tổ y tế lưu động đến từng khu phố (trước đây là phường) để kịp thời xử lý các ca F0 chuyển nặng. "Tổ lưu động của từng khu phố khá đông, bao gồm đủ các ban ngành từ y tế, đoàn thanh niên, dân quân, giáo dục, thành ra việc phản ứng và tiếp cận sẽ được gần người dân hơn" - ông Chức nói.');

-- INSERT INTO `COMMENT` (news_id, user_id, date, approved, content)
-- VALUES (1, 'admin@hcmut.edu.vn', '2021-12-12', 1, 'Bất ngờ quá');
-- INSERT INTO `COMMENT` (news_id, user_id, date, approved, content)
-- VALUES (1, 'admin@hcmut.edu.vn', '2021-12-12', 1, 'Bất ngờ quá');
-- INSERT INTO `COMMENT` (news_id, user_id, date, approved, content)
-- VALUES (2, 'user@hcmut.edu.vn', '2021-12-12', 0, 'Không thể tin được');

INSERT INTO `COMPANY` (name, address)
VALUES ('Chi nhánh TPHCM', '268 Lý Thường Kiệt, Phường 14, Quận 10, TPHCM');
INSERT INTO `COMPANY` (name, address)
VALUES ('Chi nhánh Hà Nội', 'Hà Nội');

INSERT INTO `CATEGORYNEWS` (name)
VALUES ('Hoạt động kinh doanh');
INSERT INTO `CATEGORYNEWS` (name)
VALUES ('Thông cáo báo chí');
INSERT INTO `CATEGORYNEWS` (name)
VALUES ('Đấu thầu');
INSERT INTO `CATEGORYNEWS` (name)
VALUES ('Trách nhiệm xã hội');
INSERT INTO `CATEGORYNEWS` (name)
VALUES ('Tin báo chí');

INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news01.webp', 2, 
  'Viettel đứng đầu top 50 doanh nghiệp xuất sắc nhất Việt Nam', 
  'Hà Nội, ngày 14/01/2022, Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel) và 4 đơn vị thành viên được vinh danh tại Lễ công bố Top 50 Doanh nghiệp xuất sắc nhất Việt Nam và Top 500 Doanh nghiệp lớn nhất Việt Nam (VNR500) do Vietnam Report và Báo VietnamNet tổ chức.', 
  '2022-01-14', 
  '<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Theo đó, năm 2021 Viettel giữ vị trí hàng đầu trong bảng xếp hạng (BXH) 50 Doanh nghiệp xuất sắc nhất Việt Nam (Top 50 Vietnam The Best). Bảng xếp hạng Top 50 doanh nghiệp xuất sắc nhất Việt Nam ghi nhận và tôn vinh các &nbsp;Doanh nghiệp đạt doanh thu xuất sắc nhất Việt&nbsp;Nam, đồng thời duy trì được hiệu quả kinh doanh ổn định và bền vững trong&nbsp;suốt giai đoạn 2020-2021. Bảng xếp hạng nhằm phát triển các doanh nghiệp trở thành biểu tượng có uy tín quốc gia và quốc tế.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Để đứng ở vị trí này, Viettel đã có tên trong BXH VNR500 5 năm liên tiếp, có tốc độ tăng trưởng tốt trong 5 năm liên tiếp (theo chỉ số CAGR), các tiêu chí khác về: số thuế đóng góp cho ngân sách nhà nước, môi trường làm việc, trách nhiệm xã hội...đều được ghi nhận.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Trong năm 2021, Viettel, với hơn 40 nghìn lao động, là doanh nghiệp có kết quả kinh doanh tốt nhất trong ngành với doanh thu đạt 274 nghìn tỷ, tăng trưởng 3,3%, lợi nhuận đạt 40,1 nghìn tỷ, nộp ngân sách gần 32 nghìn tỷ.&nbsp;&nbsp;</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Năm 2021, giá trị thương hiệu Viettel tăng 32 bậc với giá trị 6,061 tỷ USD, đứng thứ 325 toàn cầu và là lần thứ 6 liên tiếp Viettel giữ vị trí số 1 trong Top 50 thương hiệu giá trị nhất Việt Nam. Viettel cũng tiếp tục được vinh danh là nơi làm việc tốt nhất Việt Nam trong lĩnh vực Công nghệ phần cứng - Hạ tầng - Viễn thông.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Tại Top 500 Doanh nghiệp lớn nhất Việt Nam (VNR500) năm nay ghi nhận sự phát triển của các đơn vị thành viên của Viettel với những dấu ấn nổi bật.&nbsp; Trong đó Tổng Công ty Cổ phần Đầu tư Quốc tế Viettel (Viettel Global) lần đầu tiên góp mặt ở vị trí 59; Tổng Công ty CP Bưu chính Viettel (Viettel Post) ở vị trí 76, tăng tới 93 bậc so với năm 2020;</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Tại Công ty TNHH Nhà nước MTV thương mại và xuất nhập khẩu Viettel (Viettel Commerce) duy trì ở vị trí &nbsp;119; Tổng Công ty CP Công trình Viettel (Viettel Construction) được xếp hạng 192, tăng 51 bậc so với năm 2020.</span></span></span></p>

<p style="text-align:justify">&nbsp;</p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news02.webp', 2, 
  'Viettel và Quân chủng Hải quân ký kết chương trình phối hợp giai đoạn 2022-2025', 
  'Hà Nội, ngày 20 tháng 01 năm 2022 - Tại Trụ sở Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), Quân chủng Hải Quân (QCHQ) và Tập đoàn Viettel đã ký kết Chương trình phối hợp giai đoạn 2022 – 2025.', 
  '2022-01-21', 
  '<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:13.0pt"><span style="background-color:white"><span style="font-family:Sarabun">Theo đó, Viettel và QCHQ hợp tác nghiên cứu sản xuất các trang bị kỹ thuật (TBKT) mới, đặc biệt là TBKT </span></span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">công nghệ cao,</span></span><span style="font-size:13.0pt"><span style="background-color:white"><span style="font-family:Sarabun"> đồng thời cải tiến, hiện đại hóa, sửa chữa khôi phục TBKT hiện có phục vụ cho các hoạt động của Hải quân. </span></span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">Chương trình bám sát phương hướng, mục tiêu, quan điểm chỉ đạo của Quân ủy Trung ương, </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">Bộ Quốc phòng;</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun"> phù hợp với khả năng, năng lực của Viettel và nhu cầu bảo đảm TBKT của QCHQ.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Chứng kiến Lễ ký kết, Thượng tướng Phạm Hoài Nam, Ủy viên Trung ương Đảng, Thứ trưởng Bộ Quốc phòng chỉ đạo QCHQ và Viettel phối hợp chặt chẽ, đẩy nhanh quá trình làm chủ và đưa vào trang bị cho Hải quân những TBKT hiện đại. Hoạt động này cũng sẽ giúp QCHQ cải tiến, đảm bảo kỹ thuật cho các TBKT hiện có đáp ứng yêu cầu tác chiến trong tình hình mới.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Chuẩn đô đốc Trần Thanh Nghiêm, Ủy viên Trung ương Đảng, Tư lệnh QCHQ cho biết các trang bị của Viettel đã được QCHQ đưa vào sử dụng đều tương đương với những sản phầm quốc phòng hiện đại trên thế giới có trong biên chế của Hải quân. Với chương trình phối hợp giữa 2 bên trong giai đoạn 2022-2025, QCHQ đặt niềm tin rất lớn vào Viettel trong việc hiện đại hóa TBKT công nghệ cao của Hải quân.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Theo Đại tá Tào Đức Thắng, Chủ tịch kiêm Tổng giám đốc Viettel, trong thời gian qua, Viettel đã chứng minh được năng lực tự chủ, khả năng chủ động hợp tác quốc tế trong nghiên cứu sản xuất các sản phẩm quốc phòng. Viettel đã từng bước xây dựng được cơ sở vật chất, hạ tầng đồng bộ, hiện đại và nhân lực chất lượng cao phục vụ phát triển công nghiệp quốc phòng công nghệ cao.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Hiện tại Viettel đã làm chủ hệ thống sản xuất hơn 40 chủng loại khí tài, TBKT công nghệ cao cho các </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">q</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">uân chủng Hải quân, Lục quân và Phòng không - Không quân. Thời gian tới, Viettel</span></span> <span style="font-size:13.0pt"><span style="font-family:Sarabun">tiếp tục phát triển các thiết bị thế hệ mới thông minh, chính xác, tin cậy hơn, ứng dụng công nghệ cốt lõi của cuộc cách mạng 4.0, phù hợp với yêu cầu tác chiến hiện đại của QCHQ nói riêng và Quân đội nói chung.</span></span></span></span></p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news03.webp', 4, 
  'Viettel đưa ''Sóng và máy tính'' ra ngoài biên giới Việt Nam', 
  '200 máy tính bảng do Viettel tài trợ đã đến tay các bạn học sinh Trường THPT Hoải Sán, bản Hoải Sán, huyện Sepon, tỉnh Savannakhet, Lào.', 
  '2022-01-24', 
  '<p>Trong khuôn khổ Chương trình Giao lưu hữu nghị quốc phòng biên giới Việt Nam – Lào lần thứ nhất vào tháng 12/2021, Đoàn đại biểu Việt Nam do Đại tướng Phan Văn Giang, Ủy viên Bộ chính trị, Phó Bí thư Quân ủy Trung ương, Bộ trưởng Bộ Quốc phòng làm trưởng đoàn đã đến thăm và tặng quà cho học sinh Trường THPT Hoải Sán, bản Hoải Sán, huyện Sepon, tỉnh Savannakhet.</p>

<p>Món quà là 200 máy tính bảng Samsung do Tập đoàn Công nghiệp – Viễn thông Quân đội tài trợ.</p>

<p>Ngay sau khi nhà trường tiếp nhận món quà từ Bộ trưởng, Công ty Star Telecom (Unitel) đã tổ chức trao tặng 200 sim 4G cho các em học sinh với chính sách miễn phí 2 Gb data/ngày trong thời gian 3 năm để học trực tuyến (Tổng số tiền tài trợ là 866.000 USD).</p>

<p>Unitel cũng tổ chức hướng dẫn thầy cô và các em học sinh sử dụng miễn phí ứng dụng LaoApp để truy cập nền tảng giáo dục trực tuyến Ustudy (Hiện có 100.000 tài khoản đăng ký và sử dụng) phục vụ cho công việc giảng dạy và học tập tại nhà trường.&nbsp;</p>

<p><img alt="" src="https://cdnvtfamily.keeng.net/uploads/viettelfamily/144/unitel-2-2.jpg"></p>

<p>Trước đó, Unitel cũng đã bổ sung và nâng cấp 6 trạm phát sóng tại khu vực Trường THPT Hoải Sán và các bản làng có học sinh của nhà trường nhằm phủ sóng 100% các vùng lõm, giúp các em có thể truy cập và tham gia học tập được một cách thuận tiện nhất.</p>

<p>Phát biểu trong lễ tiếp nhận quà tặng từ Unitel, thầy Philavan Outhaphone – Hiệu trưởng nhà trường gửi lời cảm ơn chân thành nhất tới đồng chí Bộ trưởng Quốc phòng Việt Nam và Unitel đã trao tặng 200 máy tính bảng cùng sim, gói cước data rất ưu đãi và ứng dụng học tập tiện ích cho học sinh nhà trường.</p>

<p>Hiện tại, cơ sở vật chất của nhà trường còn nhiều thiếu thốn, quá trình dạy và học của thầy trò còn gặp nhiều khó khăn. Món quà ý nghĩa này sẽ giúp ích rất nhiều cho công tác dạy và học của nhà trường.</p>

<p><img alt="" src="https://cdnvtfamily.keeng.net/uploads/viettelfamily/144/unitel-1.jpg"></p>

<p>Trong hơn 12 năm kinh doanh tại thị trường Lào, Unitel đã luôn thực hiện triết lý “kinh doanh gắn liền với trách nhiệm xã hội”. Công ty đã tài trợ hơn 13 triệu USD cho Chính phủ Lào để hỗ trợ người dân khắc phục các hậu quả do lũ lụt, nâng cao chất lượng cuộc sống, phòng chống dịch covid-19,… Đối với lĩnh vực giáo dục, hàng năm Unitel đều dành chính sách hỗ trợ đặc biệt như: tài trợ internet miễn phí cho hơn 1.000 trường học trên toàn quốc trị giá 1 triệu USD; giảm giá 50% các gói cước dành cho giáo viên, học sinh; tặng học bổng cho học sinh nghèo hiếu học;...</p>

<p>Với các hoạt động đã triển khai, Unitel mong muốn các em học sinh không bị gián đoạn việc học tập vì dịch bệnh, giúp nâng cao chất lượng giảng dạy và học tập, giúp chắp cánh ước mơ tri thức cho các em học sinh và góp phần thúc đẩy sự phát triển của đất nước Lào.</p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news04.webp', 5, 
  'Đại tướng Phan Văn Giang thăm, kiểm tra Tập đoàn Viettel', 
  'Chiều 26-1, tại Hà Nội, Đại tướng Phan Văn Giang, Ủy viên Bộ Chính trị, Phó bí thư Quân ủy Trung ương, Bộ trưởng Bộ Quốc phòng làm trưởng đoàn công tác đã đến thăm, kiểm tra Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel).', 
  '2022-01-27', 
  '<p>Cùng đi với Bộ trưởng Phan Văn Giang&nbsp;có các đồng chí: Thượng tướng Phạm Hoài Nam, Ủy viên Trung ương Đảng, Thứ trưởng Bộ Quốc phòng; Thượng tướng Đỗ Căn, Phó chủ nhiệm Tổng cục Chính trị; Trung tướng Nguyễn Văn Nghĩa, Phó tổng Tham mưu trưởng; đại diện các tổng cục và cơ quan chức năng Bộ Quốc phòng.</p>

<p>Thay mặt lãnh đạo Tập đoàn Viettel, Đại tá Tào Đức Thắng, Chủ tịch kiêm Tổng giám đốc tập đoàn, báo cáo với đồng chí Bộ trưởng Bộ Quốc phòng kết quả thực hiện nhiệm vụ năm 2021 của tập đoàn. Theo đó, trong năm qua, mặc dù dịch Covid-19 diễn biến phức tạp, song cán bộ, nhân viên của tập đoàn đã nỗ lực phấn đấu, hoàn thành tốt các nhiệm vụ được giao; đạt doanh thu 274 nghìn tỷ đồng, mức tăng trưởng đạt 3,3%, lợi nhuận đạt 40,1 nghìn tỷ đồng, tăng trưởng 2,0%, nộp ngân sách Nhà nước gần 32 nghìn tỷ đồng.</p>

<p><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/01/27/dsc_0433.jpeg" style="height:667px; width:1000px"></span></span><em>Đại tướng Phan Văn Giang ghi nhận và đánh giá cao những nỗ lực của CBNV Viettel, đặc biệt giai đoạn 2020 - 2021.&nbsp;</em></p>

<p>Ở lĩnh vực viễn thông, các thị trường nước ngoài có sự tăng trưởng vượt bậc, trong đó châu Phi đạt kỷ lục về tăng trưởng ở mức 37%. Tại Việt Nam, Viettel vẫn duy trì vị thế dẫn đầu và là nhà mạng có chất lượng tốt nhất. Ở lĩnh vực giải pháp số, Viettel đã triển khai thần tốc các giải pháp, nền tảng số phục vụ công tác điều hành phòng chống, dịch của Chính phủ.</p>

<p>Mô hình thành phố thông minh của Viettel được vinh danh hiệu quả và đạt Giải thưởng Quốc tế WCA 2021. Hiện tại, 30 tỉnh, thành phố ký kết thỏa thuận hợp tác với Tập đoàn Viettel trong việc ứng dụng công nghệ xây dựng thành phố thông minh. Ở lĩnh vực nghiên cứu sản xuất và công nghiệp công nghệ cao, năm 2021, Tập đoàn Viettel đã triển khai thử nghiệm mạng 5G hoàn chỉnh gồm mạng lõi, mạng truyền dẫn, mạng vô tuyến trên mạng lưới của Viettel; đồng thời hoàn thiện hệ sinh thái hạ tầng viễn thông 5G. Viettel trở thành nhà mạng duy nhất trên thế giới nghiên cứu, sản xuất thành công mạng 5G, phục vụ chiến lược chuyển đổi số quốc gia.</p>

<p>Các tổ chức quốc tế ghi nhận Tập đoàn Viettel là doanh nghiệp công nghệ có số lượng đơn đăng ký và số bằng được cấp hằng năm nhiều nhất tại Việt Nam (đăng ký 386, đã cấp 51), trong đó có 9 sáng chế được cấp tại Mỹ. Tập đoàn Viettel cũng được công nhận là doanh nghiệp Việt Nam có sức ảnh hưởng nhất về đổi mới sáng tạo năm 2021 khu vực Nam Á và Đông Nam Á.</p>

<p>Ở lĩnh vực chuyển phát, logistics và thương mại điện tử của Tập đoàn Viettel có nhiều chuyển biến tích cực. Trong đó Viettel đã đưa hơn 25 nghìn hộ sản xuất nông nghiệp lên sàn thương mại điện tử, góp phần vào thực hiện chiến lược chuyển đổi số quốc gia trong lĩnh vực nông nghiệp. Ngoài ra, Viettel cũng tích cực chung tay cùng cả nước phòng, chống dịch Covid-19, với hơn 31 nghìn tấn hàng hóa được hỗ trợ vận chuyển và cung ứng đến người dân vùng dịch.</p>

<p><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/01/27/dsc_0746.jpg" style="height:734px; width:1000px"></span></span><em>Đại tướng Phan Văn Giang: "Chúc Viettel mãi mãi là tập đoàn mạnh của Quân đội, của Nhà nước"</em></p>

<p>Trong năm 2022, Viettel tiếp tục đặt ra mục tiêu tăng trưởng cao, tập trung xây dựng hạ tầng số, nền tảng số, hoàn thành nghiên cứu, sản xuất các sản phẩm công nghệ cao, đưa ra kinh doanh trên thị trường trong và ngoài nước.</p>

<p>Phát biểu chỉ đạo tại buổi làm việc, Đại tướng Phan Văn Giang cho rằng, Tập đoàn Viettel đã thực hiện tốt nhiệm vụ quân sự, quốc phòng cũng như nhiệm vụ sản xuất kinh doanh. Những kết quả đó thể hiện trách nhiệm, trình độ, trí tuệ và sự đoàn kết, sáng tạo của đội ngũ cán bộ, kỹ sư, công nhân viên của tập đoàn. Thay mặt Quân ủy Trung ương, thủ trưởng Bộ Quốc phòng, Đại tướng Phan Văn Giang ghi nhận, đánh giá cao và nhiệt liệt biểu dương sự nỗ lực phấn đấu và những kết quả đạt được của Tập đoàn Viettel trong năm 2021.&nbsp;</p>

<p>Cho rằng nhiệm vụ trong năm 2022 đặt ra với quân đội nói chung, Tập đoàn Viettel nói riêng hết sức nặng nề; trong đó hoạt động sản xuất, kinh doanh của tập đoàn tiếp tục chịu sự cạnh tranh cao, Đại tướng Phan Văn Giang yêu cầu cán bộ, công nhân viên của tập đoàn tiếp tục phát huy tính năng động, sáng tạo, song không chủ quan, nóng vội, tập trung nghiên cứu và phát triển các sản phẩm có hàm lượng khoa học cao, mang tính đặc thù và phù hợp với nhiệm vụ của quân đội.</p>

<p>Cùng với yêu cầu phải không ngừng đổi mới tư duy, nhất là trong sản xuất kinh doanh, Bộ trưởng Phan Văn Giang đề nghị Tập đoàn Viettel quan tâm hơn đến hoạt động quảng bá sản phẩm, giữ vững và mở rộng thị trường; đồng thời chú trọng bảo đảm chất lượng các sản phẩm nói chung và sản phẩm phục vụ hoạt động huấn luyện, SSCĐ của toàn quân nói riêng.</p>

<p><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/01/27/dsc_0975.jpg" style="height:557px; width:1000px"></span></span><em>Đại tướng Phan Văn Giang trao quà Tết tặng Tập đoàn Viettel.&nbsp;</em></p>

<p>Cùng với nhấn mạnh vai trò của hoạt động công tác Đảng, công tác chính trị, Đại tướng Phan Văn Giang yêu cầu Tập đoàn Viettel cần tiếp tục quan tâm chăm lo xây dựng nguồn nhân lực phù hợp với yêu cầu, nhiệm vụ, nhất là xây dựng đội ngũ cán bộ chủ trì các cấp; thực hiện nghiêm nguyên tắc tập trung dân chủ, coi trọng tự phê bình và phê bình; xây dựng tổ chức đảng các cấp trong sạch, vững mạnh.</p>

<p>Nhân dịp chuẩn bị đón Tết Nguyên đán Nhâm Dần, thay mặt Quân ủy Trung ương, Bộ Quốc phòng, Đại tướng Phan Văn Giang trao tặng quà Tết và chúc Tập đoàn Viettel tiếp tục đoàn kết, thống nhất, hoàn thành xuất sắc mọi nhiệm vụ được giao, xứng đáng là một tập đoàn lớn và mãi mãi là một tập đoàn lớn của quân đội và đất nước.</p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news05.webp', 1, 
  'Giá trị thương hiệu Viettel đạt gần 9 tỷ USD', 
  'Giá trị thương hiệu Viettel vừa được Brand Finance – công ty định giá thương hiệu hàng đầu thế giới định giá 8,758 tỷ USD (tăng 2,697 tỷ USD, gần 45% so với năm 2021).', 
  '2022-02-07', 
  '<ul>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:12.0pt"><span style="font-family:Sarabun">Viettel đứng thứ 18 thế giới về giá trị thương hiệu viễn thông</span></span></strong></span></span></li>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:12.0pt"><span style="font-family:Sarabun">Viettel tiếp tục là thương hiệu viễn thông đứng số 1 Đông Nam Á, số 2 Châu Á</span></span></strong></span></span></li>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:12.0pt"><span style="font-family:Sarabun">Giá trị thương hiệu Viettel tăng 99 bậc so với năm 2021</span></span></strong></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Theo xếp hạng “Bảng xếp hạng Top 500 thương hiệu giá trị nhất thế giới 2022” (Global500), Viettel đứng ở vị trí 227, tăng 99 bậc so với năm trước. Apple là thương hiệu giá trị nhất thế giới, định giá 355 tỷ USD. Theo sau đó là Amazon và Google.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/02/07/anh-02.png" style="height:447px; width:800px"></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Trên thế giới, có 22/36 thương hiệu viễn thông lớn tăng về thứ bậc. Ba thương hiệu viễn thông hàng đầu thế giới là Verizon, Deutsche Telekom và AT&amp;T. Viettel đứng ở vị trí thứ 18 và là thương hiệu tăng trưởng tốt nhất.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Viettel tiếp tục duy trì vị trí số 1 về thương hiệu viễn thông tại Đông Nam Á và nằm trong top 3 thương hiệu giá trị nhất khu vực.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Cũng theo công bố của Brand Finance, nguyên Quyền Chủ tịch kiêm Tổng Giám đốc Viettel Lê Đăng Dũng được xếp vị trí 130 trong số 250 CEO hàng đầu thế giới về thương hiệu. Ông Lê Đăng Dũng là CEO duy nhất của Đông Nam Á có mặt trong bảng xếp hạng. Trong lĩnh vực viễn thông, ông Dũng đứng thứ 4.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Đây là năm đầu tiên Brand Finance mở rộng khái niệm về chỉ số giám hộ thương hiệu (Brand Guardianship Index). Bảng xếp hạng công nhận những người đang xây dựng giá trị doanh nghiệp một cách bền vững, bằng cách cân bằng nhu cầu của tất cả các bên liên quan: nhân viên, nhà đầu tư và xã hội.</span></span></span></p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news06.webp', 2, 
  'Viettel tổ chức Lễ Bàn giao chức danh Chủ tịch kiêm Tổng Giám đốc Tập đoàn', 
  'Ngày 08/02/2022, dưới sự chứng kiến của Thượng tướng Vũ Hải Sản, Thứ trưởng Bộ Quốc phòng, Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel) đã tổ chức Lễ bàn giao chức danh Chủ tịch kiêm Tổng giám đốc (TGĐ) Tập đoàn.', 
  '2022-02-09', 
  '<div class="<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-family:Sarabun">Thiếu tướng Lê Đăng Dũng về nghỉ hưu theo chế độ. Đại tá Tào Đức Thắng trở thành người thứ 8 giữ vị trí cao nhất của Viettel từ khi thành lập (1989). </span></strong></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/02/09/anh-01-ban-giao-chuc-danh-chu-tich-tgd.jpg" style="height:667px; width:1000px"><em>Thượng tướng Vũ Hải Sản, Thứ trưởng Bộ Quốc phòng, chủ trì lễ bàn giao chức danh và nhiệm vụ Chủ tịch, Tổng Giám đốc Tập đoàn Viettel.</em></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Trải qua 33 năm, Viettel đã có 4 giai đoạn phát triển và 3 thế hệ lãnh đạo.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Thế hệ lãnh đạo đầu tiên của Viettel là đội ngũ cán bộ kỹ thuật nòng cốt của Binh chủng thông tin liên lạc đã tìm ra con đường để những người lính thông tin có thể góp phần xây dựng đất nước đồng thời định vị phương hướng phát triển cho Viettel. </span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Thế hệ lãnh đạo thứ hai của Viettel làm việc và trưởng thành cùng nhau từ khi Viettel kinh doanh dịch vụ viễn thông. Thế hệ lãnh đạo này đã phổ cập dịch vụ viễn thông ở Việt Nam và nhiều quốc gia đang phát triển trên thế giới;&nbsp; mở rộng không gian phát triển của Viettel sang các ngành công nghiệp an ninh mạng, công nghiệp sản xuất điện tử viễn thông, công nghiệp quốc phòng công nghệ cao; đưa Việt Nam song hành cùng với tốc độ phát triển công nghệ của thế giới, tiên phong, chủ lực kiến tạo xã hội số ở Việt Nam. </span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Đại tá Tào Đức Thắng thuộc thế hệ lãnh đạo thứ 3, nhận nhiệm vụ dẫn dắt Viettel trong&nbsp; bối cảnh Viettel là tập đoàn công nghiệp, công nghệ, viễn thông lớn nhất Việt Nam, là nòng cốt của lĩnh vực công nghiệp quốc phòng, với gần 50 ngàn cán bộ, nhân viên; đầu tư và kinh doanh ở 10 quốc gia thuộc 3 châu lục; đóng góp cho Nhà nước hàng chục ngàn tỷ đồng mỗi năm; là thương hiệu viễn thông có giá trị lớn nhất Đông Nam Á và đứng thứ 10 ở Châu Á.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/02/09/anh-02-ban-giao-chuc-danh-chu-tich-tgd.jpg" style="height:545px; width:1000px"><br>
<em>Đại tá Tào Đức Thắng giữ chức vụ Chủ tịch kiêm TGĐ Tập đoàn Viettel thay Thiếu tướng Lê Đăng Dũng nghỉ hưu theo chế độ.&nbsp;</em></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Tại lễ bàn giao, Đại tá Tào Đức Thắng cam kết luôn giữ vững tinh thần tiên phong, dẫn dắt, vị thế số 1 Việt Nam, tiếp tục hiện thực hóa khát vọng của các thế hệ đi trước, đồng thời mở ra hướng phát triển mới cho Viettel.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Cụ thể:</span></span></span></p>

<ul style="list-style-type:square">
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Viettel sẽ thực sự là một Tập đoàn viễn thông, công nghiệp, công nghệ ở quy mô toàn cầu;</span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Viettel sẽ là hạt nhân của nền công nghiệp quốc phòng, hình thành cho được ngành nghiên cứu sản xuất công nghệ cao ở Việt Nam;</span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Viettel sẽ kiến thiết xã hội số ở Việt Nam với 4 trọng tâm: Chính phủ số để người dân được phục vụ tốt hơn; Kinh tế số để người dân giàu có hơn; Xã hội số để người dân hạnh phúc hơn; An ninh mạng để người dân sống và làm việc an toàn hơn;</span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Viettel sẽ tiếp tục tiên phong, dẫn dắt trải nghiệm người dùng trong </span><span style="font-family:Sarabun">các xu hướng công nghệ mới của tương lai.</span></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Phát biểu tại buổi lễ, Đại tá Tào Đức Thắng cam kết: “</span><span style="font-family:Sarabun">Tôi ý thức rằng, trọng trách ngày hôm nay tôi nhận là nhiệm vụ rất nặng nề nhưng cũng rất vinh quang. Tôi xin hứa đem hết sức mình cùng với các đồng chí, đồng đội ở Viettel làm mọi điều có thể vì sự phát triển của Viettel và qua đó, đóng góp cho sự phát triển của Việt Nam, mang lại cuộc sống tốt </span><span style="font-family:Sarabun">đẹp hơn ở bất kỳ đâu mà Viettel có mặt”.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Đại tá Tào Đức Thắng đã chính thức điều hành hoạt động của Viettel từ ngày 01/01/2022 theo quyết định số 2200/QĐ -TTg ngày 25/12/2021.</span></span></span></p>

<blockquote>
<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Các giai đoạn phát triển của Viettel:</span></span></strong></span></span></p>

<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">GIAI ĐOẠN 1.0 (1989-1999)</span></span></span></span></p>

<ul>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Xây dựng thành công đường trục cáp quang Bắc - Nam đầu tiên dành riêng cho quân sự, áp dụng công nghệ ghép bước sóng thu phát trên một sợi quang có độ dài nhất thế giới (hơn 2.300Km)</span></span></span></span></li>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Xây dựng thành công các công trình cột cao nhất Việt Nam (125m) cho Đài truyền hình Tuyên Quang, Đài truyền hình Việt Nam</span></span></span></span></li>
</ul>

<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">GIAI ĐOẠN 2.0 (2000-2009)</span></span></span></span></p>

<ul>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Làm bùng nổ, phổ cập dịch vụ viễn thông, dịch vụ di động tại Việt Nam</span></span></span></span></li>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tiên phong đầu tư ra nước ngoài bằng công nghệ cao</span></span></span></span></li>
</ul>

<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">GIAN ĐOẠN 3.0 (2010-2018)</span></span></span></span></p>

<ul>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Đầu tư nghiên cứu, sản xuất công nghệ cao</span></span></span></span></li>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Kinh doanh dịch vụ viễn thông tại 11 nước trên thế giới</span></span></span></span></li>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Đưa ứng dụng CNTT vào mọi ngõ ngách cuộc sống</span></span></span></span></li>
</ul>

<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">GIAI ĐOẠN 4.0 (2018-nay)</span></span></span></span></p>

<ul>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tiên phong, chủ lực kiến tạo xã hội số bằng công nghệ mới nhất trên thế giới</span></span></span></span></li>
	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Là tập đoàn kinh tế chủ lực của đất nước</span></span></span></span></li>
</ul>

<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:11.0pt"><span style="font-family:Sarabun">Những người giữ vị trí cao nhất ở Viettel qua các thời kì: </span></span></strong></span></span></p>

<table cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none; margin-left:-10px; width:643px">
	<tbody>
		<tr>
			<td style="height:25px; vertical-align:top; width:28px">
			<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">1.</span></span></span></span></p>
			</td>
			<td style="height:25px; vertical-align:top; width:211px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Đại tá Võ Đặng</span></span></strong></span></span></p>
			</td>
			<td style="height:25px; vertical-align:top; width:404px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tổng </span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun">G</span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun">iám đốc Tổng Công ty điện tử thiết bị thông tin (Sigelco)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:26px; vertical-align:top; width:28px">
			<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">2.</span></span></span></span></p>
			</td>
			<td style="height:26px; vertical-align:top; width:211px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Đ</span></span></strong><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">ại</span></span></strong><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun"> tá Phạm Ngọc Điệp</span></span></strong></span></span></p>
			</td>
			<td style="height:26px; vertical-align:top; width:404px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Giám đốc Công ty điện tử thiết bị thông tin (Sigelco)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:25px; vertical-align:top; width:28px">
			<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">3.</span></span></span></span></p>
			</td>
			<td style="height:25px; vertical-align:top; width:211px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Đại tá Đàm Rơi</span></span></strong></span></span></p>
			</td>
			<td style="height:25px; vertical-align:top; width:404px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Giám đốc Công ty Điện tử Viễn thông Quân Đội (Vietel)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:25px; vertical-align:top; width:28px">
			<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">4.</span></span></span></span></p>
			</td>
			<td style="height:25px; vertical-align:top; width:211px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Đại tá Nguyễn Hữu Đăng</span></span></strong></span></span></p>
			</td>
			<td style="height:25px; vertical-align:top; width:404px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Giám đốc Công ty Điện tử Viễn thông Quân Đội (Vietel)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:26px; vertical-align:top; width:28px">
			<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">5.</span></span></span></span></p>
			</td>
			<td style="height:26px; vertical-align:top; width:211px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Trung tướng Hoàng Anh Xuân</span></span></strong></span></span></p>
			</td>
			<td style="height:26px; vertical-align:top; width:404px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Giám đốc Công ty Điện tử Viễn thông Quân đội (Vietel)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:25px; vertical-align:top; width:28px">
			<p style="text-align:center">&nbsp;</p>
			</td>
			<td style="height:25px; vertical-align:top; width:211px">
			<p>&nbsp;</p>
			</td>
			<td style="height:25px; vertical-align:top; width:404px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tổng Giám đốc Tổng Công ty Viễn thông Quân đội (Viettel)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:25px; vertical-align:top; width:28px">
			<p style="text-align:center">&nbsp;</p>
			</td>
			<td style="height:25px; vertical-align:top; width:211px">
			<p>&nbsp;</p>
			</td>
			<td style="height:25px; vertical-align:top; width:404px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tổng </span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun">G</span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun">iám đốc Tập đoàn Viễn thông Quân đội (Viettel)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:26px; vertical-align:top; width:28px">
			<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">6.</span></span></span></span></p>
			</td>
			<td style="height:26px; vertical-align:top; width:211px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Thiếu tướng Nguyễn Mạnh Hùng</span></span></strong></span></span></p>
			</td>
			<td style="height:26px; vertical-align:top; width:404px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tổng giám đốc Tập đoàn Viễn thông Quân đội (Viettel)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:43px; vertical-align:top; width:28px">
			<p style="text-align:center">&nbsp;</p>
			</td>
			<td style="height:43px; vertical-align:top; width:211px">
			<p>&nbsp;</p>
			</td>
			<td style="height:43px; vertical-align:top; width:404px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chủ tịch kiêm </span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tổng giám đốc<br>
			Tập đoàn Công nghiệp</span></span> <span style="font-size:10.0pt"><span style="font-family:Sarabun">- Viễn thông Quân đội (Viettel)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:44px; vertical-align:top; width:28px">
			<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">7.</span></span></span></span></p>
			</td>
			<td style="height:44px; vertical-align:top; width:211px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Thiếu tướng Lê Đăng Dũng</span></span></strong></span></span></p>
			</td>
			<td style="height:44px; vertical-align:top; width:404px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Quyền Chủ tịch kiêm </span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tổng giám đốc<br>
			Tập đoàn Công nghiệp</span></span> <span style="font-size:10.0pt"><span style="font-family:Sarabun">- Viễn thông Quân đội (Viettel)</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="height:44px; vertical-align:top; width:28px">
			<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">8.</span></span></span></span></p>
			</td>
			<td style="height:44px; vertical-align:top; width:211px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Đại tá Tào Đức Thắng</span></span></strong></span></span></p>
			</td>
			<td style="height:44px; vertical-align:top; width:404px">
			<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chủ tịch kiêm </span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tổng giám đốc<br>
			Tập đoàn Công nghiệp- Viễn thông Quân đội (Viettel)</span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tóm tắt quá trình công tác của Đại tá Tào Đức Thắng, Chủ tịch kiêm Tổng Giám đốc Tập đoàn Công nghiệp - Viễn thông Quân đội</span></span></strong></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Trước khi được bổ nhiệm, ông Tào Đức Thắng từng giữ nhiều chức vụ chủ chốt của Viettel như: Phó TGĐ Tập đoàn Viettel (2018-2021), Quyền PGĐ Tập đoàn (2015-2018), Quyền TGĐ Tổng công ty Cổ phần Đầu tư Quốc tế Viettel (2014-2015), TGĐ Tổng công ty Mạng lưới Viettel (2013-2014), Giám đốc Công ty Mạng lưới Viettel (2010-2013), Quyền PGĐ Công ty Viễn thông Viettel (2008-2010)...</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Năm 2005 ông gia nhập Viettel với vai trò Trưởng phòng Quản lý Kỹ thuật, Công ty Điện thoại di động Viettel (TCT Viễn thông Quân đội). Từ 2005-2008 ông lần lượt giữ các chức vụ Phó giám đốc Trung tâm điện thoại di động KV1, Phó giám đốc Trung tâm điều hành kĩ thuật (Công ty Viễn thông Viettel). Trước đó, từ 1995-2005 ông làm việc tại Công ty Điện thoại Hà Nội và Bưu điện Hà Nội.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Phụ trách Tổng công ty Mạng lưới Viettel (VTNet) trong nhiều giai đoạn, đại tá Tào Đức Thắng đã có đóng góp quan trọng cùng VTNet xây dựng và triển khai hệ thống 120.000 trạm thu phát sóng di động (BTS) phục vụ hàng chục triệu khách hàng, tạo tiền đề để Viettel làm nên 2 cuộc cách mạng trong viễn thông: phổ cập điện thoại di động và Internet di động băng rộng.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Trong giai đoạn lãnh đạo TCT Cổ phần Đầu tư Quốc tế Viettel, ông cũng góp phần đưa Viettel trở thành doanh nghiệp Việt Nam đầu tư ra nước ngoài lớn nhất với 10 thị trường quốc tế với 5 quốc gia đứng số 1 về thị phần, 8 thị trường đã có lãi, 3 thị trường đã thu hồi về nước gấp 4-5 lần số vốn đã đầu tư.</span></span></span></span></p>

<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Thành tựu của Thiếu tướng Lê Đăng Dũng trên cương vị Quyền Chủ tịch kiêm Tổng Giám đốc Tập đoàn Công nghiệp – Viễn thông Quân đội</span></span></strong></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Trong hơn 3 năm Thiếu tướng Lê Đăng Dũng là người “chèo lái” Viettel, có đến 2 năm cả thế giới chống chọi với đại dịch Covid-19 toàn cầu. Trong bối cảnh khó khăn chồng chất về dịch bệnh, khủng hoảng kinh tế- xã hội,&nbsp;đứt gãy chuỗi cung ứng…, Viettel kiên cường tăng trưởng với nhiều thành quả:&nbsp;</span></span></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chiến lược</span></span></strong></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chính phủ phê chuẩn chiến lược 5 năm (2021-2025) và các năm tiếp theo với mục tiêu: Viettel là Tập đoàn kinh tế hàng đầu của đất nước, tiên phong, chủ lực kiến tạo xã hội số và là nòng cốt xây dựng tổ hợp công nghiệp</span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun"> quốc phòng công nghệ cao. Bản chiến lược xây dựng chi tiết về lộ trình, chỉ tiêu và nhiệm vụ của từng đơn vị trong Tập đoàn.</span></span></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Kết quả sản xuất kinh doanh</span></span></strong></span></span>

	<ul>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Doanh thu: 274.000 tỷ VNĐ (tăng trưởng 17%)</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Lợi nhuận: 40.100 tỷ VNĐ (tăng trưởng 7%)</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Giá trị thương hiệu: 8,758 tỷ USD (tăng trưởng 175%)</span></span></span></span></li>
	</ul>
	</li>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Hiệu quả</span></span></strong></span></span></li>
</ul>

<p style="margin-left:40px; text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tiếp tục là </span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun">doanh</span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun"> nghiệp nộp thuế lớn nhất Việt Nam (5 năm liên tục)</span></span></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Thương hiệu</span></span></strong></span></span></li>
</ul>

<p style="margin-left:40px; text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tiếp tục thực hiện tầm nhìn “Sáng tạo vì con người”, kế thừa mong muốn phục vụ khách hàng theo một cách riêng, Viettel tái định vị thương hiệu theo hướng mở hơn, sáng tạo hơn, khát khao hơn và cộng hưởng hơn nhằm chuyển dịch từ nhà cung cấp dịch vụ viễn thông trở thành nhà cung cấp dịch vụ số, với sứ mệnh “Tiên phong, Chủ lực Kiến tạo xã hội số”.</span></span></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">&nbsp;<strong>Quản trị</strong></span></span></span></span>

	<ul>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Triển khai nhiều công cụ quản trị dựa trên công nghệ 4.0 như AI, phân tích data</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Quản trị theo tiêu chuẩn quốc tế</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Ủy quyền nhiều hơn</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chuyên nghiệp hóa bộ máy</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chiến lược tuyển chọn, giữ gìn nhân tài</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chuyển đổi các ngành truyền thống trở thành các công ty công nghệ</span></span></span></span></li>
	</ul>
	</li>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Lĩnh vực hoạt động</span></span></strong></span></span>
	<ul>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Viễn thông: Viễn thông trong nước, Viễn thông nước ngoài;</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Giải pháp: Giải pháp số, Tài chính số, Nội dung số, An ninh mạng,</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Nghiên cứu sản xuất công nghiệp công nghệ cao</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Logistic và thương mại điện tử</span></span></span></span></li>
	</ul>
	</li>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Viễn thông</span></span></strong></span></span>
	<ul>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Mạng 4G rộng nhất và tốt nhất Việt Nam</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Thử nghiệm 5G thành công tại 5 quốc gia trên thế giới (Việt Nam, Lào, Campuchia, Myanmar, Peru)</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Kinh doanh tại 11&nbsp; thị trường</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Củng cố sức mạnh và tìm cơ hội M&amp;A</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tiếp tục tìm kiếm cơ hội đầu tư</span></span></span></span></li>
	</ul>
	</li>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Nghiên cứu sản xuất công nghiệp công nghệ cao</span></span></strong></span></span>
	<ul>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Sản xuất và thử nghiệm thiết bị 5G</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Nghiệm thu A1, S125-VT</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Bước đầu hình thành tổ hợp công nghiệp quốc phòng công nghệ cao</span></span></span></span></li>
	</ul>
	</li>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chuyển đổi số</span></span></strong></span></span></li>
</ul>

<p style="margin-left:40px; text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tiên phong, chủ lực Kiến tạo xã hội số với các lĩnh vực: Hạ tầng số, Giải pháp số, </span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun">Tài chính số, Nội dung số, An ninh mạng, Nghiên cứu sản xuất, Logistics</span></span></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">Logistics và thương mại điện tử</span></span></strong></span></span>

	<ul>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Dịch vụ chuyển phát dành cho thương mại điện tử</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Phát triển dịch vụ kho vận dành cho chuyển phát</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Cung cấp các dịch vụ kênh phân phối</span></span></span></span></li>
		<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Thị phần top 3 đơn vị dẫn đầu thị trường về bán lẻ, phân phối thiết bị đầu cuối viễn thông</span></span></span></span></li>
	</ul>
	</li>
</ul>
</blockquote>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news07.webp', 5, 
  'Những yếu tố giúp giá trị thương hiệu Viettel lập đỉnh mới', 
  'Sau cú thay đổi ngoạn mục, Viettel luôn là thương hiệu nổi bật. Theo đánh giá mới nhất của Brand Finance, giá trị thương hiệu Viettel tăng 99 bậc so với năm 2021 và lọt Top 250 thương hiệu giá trị nhất thế giới.', 
  '2022-02-11', 
  '<p>Đầu năm 2022, Brand Finance - công ty tư vấn và định giá thương hiệu hàng đầu thế giới công bố bảng xếp hạng giá trị thương hiệu. Theo đó, với định giá 8,758 tỷ USD, giá trị thương hiệu Viettel tăng 44% so với năm 2021, tăng 99 bậc trên bảng xếp hạng những thương hiệu giá trị nhất thế giới. Nhờ đó, Viettel vào Top 250 thương hiệu của thế giới về giá trị (đứng thứ 227), xếp trên cả Spotify, Qualcomm…</p>

<table>
	<tbody>
		<tr>
			<td><a href="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi.jpg" title=""><img alt="Những yếu tố giúp giá trị thương hiệu Viettel lập đỉnh mới" src="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi.jpg"></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>Đây được coi là bước đột phá ngoạn mục của thương hiệu Viettel sau khi lập đỉnh vào năm 2021, cùng thời điểm với việc thay đổi nhận diện để xây dựng hình ảnh trẻ trung, năng động và 4.0 để phù hợp với tuyên bố sứ mệnh mới và chiến lược chuyển dịch trở thành nhà cung cấp dịch vụ số. Đâu là nguyên nhân dẫn tới cú phá đỉnh lịch sử của Viettel, giúp thương hiệu này tăng giá trị, vượt cả những tên tuổi lớn khác của thế giới?</p>

<table>
	<tbody>
		<tr>
			<td><a href="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi-1.jpg" title=""><img alt="Những yếu tố giúp giá trị thương hiệu Viettel lập đỉnh mới" src="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi-1.jpg"></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>Nếu nhìn vào những kết quả và hành trình thương hiệu của Viettel trong năm 2021, có thể nhìn thấy 3 lý do nổi bật: Thứ nhất, các công ty công nghệ sở hữu hạ tầng số mang tính nền tảng ở cấp độ toàn cầu có giá trị thương hiệu tăng mạnh. Hạ tầng số của các công ty này đóng vai trò quan trọng trong đại dịch Covid-19 với chức năng kết nối qua mạng viễn thông và hạ tầng CNTT. Viettel cũng nằm trong nhóm này khi sở hữu hạ tầng số tại 11 quốc gia, giúp tập đoàn này tạo ra ảnh hưởng lớn, tích cực trong đại dịch. Do đó, việc thương hiệu Viettel có sự thăng hạng lớn về giá trị là đúng xu thế.</p>

<table>
	<tbody>
		<tr>
			<td><a href="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi-2.jpg" title=""><img alt="Những yếu tố giúp giá trị thương hiệu Viettel lập đỉnh mới" src="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi-2.jpg"></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>Đây cũng là lý do Viettel là thương hiệu mạnh thứ 61 trên toàn cầu, được đo lường thông qua Chỉ số Sức mạnh thương hiệu (Brand Strength Index) của Brand Finance năm 2022. Viettel cũng là đơn vị duy nhất của Việt Nam lọt vào top 250 toàn cầu và một trong số 10 thương hiệu thăng hạng nhiều nhất năm 2022 của Brand Finance.</p>

<p>Lý do thứ hai, năm 2021, Viettel đạt được nhiều kết quả tích cực trong kinh doanh quốc tế với mảng viễn thông tăng trưởng lợi nhuận tới 13,5%, đặc biệt trong bối cảnh thị trường này dù có cải thiện nhưng doanh thu và lợi nhuận của ngành vẫn đi ngang. Riêng Viettel còn tạo ra tăng trưởng tới gần 40% ở thị trường châu Phi và vươn lên vị trí số 1 ở Myanmar.</p>

<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td><a href="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi-3.jpg" title=""><img alt="Những yếu tố giúp giá trị thương hiệu Viettel lập đỉnh mới" src="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi-3.jpg"></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>Trong lĩnh vực viễn thông, Viettel là thương hiệu tiên phong thiết kế và nghiên cứu sản xuất thành công hệ sinh thái thiết bị mạng 5G - công nghệ của tương lai, phục vụ cho xã hội 4.0. Đây là nhân tố quan trọng để Viettel tạo ra nguồn doanh thu mới trong tương lại, qua đó đóng góp vào giá trị thương hiệu của Viettel.</p>

<p>Thứ ba, Viettel thực hiện một sự thay đổi lớn về bộ nhận diện thương hiệu. Theo đó, thương hiệu Viettel được “lột xác” với hình ảnh trẻ trung, năng động và 4.0. Nhờ đó, thương hiệu Viettel có hình ảnh nổi bật dù là trên đường phố Việt Nam hay trên tất cả các nền tảng số với màu đỏ ấn tượng.</p>

<table>
	<tbody>
		<tr>
			<td><a href="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi-4.jpg" title=""><img alt="Những yếu tố giúp giá trị thương hiệu Viettel lập đỉnh mới" src="https://vnn-imgs-f.vgcloud.vn/2022/02/10/18/nhung-yeu-to-giup-gia-tri-thuong-hieu-viettel-lap-dinh-moi-4.jpg"></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>Thực tế, cảm nhận của người dùng về hình ảnh mới của Viettel cũng thay đổi tích cực hơn so với trước, tương ứng với tuyên bố sứ mệnh “Tiên phong, chủ lực kiến tạo xã hội số” mà thương hiệu này cam kết.</p>

<p>Bình luận về việc gia tăng vượt trội về giá trị của các thương hiệu Việt Nam, ông Samir Dixit - Giám đốc điều hành Brand Finance châu Á Thái Bình Dương cho biết: “Các thương hiệu Việt Nam đã thể hiện sức bật vượt trội trong suốt thời kỳ Covid-19 và đang cạnh tranh mạnh mẽ với một số thương hiệu toàn cầu lâu đời nhất. Một số thành công về thương hiệu đối với các thương hiệu Việt Nam cũng có thể là nhờ “Chương trình Giá trị Việt Nam”, một sáng kiến của chính phủ khuyến khích các công ty tập trung vào thương hiệu nhiều hơn”.</p>

<p>Theo VietnamNet</p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news08.webp', 2, 
  'Công ty An ninh mạng Viettel toàn thắng tại giải thưởng quốc tế Cybersecurity Excellence Awards 2022', 
  'Hà Nội, ngày 21/02/2022 - Cybersecurity Excellence Awards 2022 - Giải thưởng quốc tế uy tín về bảo mật, an ninh mạng mới đây vừa công bố Công ty An ninh mạng Viettel (Viettel Cyber Security - VCS), một thành viên của Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel) đã xuất sắc giành giải Vàng tại 13/13 đề cử tham dự.', 
  '2022-02-21', 
  '<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Lần đầu tiên tham gia và cạnh tranh với hơn 900 đề cử đến từ những hãng cung cấp giải pháp An toàn thông tin (ATTT) hàng đầu trên thế giới như Palo Alto, Fortinet, McAfee, Crowdstrike…, VCS đã giành Giải Vàng cho Công ty An ninh mạng Tốt nhất khu vực châu Á năm 2022 và 12 Giải Vàng cho 08 sản phẩm và 04 dịch vụ ATTT. </span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Các giải pháp, dịch vụ của VCS giành giải lần này đều là những sản phẩm đã hỗ trợ hiệu quả quá trình chuyển đổi số (CĐS) của các tổ chức, doanh nghiệp trong ứng phó với các vấn đề ATTT khi chuyển dịch hạ tầng lên nền tảng trực tuyến trong bối cảnh đại dịch Covid-19. </span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Tiêu biểu trong đó là giải pháp làm việc từ xa VCS M-Suite cho phép người dùng sử dụng các ứng dụng công nghệ thông tin nội bộ trên internet trong khi vẫn đảm bảo ATTT. VCS M-Suite đã được áp dụng trên 14 hệ thống trong và ngoài nước trong đó có các bộ, ngành và doanh nghiệp, tổ chức thuộc nhiều lĩnh vực có nhu cầu ATTT cao như tài chính, chứng khoán, năng lượng…với số lượng triển khai lên tới 11.000 máy tính.&nbsp; </span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Một giải pháp nổi bật khác là VCS-KIAN hỗ trợ phân tích, phát hiện các hành vi mạng bất thường. Giải pháp có năng lực giám sát lên tới 250.000 sự kiện/giây này được triển khai trên toàn bộ mạng lưới Viettel và trên hệ thống của 30 tổ chức, doanh nghiệp khác giúp bảo vệ hiệu quả khách hàng trước nguy cơ bị tấn công mã độc, rò rỉ, lộ lọt dữ liệu. </span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Ngoài ra có thể kể đến VCS-aJiant, giải pháp giúp phát hiện, chống tấn công có chủ đích lớp Endpoint giúp giảm sát một cách toàn diện, đảm bảo loại bỏ tất cả các nguy cơ bị khai thác và chiếm quyền điều khiển. Giải pháp được triển khai trên toàn bộ mạng lưới Viettel và trên hệ thống của khách hàng với số lượng hơn 100.000 máy chủ, máy tính. </span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-family:Sarabun">Đặc biệt giải pháp VCS-F2DR giúp phát hiện và phản ứng lại các chiến dịch tấn công lừa đảo chiếm đoạt tiền, trục lợi từ các chương trình khuyến mại của các ngân hàng số. Kết hợp linh hoạt công nghệ hồ sơ hóa động để phân tích hành vi người dùng giải pháp này hỗ trợ phát hiện các gian lận tài chính, giúp các ngân hàng và người tiêu dùng giảm thiểu rủi ro bị lừa đảo, chiếm đoạt tài sản.</span></span></span></p>

<blockquote>
<p style="text-align:justify"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><strong><u><span style="font-size:8.0pt"><span style="font-family:Sarabun">Về Công ty An ninh mạng Viettel (VCS): </span></span></u></strong></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Được thành lập năm 2014, Công ty An ninh mạng Viettel (VCS), một thành viên của Tập đoàn Công nghiệp – Viễn thông Quân đội (Viettel), hiện là đơn vị cung cấp các dịch vụ về ATTT số 1 Việt Nam, vươn tầm khu vực và thế giới với đội ngũ hàng trăm nhân sự chuyên sâu về ATTT trong đó có các chuyên gia bảo mật an ninh mạng (ANM) đạt đẳng cấp quốc tế. </span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">VCS nghiên cứu và phát triển thành công Hệ sinh thái giải pháp ATTT phục vụ hàng trăm khách hàng từ mọi ngành nghề với 03 nhóm: Giải pháp cho Chính phủ và doanh nghiệp lớn; Giải pháp cho doanh nghiệp vừa &amp; nhỏ; Giải pháp cho nhà mạng viễn thông. Bên cạnh đó, VCS cũng tập trung phát triển 3 nhóm dịch vụ chính: Dịch vụ Giám sát và Xử lý sự cố ATTT mạng, Dịch vụ săn tìm mối nguy ATTT và Dịch vụ Kiểm tra đánh giá ATTT. Các giải pháp do VCS cung cấp đã và được triển khai rộng rãi cho Chính phủ, các bộ, ngành, cơ quan, đơn vị và doanh nghiệp trong nước và quốc tế. </span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:8.0pt"><span style="background-color:white"><span style="font-family:Sarabun">Hiện mạng lưới giám sát toàn cầu SOC của VCS đang phủ sóng 11 quốc gia với 10.000 máy chủ, 40.000 máy trạm, quản trị hơn 1.000 website, 16.000 ứng dụng và hơn 100.000 triệu thuê bao trên khắp thế giới. Tính riêng trong năm 2021, đội ngũ nhân sự VCS đã phát hiện 64 lỗ hổng bảo mật zero-day tại các nền tảng, hệ thống công nghệ thông tin lớn trên toàn cầu như: Microsoft, Oracle, Jenkin…đóng góp vào việc giảm thiểu các cuộc tấn công và nâng cao tri thức </span></span></span><span style="font-size:8.0pt"><span style="font-family:Sarabun">ANM<span style="background-color:white"> toàn cầu.</span></span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><strong><u><span style="font-size:8.0pt"><span style="background-color:white"><span style="font-family:Sarabun">Về Giải thưởng </span></span></span></u></strong><strong><u><span style="font-size:8.0pt"><span style="font-family:Sarabun">Cybersecurity Excellence Awards: </span></span></u></strong></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Cybersecurity Excellence Awards là giải thưởng được tổ chức thường niên từ năm 2016 với 3 hạng mục và khoảng hơn 120 đề cử. Đến năm 2020 giải thưởng mở rộng ra 4 hạng mục (Công ty, Sản phẩm/Dịch vụ, Chuyên gia ANM, Giải pháp ANM công nghiệp) và chia theo từng khu vực (Châu Á, Châu Âu, Trung Đông, Bắc Mỹ), theo quy mô doanh nghiệp (startup, doanh nghiệp có 100-500 nhân viên, 500-1000 và doanh nghiệp có trên 1000 nhân viên). </span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải thưởng do tổ chức Cybersecurity Insiders hợp tác với Cộng đồng ATTT trên LinkedIn thực hiện, khai thác kinh nghiệm rộng lớn của hơn 500.000 chuyên gia ANM trên thế giới. Đơn vị đạt giải sẽ được công bố trên website Cybersecurity Excellence Awards và hơn 500.000 thành viên cộng đồng ATTT trên LinkedIn và Cybersecurity Insiders. Giải thưởng có sự tham gia của các đơn vị uy tín, tầm cỡ trong lĩnh vực ANM trên thế giới như: Carbon Black, Group-IB, McAfee, Trend Micro… Các doanh nghiệp giành giải tại Cybersecurity Excellence Awards 2022 đều là những đơn vị được đánh giá là những đại diện xuất sắc hàng đầu trong việc giải quyết những thách thức cấp bách về ATTT hiện nay.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><strong><u><span style="font-size:8.0pt"><span style="font-family:Sarabun">Link công bố giải thưởng Cybersecurity Excellence Awards 2022:</span></span></u></strong><br>
<a href="https://cybersecurity-excellence-awards.com/2022-cybersecurity-company-awards-winners-and-finalists/" style="color:#0563c1; text-decoration:underline"><span style="font-size:8.0pt"><span style="font-family:Sarabun">https://cybersecurity-excellence-awards.com/2022-cybersecurity-company-awards-winners-and-finalists/</span></span></a></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="background-color:white"><span style="font-family:&quot;Times New Roman&quot;,serif"><a href="https://cybersecurity-excellence-awards.com/2022-cybersecurity-product-service-awards-winners/" style="color:#0563c1; text-decoration:underline"><span style="font-size:8.0pt"><span style="font-family:Sarabun">https://cybersecurity-excellence-awards.com/2022-cybersecurity-product-service-awards-winners/</span></span></a></span></span></span></p>

<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><u><span style="font-size:8.0pt"><span style="font-family:Sarabun">Danh sách Giải pháp, Dịch vụ đạt giải thưởng Cybersecurity Excellence Awards của VCS</span></span></u></strong></span></span></p>

<table cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none">
	<tbody>
		<tr>
			<td style="background-color:#d9d9d9; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:8.0pt"><span style="font-family:Sarabun">STT</span></span></strong></span></span></p>
			</td>
			<td style="background-color:#d9d9d9; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:66px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:8.0pt"><span style="font-family:Sarabun">Hạng mục đạt giải</span></span></strong></span></span></p>
			</td>
			<td style="background-color:#d9d9d9; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:92px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp,<br>
			dịch vụ</span></span></strong></span></span></p>
			</td>
			<td style="background-color:#d9d9d9; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:191px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:8.0pt"><span style="font-family:Sarabun">Mô tả</span></span></strong></span></span></p>
			</td>
			<td style="background-color:#d9d9d9; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:217px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><strong><span style="font-size:8.0pt"><span style="font-family:Sarabun">Ứng dụng thực tế</span></span></strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">1</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Công ty</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Công ty An ninh mạng Tốt nhất khu vực châu Á năm 2022</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">2</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp giám sát an ninh mạng (VCS-CyM)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp thu thập, lưu trữ và xử lý dữ liệu ATTT tập trung, đồng thời hỗ trợ giám sát, quản lý vận hành xử lý cảnh báo, vi phạm trong hệ thống. </span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp được sử dụng để thu thập và giám sát tất cả các dữ liệu security trong hệ thống, phân tích và đưa ra những cảnh báo vi phạm ATTT.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Đã triển khai trên toàn bộ mạng lưới Viettel và trên hệ thống của 30 khách hàng khác, số lượng giám sát lên tới 250.000 sự kiện/giây (EPS).</span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Đáp ứng mô hình ATTT “4 lớp” và các yêu cầu kỹ thuật về kết nối, chia sẻ dữ liệu với Trung tâm Giám sát an toàn Không gian mạng Quốc gia (NCSC) theo Chỉ thị Số 14/CT-TTg của Thủ trướng Chính phủ ngày 07/06/2019.</span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Sản phẩm nằm trong danh sách 25 sản phẩm ATTT “Make in Vietnam” - hoàn toàn làm chủ công nghệ - được Bộ TT&amp;TT khuyến nghị sử dụng. Sản phẩm đạt giải thưởng “Chìa khóa vàng” 4 năm liên tiếp do Hiệp hội ATTT Việt Nam (VNISA) đánh giá và chứng nhận.</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">3</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp phân tích hành vi bất thường (VCS-KIAN)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp hỗ trợ phân tích và phát hiện bất thường trên hầu hết các hành vi mạng dựa trên việc hồ sơ hóa hành vi của từng đối tượng trong quá khứ. Đồng thời giúp định nghĩa trực quan các chuỗi hành động liên hệ với nhau có khả năng tạo thành một cuộc tấn công vào hệ thống thông tin.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Đã triển khai trên toàn bộ mạng lưới Viettel và trên hệ thống của 30 khách hàng khác, số lượng giám sát lên tới 250.000 sự kiện/giây (EPS). Ứng dụng hơn 600 usecase để bảo vệ khách hàng trước cá nguy cơ bị tấn công mã độc, rò rỉ, lộ lọt dữ liệu.</span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Sản phẩm nằm trong danh sách 25 sản phẩm ATTT “Make in Vietnam” - hoàn toàn làm chủ công nghệ - được Bộ TT&amp;TT khuyến nghị sử dụng. Sản phẩm đạt giải thưởng “Chìa khóa vàng” 2 năm liên tiếp do Hiệp hội ATTT Việt Nam (VNISA) đánh giá và chứng nhận.</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">4</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp điều phối, tự động hóa và phản ứng an ninh mạng (VCS-CyCir)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp tương tác, tích hợp với các hệ thống đảm bảo ATTT và quản lý vận hành khác trong hệ thống thông tin, thu thập dữ liệu về các mối đe dọa bảo mật từ nhiều nguồn và phản ứng với các sự cố ATTT ở mức thấp mà không cần sự trợ giúp của con người. Giúp tối ưu nguồn lực và nâng cao hiệu quả việc giám sát xử lý sự cố ATTT.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Đã triển khai trên toàn bộ mạng lưới Viettel và trên hệ thống của 10 khách hàng khác. Giúp tự động hóa các quy trình xử lý sự cố ATTT mạng, tiết kiệm khoảng 30% nguồn lực, tối ưu hóa chi phí cho khách hàng.</span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Sản phẩm nằm trong danh sách 25 sản phẩm ATTT “Make in Vietnam” - hoàn toàn làm chủ công nghệ - được Bộ TT&amp;TT khuyến nghị sử dụng. Sản phẩm đạt giải thưởng “Chìa khóa vàng” do Hiệp hội ATTT Việt Nam (VNISA) đánh giá và chứng nhận.</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">5</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp bất thường trên máy trạm (VCS-aJiant)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp phát hiện và chống tấn công có chủ đích lớp Endpoint được xây dựng dựa trên các công nghệ mới nhất trên thế giới, phù hợp với mọi mô hình tổ chức và doanh nghiệp. Các thiết bị máy tính khi cài đặt Endpoint sẽ được giảm sát một cách toàn diện, đảm bảo loại bỏ tất cả các nguy cơ bị khai thác và chiếm quyền điều khiển.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Đã triển khai trên toàn bộ mạng lưới Viettel và trên hệ thống của hơn 30 khách hàng khác, số lượng triển khai lên tới hơn 100.000 máy chủ/máy tính.</span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Đáp ứng các yêu cầu kỹ thuật về kết nối, chia sẻ dữ liệu với Trung tâm Giám sát an toàn Không gian mạng Quốc gia (NCSC) và yêu cầu về phòng chống mã độc theo Chỉ thị Số 14/CT-TTg của Thủ trướng Chính phủ ngày 25/05/2018. Sản phẩm đạt giải thưởng “Chìa khóa vàng” 4 năm liên tiếp do Hiệp hội ATTT Việt Nam (VNISA) đánh giá và chứng nhận.</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">6</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp làm việc từ xa an toàn cho doanh nghiệp (VCS M-Suite)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp cho phép người dùng sử dụng các ứng dụng CNTT nội bộ của doanh nghiệp từ ngoài internet trong khi vẫn đảm bảo an toàn thông tin. Bên cạnh đó, giải pháp cung cấp tính năng kiểm soát, định danh thiết bị được truy cập vào hệ thống của doanh nghiệp hay không, kiểm soát mã độc, đảm bảo tuân thủ chính sách ATTT.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Đã triển khai trên 14 hệ thống của khách hàng trong và ngoài nước, số lượng triển khai lên tới 11.000 máy tính. Giải pháp giúp đảm bảo việc sản xuất kinh doanh từ xa an toàn trong thời kỳ dịch bệnh Covid-19 chưa có dấu hiệu suy giảm.</span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Sản phẩm đạt giải thưởng “Chìa khóa vàng” do Hiệp hội ATTT Việt Nam (VNISA) đánh giá và chứng nhận.</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">7</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp phát hiện và phản ứng gian lận tài chính (VCS-F2DR)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp phát hiện và phản ứng lại các chiến dịch tấn công lừa đảo chiểm đoạt tiền khách hàng, trục lợi từ các chương trình khuyến mại của các ngân hàng số. </span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp kết hợp linh hoạt công nghệ hồ sơ hóa động để phân tích hành vi người dùng, mô hình chuỗi với nền tảng luật truyền thống nhằm hỗ trợ ngân hàng dễ dàng tạo các luật thông minh phát hiện các kịch bản lừa đảo phức tạp mà không ảnh hưởng tới trải nghiệm người dùng. </span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Phát hiện các gian lận tài chính, giúp các ngân hàng và người tiêu dùng giảm thiểu rủi ro bị lừa đảo, chiếm đoạt tài sản nhất là trong thời kỳ Covid-19.</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">8</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp chống tấn công từ chối dịch vụ (VCS-Anti-DDoS)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp chống tấn công băng thông lớn, làm nghẽn traffic uplink của khách hàng sử dụng trường truyền Internet Leased Line của Viettel, ảnh hưởng dịch vụ của khách hàng hoặc ảnh hưởng mạng lưới làm mất dịch vụ diện rộng.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Đã triển khai trên toàn bộ mạng lưới Viettel và hơn 20 cơ quan báo chí, số lượng kênh truyền được bảo vệ lên tới hơn 5.000 kênh truyền.</span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Sản phẩm nằm trong danh sách 25 sản phẩm ATTT “Make in Vietnam” - hoàn toàn làm chủ công nghệ - được Bộ TT&amp;TT khuyến nghị sử dụng</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">9</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp cập nhật tri thức an ninh mạng (VCS-Threat Intelligence)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp cung cấp cơ sở dữ liệu các mối nguy hiểm, mối đe dọa trên toàn thế giới (threat), cung cấp dữ liệu, tri thức về các cuộc tấn công, các mối đe dọa trên toàn thế giới. </span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Giải pháp đồng thời thu thập và phân tích dữ liệu từ rất nhiều nguồn khác nhau, để từ đó phát hiện, xác định và ngăn chặn kịp thời các mối đe dọa trước khi hacker kịp tác động vào hệ thống.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Mạng lưới nguồn tin rộng khắp trên toàn thế giới, giúp nhận biết các nguy cơ tấn công mạng nhanh chóng. Đáp ứng mô hình ATTT “4 lớp” và các yêu cầu kỹ thuật về kết nối, chia sẻ dữ liệu với Trung tâm Giám sát an toàn Không gian mạng Quốc gia (NCSC) theo Chỉ thị Số 14/CT-TTg của Thủ trướng Chính phủ ngày 07/06/2019.</span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Sản phẩm nằm trong danh sách 25 sản phẩm ATTT “Make in Vietnam” - hoàn toàn làm chủ công nghệ - được Bộ TT&amp;TT khuyến nghị sử dụng. Sản phẩm đạt giải thưởng “Chìa khóa vàng” 3 năm liên tiếp do Hiệp hội ATTT Việt Nam (VNISA) đánh giá và chứng nhận.</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">10</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ giám sát và xử lý sự cố an toàn thông tin mạng (MSS)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ giám sát và xử lý sự cố an toàn thông tin mạng hỗ trợ khách hàng giám sát toàn diện 24/7/365 sự kiện ATTT xuất hiện trên hệ thống (bao gồm &amp; không giới hạn các lớp: Endpoint, Network, Gateway), giúp cảnh báo, phát hiện sớm các đợt tấn công vào hệ thống đồng thời xử lý triệt để các sự số và nhanh chóng phục hồi hoạt động các hệ thống của khách hàng.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ được tin dùng bởi hơn 30 khách hàng lớn nhỏ trên toàn quốc. Đạt giải thưởng “Vietnam Mananged Security Service Provider of the Year 2020” do tổ chức Frost &amp; Sullivan đánh giá và chứng nhận.</span></span></span></span></p>

			<p style="text-align:justify">&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">11</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ kiểm tra đánh giá an toàn thông tin mạng (Pentest)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ Kiểm tra và Đánh giá ATTT (Penetration Testing) là hình thức kiểm tra hệ thống CNTT của khách hàng có thể bị tấn công hay không, bằng cách đóng vai tin tặc và giả lập các vụ tấn công thử nghiệm váo hệ thống của khách hàng nhằm xác định các điểm yếu bảo mật trong hệ thống và đưa ra những khuyến nghị và Phương pháp khắc phục cho các điểm yếu, lỗ hổng tìm ra trong quá trình cung cấp dịch vụ.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ được tin dùng bởi hơn 200 khách hàng trên toàn quốc với số lượng ứng dụng, website, hệ thống đã được kiểm tra và đánh giá ATTT lên tới hơn 2.000 hệ thống/ứng dụng.</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">12</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ săn tìm mối nguy ATTT (Threat Hunting)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ Săn tìm mối nguy An toàn thông tin (Threat Hunting) là dịch vụ giúp khách hàng chủ động tìm kiếm, phát hiện và loại bỏ mã độc cũng như những mối đe đọa an ninh mạng tiềm ẩn trong mạng lưới của đơn vị.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ được tin dùng bởi hơn 200 khách hàng trên toàn quốc với số lượng máy tính/máy chủ đã được rà soát, gỡ bỏ mã độc, săn tìm các mối nguy về ATTT lên tới hơn 20.000 máy tính/máy chủ.</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:37px">
			<p style="text-align:center"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">13</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:66px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:92px">
			<p><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ xử lý sự cố (Incident Response)</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:191px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ xử lý sự cố do là dịch vụ phản ứng và xử lý sự cố khi cần, bao gồm xử lý on-site và xử lý từ xa. &nbsp;Ngoài ra, dịch vụ còn cung cấp cho khách hàng các khóa đào tạo an toàn thông tin cơ bản &amp; chuyên sâu, cập nhật tri thức an ninh mạng toàn cầu, diễn tập an toàn thông tin trên các nền tảng ảo mô phỏng sát với mô hình mạng thực tế.</span></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:217px">
			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Dịch vụ được tin dùng bởi hơn 30 khách hàng lớn nhỏ trên toàn quốc. </span></span></span></span></p>

			<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:8.0pt"><span style="font-family:Sarabun">Số lượng sự cố được ứng cứu thành công trong năm 2021 lên tới hàng trăm lượt xử lý sự cố, đạt tỷ lệ 100% xử lý thành công.</span></span></span></span></p>

			<p style="text-align:justify">&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
</blockquote>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news09.webp', 2, 
  'Viện Hàng không Vũ trụ Viettel đón nhận Huân chương Bảo vệ Tổ quốc Hạng Nhất', 
  'Ngày 22/02/2022, thừa ủy quyền của Chủ tịch nước, Thượng tướng Võ Minh Lương, Ủy viên TƯ Đảng, Thứ trưởng Bộ Quốc phòng đã trao tặng Huân chương Bảo vệ Tổ quốc hạng Nhất cho Viện Hàng không Vũ trụ Viettel (VTX) tại lễ kỷ niệm 5 năm Ngày truyền thống của đơn vị (25/02/2017- 25/02/2022).', 
  '2022-02-23', 
  '<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Dự buổi Lễ còn có các đồng chí Nguyễn Mạnh Hùng, Ủy viên Ban chấp hành Trung ương Đảng, Bộ trưởng Bộ Thông tin và Truyền thông; Đồng chí Lê Thành Long, Ủy viên Ban chấp hành Trung ương Đảng, Bộ Trưởng Bộ Tư pháp; Đồng chí Trần Duy Đông, Thứ trưởng Bộ Kế hoạch - Đầu tư; Đồng chí Nguyễn Hoàng Giang, Thứ trưởng Bộ Khoa học và Công nghệ; Đồng chí Trần Xuân Hà, Thứ trưởng Bộ Tài chính.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Viện Hàng không Vũ trụ Viettel (VTX) là đơn vị trực thuộc Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel). Nhiệm vụ của VTX là nghiên cứu, thiết kế, chế tạo, sản xuất các loại máy bay không người lái (UAV), các loại trang bị kỹ thuật công nghệ cao theo yêu cầu nhiệm vụ quân sự và phục vụ dân sinh; liên kết hợp tác với các đối tác trong và ngoài nước về nghiên cứu phát triển khoa học công nghệ, xây dựng và đào tạo nguồn nhân lực trong lĩnh vực hàng không vũ trụ.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Qua 5 năm, VTX đã triển khai thành công nhiều dự án quan trọng, trong đó có những lĩnh vực rất mới, khó và phức tạp đối với Việt Nam cũng như trên thế giới. Nhiều dự án đã được nghiệm thu với những kết quả đột phá trong lĩnh vực hàng không, vũ trụ đưa Việt Nam trở thành một trong số rất ít các nước trên thế giới có khả năng làm chủ các trang bị kỹ thuật và sản phẩm công nghiệp quốc phòng công nghệ cao ở lĩnh vực này.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Với những thành tích xuất sắc trong nghiên cứu, chế tạo, sản xuất các trang bị kỹ thuật, sản phẩm công nghiệp quốc phòng công nghệ cao, VTX vinh dự được Chủ tịch nước tặng thưởng Huân chương Bảo vệ Tổ quốc hạng Nhất.&nbsp;</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Phát biểu tại buổi lễ, Thượng tướng Võ Minh Lương đã bày tỏ hoan nghênh, đánh giá cao quyết tâm, sáng tạo, nỗ lực của VTX nói riêng và Viettel trong việc làm chủ những công nghệ quan trọng, là thành tựu đột phá trong công tác nghiên cứu, chế tạo của Việt Nam.&nbsp;</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Ghi nhận những thành quả mà Viettel đã đạt được, Thượng tướng Võ Minh Lương đồng thời yêu cầu Viettel cần tiếp tục đặt ra những nhiệm vụ mới mang tính thách thức cao, trong 5 năm tới phải từng bước làm chủ nghiên cứu chế tạo sản phẩm công nghệ cao như vệ tinh viễn thám; UAV tầm xa; các hệ thống tác chiến điện tử tầm xa tiên tiến, các hệ thống tự động hóa chỉ huy; các công cụ tác chiến trên không gian mạng…&nbsp;</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Phát biểu tại buổi lễ, Trung tá Vũ Tuấn Anh, Viện trưởng Viện Hàng không Vũ trụ Viettel khẳng định toàn thể các cán bộ, kỹ sư Viettel nói chung và VTX nói riêng phát huy tinh thần đoàn kết, chung sức, đồng lòng, thực hiện chiến lược đưa Viettel trở thành nòng cốt tổ hợp công nghiệp quốc phòng công nghệ cao, đóng góp tích cực vào mục tiêu Nghị quyết Đại hội lần thứ XIII của Đảng về xây dựng nền công nghiệp quốc phòng Việt Nam hiện đại, lưỡng dụng, đáp ứng tốt nhiệm vụ bảo vệ Tổ quốc và phát triển kinh tế - xã hội.</span></span></span></p>

<blockquote>
<p><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Viện Hàng không Vũ trụ Viettel (VTX) là đơn vị trực thuộc Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), được thành lập năm 2017. Trước đó, vào năm 2014, Tập đoàn Viettel đã chủ động đề xuất đề án nghiên cứu, thiết kế, chế tạo, sản xuất trang bị kĩ thuật (TBKT) quân sự công nghệ cao. Sau khi được Quân ủy Trung ương thông qua, đầu năm 2015, đề án được Thủ tướng phê duyệt và giao cho Viettel thực hiện. Ngày 25/02/2017 Bộ trưởng Bộ Quốc phòng đã ra Quyết định số 501/QĐ-BQP chính thức thành lập Viện Hàng không Vũ trụ Viettel. </span></span></span></p>
</blockquote>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news10.webp', 5, 
  'Thông báo về việc lựa chọn tổ chức đấu giá tài sản', 
  'Lô 46.512 ắc quy hỏng không có nhu cầu sử dụng', 
  '2022-02-25', 
  '<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">Căn cứ Luật đấu giá tài sản số 01/2016/QH14 ngày 17/11/2016 của Quốc hội nước Cộng hòa xã hội chủ nghĩa Việt Nam;</span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">Căn cứ quyết định </span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">số 846/QĐ-VTQĐ ngày 24/02/2022 về việc phê duyệt </span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">&nbsp;giá </span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">bán và hình thức bán </span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">lô ắc quy hỏng </span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">không có nhu cầu sử dụng</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"> của Tập đoàn Công nghiệp Viễn thông Quân đội.</span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">Tập đoàn Công nghiệp Viễn thông Quân đội (Viettel) thông báo về việc lựa chọn tổ chức đấu giá tài sản như sau: </span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">1. T</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">ên địa chỉ của đơn vị có tài sản </span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">đấu giá:</span></span></span></strong></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">Tên đơn vị: Tập đoàn Công nghiệp Viễn thông Quân đội (Viettel).</span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">Địa chỉ: Lô D26 Khu đô thị mới Cầu Giấy, phường Yên Hòa, quận Cầu &nbsp;&nbsp;Giấy, TP. Hà Nội.</span></span></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">2</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">. T</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">ên tài sản, số lượng, chất lượng của tài sản </span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">đấu giá:</span></span></span></strong></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">Tên tài sản: 46.512 ắc quy hỏng không có nhu cầu sử dụng.</span></span></span></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">3</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">. </span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">Giá khởi điểm của tài sản </span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">đấu giá:</span></span></span></strong></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">Giá khởi điểm bán thanh lý (đã bao gồm 8% VAT): <strong>52.347.000.000</strong> VNĐ <em>(Bằng chữ: Năm mươi hai tỉ, ba trăm bốn mươi bảy triệu đồng.).</em></span></span></span></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">Lưu ý: Bán cho cả lô tài sản, đây là giá bán tại chỗ (tại các địa điểm để tài sản của Viettel), toàn bộ chi phí vận chuyển, bốc xếp và các chi phí phát sinh khác (nếu có) do bên mua chịu.</span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">4</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">. Thời gian nhận hồ sơ: </span></span></span></strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">kể từ ngày đăng thông báo đến<strong> </strong></span></span></span><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">17h30’ ngày </span></span></span><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">02/</span></span></span><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">03</span></span></span><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">/20</span></span></span><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">22</span></span></span><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">.</span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">5</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">. Địa điểm nộp hồ sơ:</span></span></span></strong></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">Ban Đầu tư Xây dựng - Tập đoàn Công nghiệp Viễn thông Quân đội - Lô D26 Khu đô thị mới Cầu Giấy, phường Yên Hòa, quận Cầu Giấy, TP</span></span> <span style="font-size:14.0pt"><span style="font-family:Sarabun">Hà Nội.</span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">Đầu mối liên hệ: Trần Thị Nga <em>(email:ngatt8@viettel.com.vn; </em></span></span><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">Điện thoại</span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">: 0976622333)</span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">.</span></span></em></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">6</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">. Tiêu chí lựa chọn tổ chức bán đấu giá tài sản: </span></span></span></strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">gồm 2 tiêu chí là Bắt buộc và Chấm điểm.</span></span></span></span></span></p>

<table cellspacing="0" class="Table" style="border-collapse:collapse; width:613px">
	<tbody>
		<tr>
			<td style="height:175px; width:613px">
			<p style="margin-right:-7px; text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun">6</span></span></strong><strong><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">.1. Phương pháp đánh giá các tiêu chí:</span></span></em></strong><strong><em> </em></strong><span style="font-size:14.0pt"><span style="font-family:Sarabun">Các tiêu chí phải có văn bản giấy tờ chứng minh đi kèm (bản chính hoặc bản sao công chứng).</span></span></span></span></p>

			<ul>
				<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><u><span style="font-size:14.0pt"><span style="font-family:Sarabun">Tiêu chí bắt buộc:</span></span></u><span style="font-size:14.0pt"><span style="font-family:Sarabun"> Tổ chức đấu giá tài sản phải đáp ứng 100% các tiêu chí bắt buộc mới được đưa vào đánh giá về điểm. Trường hợp không đạt một trong số các tiêu chí bắt buộc thì bị đánh giá là Không đạt và bị loại. </span></span></span></span></li>
				<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><u><span style="font-size:14.0pt"><span style="font-family:Sarabun">Tiêu chí chấm điểm:</span></span></u><span style="font-size:14.0pt"><span style="font-family:Sarabun"> Tối thiểu phải đạt 80 điểm và không có tiêu chí nào bị chấm điểm =0 thì được đánh giá là Đạt. Đơn vị nào Đạt và có điểm cao hơn là đơn vị được lựa chọn. </span></span></span></span></li>
			</ul>

			<ul>
				<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">Trường hơp các đơn vị được đánh giá là Đạt và có điểm cao nhất bằng nhau thì xét theo tiêu chí vượt mức tối đa, đơn vị nào có nhiều tiêu chí vượt mức điểm tối đa sẽ được lựa chọn.</span></span></span></span></li>
				<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">Trường hợp các đơn vị được đánh giá là Đạt, điểm cao nhất bằng nhau, các tiêu chí vượt mức tối đa bằng nhau thì đơn vị nào vượt mức cao hơn là đơn vị được lựa chọn. </span></span></span></span></li>
			</ul>
			</td>
		</tr>
		<tr>
			<td style="height:25px; width:613px">
			<div style="page-break-after:always"><span style="display:none">&nbsp;</span></div>

			<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun">6</span></span></strong><strong><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">.2. Tiêu chí bắt buộc: </span></span></em></strong></span></span></p>

			<table cellspacing="0" class="Table" style="border-collapse:collapse; border:none">
				<thead>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:68px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">STT</span></span></em></strong></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:234px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">Hồ sơ yêu cầu</span></span></em></strong></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:168px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">Tiêu chí chấm điểm</span></span></em></strong></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:134px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">Bắt buộc</span></span></em></strong></span></span></p>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:80px; vertical-align:top; width:68px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">1</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:80px; vertical-align:top; width:234px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Có tên trong danh sách các tổ chức đấu giá tài sản do Bộ Tư pháp công bố trong thời gian gần nhất</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:80px; vertical-align:top; width:168px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Có tên trong danh sách</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:80px; vertical-align:top; width:134px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">X</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:68px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">2</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:234px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Phương án đấu giá</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:168px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Đúng quy định của Pháp luật, đáp ứng yêu cầu của Viettel, đảm bảo tính công khai, minh bạch, khách quan và hiệu quả</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:134px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">X</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:97px; vertical-align:top; width:68px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">3</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:97px; vertical-align:top; width:234px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Cam kết v/v đơn vị bán đấu giá và đấu giá viên của đơn vị chưa từng bị vi phạm pháp luật về bán đấu giá tài sản theo kết luận của cơ quan nhà nước có thẩm quyền.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:97px; vertical-align:top; width:168px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Không bị vi phạm</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:97px; vertical-align:top; width:134px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">X</span></span></span></span></p>
						</td>
					</tr>
				</tbody>
			</table>

			<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">6</span></span></em></strong><strong><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">.3. Tiêu chí chấm điểm:</span></span></em></strong></span></span></p>

			<table cellspacing="0" class="Table" style="border-collapse:collapse; width:595px">
				<thead>
					<tr>
						<td rowspan="2" style="background-color:white; border-bottom:1px solid black; border-left:1px solid black; border-right:none; border-top:1px solid black; height:24px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">STT</span></span></em></strong></span></span></p>
						</td>
						<td rowspan="2" style="background-color:white; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:24px; width:122px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">Hồ sơ yêu cầu</span></span></em></strong></span></span></p>
						</td>
						<td rowspan="2" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:24px; width:274px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">Tiêu chí chấm điểm</span></span></em></strong></span></span></p>
						</td>
						<td colspan="2" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:24px; width:151px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:14.0pt"><span style="font-family:Sarabun">Chấm điểm</span></span></em></strong></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">Số điểm </span></span></em></strong></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">Tổng điểm</span></span></em></strong></span></span></p>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:23px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">1</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Thời gian hoạt động liên tục trong lĩnh vực đấu giá tài sản của đơn vị tính đến thời điểm tổ chức phiên đấu giá.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">&nbsp;Trên 10 năm&nbsp; </span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">20 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">&nbsp;20 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">&nbsp;Từ 05 năm đến 10 năm </span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">10 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:22px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">&nbsp;Dưới 05 năm </span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:22px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">&nbsp;0 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">2</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Cơ sở vật chất </span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Có đầy đủ trang thiết bị phục vụ đấu giá, có hội trường đấu giá thuộc quyền sở hữu hoặc được phép sử dụng chứa được 70 khách hàng trở lên. Có đưa ra phương án để đảm bảo an ninh, an toàn cho phiên đấu giá.</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">20 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">20 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Có đầy đủ trang thiết bị phục vụ đấu giá, có hội trường đấu giá cho từ 30 đến 70 khách h</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">àng</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">, có đưa ra phương án để đảm bảo an ninh, an toàn cho phiên đấu giá.</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">10 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Không đạt được một trong các tiêu chuẩn về cơ sở vật chất: Có đầy đủ trang thiết bị phục vụ đấu giá, có hội trường đấu giá, đưa được ra phương án để đảm bảo an ninh, an toàn cho phiên đấu giá.</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">0 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">3</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Năng lực, kinh nghiệm của đấu giá viên hành nghề tại đơn vị, được phân công làm đấu giá viên cho phiên đấu giá này của Viettel</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Đấu giá viên có kinh nghiệm hành nghề trên 06 năm và đã trực tiếp điều hành ít nhất là 25 phiên đấu giá/1 năm (trong vòng 3 năm từ 2019 đến 20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">2</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">1) (1)</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">20 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">20 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<ul>
							<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Đấu giá viên có kinh nghiệm hành nghề trên 06 năm và đã trực tiếp điều hành từ 15-24 phiên đấu giá/1 năm (trong vòng 3 năm từ 2019 đến 20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">2</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">1) (2)</span></span></span></span></li>
						</ul>

						<p style="margin-left:-1px; text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">Hoặc:</span></span></em></span></span></p>

						<ul>
							<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Đấu giá viên có kinh nghiệm từ 03 năm đến 06 năm và đã trực tiếp điều hành ít nhất là 25 phiên đấu giá/1 năm (trong vòng 3 năm từ 2019 đến 20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">2</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">1) (3)</span></span></span></span></li>
						</ul>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">10 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Đấu giá viên không đạt theo các tiêu chí (1), (2), (3) ở trên</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">&nbsp;0 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">4</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Số lượng đấu giá viên hành nghề tại đơn vị</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Trên 5 đấu giá viên</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">15 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">&nbsp;15 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Từ 03 đến 05 đấu giá viên</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">10 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Dưới 03 đấu giá viên</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">&nbsp;0 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">5</span></span></span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Số lượng hợp đồng bán đấu giá các loại tài sản là động sản trong năm 2021 có giá trị thanh lý ≥</span></span> <span style="font-size:13.0pt"><span style="font-family:Sarabun">52,4 tỷ đồng/1 hợp đồng</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Trên </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">05</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun"> hợp đồng</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">10</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun"> điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">10 điểm</span></span></span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Từ 0</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">2</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun"> đến </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">05</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun"> hợp đồng</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">5</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun"> điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Dưới 02 hợp đồng </span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">0</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun"> điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">6</span></span></span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Số lượng các phiên đấu giá đã tổ chức thành công trong vòng 3 năm gần đây (<em>báo cáo theo biểu mẫu </em></span></span><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">phụ lục 1 </span></span></em><em><span style="font-size:13.0pt"><span style="font-family:Sarabun">đính kèm</span></span></em><span style="font-size:13.0pt"><span style="font-family:Sarabun">)</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Trên 30 phiên/1 năm</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">10 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">10 điểm</span></span></span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Từ 20 phiên đến 30 phiên/1 năm</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">5 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:41px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Dưới 20 phiên /1 năm</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:41px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">&nbsp;0 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="4" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:82px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">7</span></span></span></span></p>
						</td>
						<td rowspan="4" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Thù lao dịch vụ đấu giá tài sản</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Thấp hơn từ 20% trở lên so với quy định của Thông tư </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">108</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/TT-BTC ngày 21/</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">12</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/2020 của Bộ Tài chính quy định khung thù lao dịch vụ đấu giá tài sản.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">3 điểm</span></span></span></span></p>
						</td>
						<td rowspan="4" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">3 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Thấp hơn từ 10% đến </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">&lt;</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">20% so với quy định của Thông tư </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">108</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/TT-BTC ngày 21/</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">12</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/2020 của Bộ Tài chính quy định khung thù lao dịch vụ đấu giá tài sản.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">2 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Thấp hơn </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">&lt;</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">10% so với quy định của Thông tư </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">108</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/TT-BTC ngày 21/</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">12</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/2020 của Bộ Tài chính quy định khung thù lao dịch vụ đấu giá tài sản.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">1</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun"> điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Bằng biểu giá quy định của Thông tư </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">108</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">20</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/TT-BTC ngày 21/</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">12</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">/2020 của Bộ Tài chính quy định khung thù lao dịch vụ đấu giá tài sản.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">0,5 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun"><span style="color:black">8</span></span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Chi phí đấu giá tài sản</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Tổ chức đấu giá tài sản có chi phí đấu giá thấp nhất</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">2 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">2 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Tổ chức đấu giá tài sản có chi phí đấu giá nằm trong khoảng giữa cao nhất và thấp nhất</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">1 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Tổ chức đấu giá tài sản có chi phí đấu giá cao nhất</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">0,1 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p>&nbsp;</p>
						</td>
						<td colspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:472px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:13.0pt"><span style="font-family:Sarabun">Tổng</span></span></strong></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:13.0pt"><span style="font-family:Sarabun">100 điểm</span></span></strong></span></span></p>
						</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">* Lưu ý:</span></span></span></em></strong></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">- Hồ sơ của tổ chức đấu giá được niêm phong</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black"> và dán kín</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black"> khi bàn giao cho Viettel.</span></span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">- Người đến nộp phải mang theo giấy giới thiệu và chứng minh thư nhân nhân.</span></span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">- Các hồ sơ Viettel nhận được sau </span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">17</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">h</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">3</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">0</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">’</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black"> ngày 02/0</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">3</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">/202</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">2</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black"> sẽ không được đưa vào danh sách đánh giá lựa chọn.</span></span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">- Viettel sẽ có văn bản thông báo kết quả cho tổ chức đấu giá được lựa chọn, những đơn vị không được thông báo kết quả được hiểu là không được lựa chọn, Viettel không hoàn trả hồ sơ với những đơn vị không được lựa chọn.</span></span></span></em></span></span></p>

<blockquote>
<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">Phụ lục 1: </span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">Biểu mẫu danh mục các phiên đấu giá thành công trong năm 2019</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">/2020</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:Sarabun"><span style="color:black">/2021</span></span></span></strong></span></span></p>

<table cellspacing="0" class="Table" style="border-collapse:collapse; margin-left:-1px; width:616px">
	<tbody>
		<tr>
			<td style="border-bottom-color:black; border-left-color:black; border-right-color:initial; border-right-width:initial; border-style:solid none solid solid; border-top-color:black; height:25px; width:43px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">STT</span></span></span></span></p>
			</td>
			<td style="border-color:black; border-style:solid; height:25px; vertical-align:top; width:88px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Số hợp đồng</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; vertical-align:top; width:98px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Ngày ký hợp đồng</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; vertical-align:top; width:93px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Chủ tài sản</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; width:109px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Loại tài sản</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; width:87px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Giá khởi điểm</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; width:98px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Giá sau đấu giá</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom-color:black; border-left-color:black; border-right-color:black; border-style:none solid solid; border-top-color:initial; border-top-width:initial; height:63px; width:43px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">1</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:88px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:98px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:93px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:109px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:87px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:98px">
			<p style="text-align:center">&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom-color:black; border-left-color:black; border-right-color:black; border-style:none solid solid; border-top-color:initial; border-top-width:initial; height:63px; width:43px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:Sarabun">2</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:88px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:98px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:93px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:109px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:87px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:98px">
			<p style="text-align:center">&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>
</blockquote>

<blockquote>Chi tiết xem tại <a href="https://drive.google.com/file/d/1EPgoM826I_IPokjYV46PwNg3LxKcuCy3/view?usp=sharing">ĐÂY</a>.</blockquote>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news11.webp', 2, 
  'Viettel Cambodia thưởng nóng đội tuyển U23 Việt Nam', 
  'Ngay sau trận chung kết ngày 26/2 trước U23 Thái Lan trên sân Sirodok Echo (Phnom Penh, Campuchia), Công ty Viettel Cambodia, một thành viên của Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel), đã thưởng nóng đội tuyển U23 Việt Nam để kịp thời động viên và biểu dương thành tích lần đầu vô địch Đông Nam Á.', 
  '2022-02-27', 
  '<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Đội tuyển do HLV Đinh Thế Nam dẫn dắt lên ngôi vô địch U23 Đông Nam Á 2022 đầy thuyết phục khi đội tuyển thắng cả 4 trận đấu, ghi được 9 bàn và không để thủng lưới lần nào. Đây là lần đầu tiên, U23 Việt Nam vô địch ở giải U23 Đông Nam Á. Trước đó, sân chơi này chỉ tổ chức 2 lần. Thái Lan và Indonesia là 2 đội đã giành chức vô địch.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Góp mặt trong đội hình vô địch của U23 Việt Nam là hậu vệ trái Phan Tuấn Tài của Viettel. Cầu thủ số 21 đã thi đấu với tinh thần quả cảm, lăn xả cùng với đồng đội để làm nên kỳ tích đặc biệt cho bóng đá Việt Nam. Dù chỉ hội quân 4 ngày trước trận chung kết để thay thế cho các đồng đội bị mắc Covid, di chuyển bằng đường bộ đầy vất vả nhưng hậu vệ trái của Viettel đã chứng tỏ bản lĩnh và là chốt chặn quan trọng của U23 Việt Nam.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/02/27/anh-02-1.jpg" style="height:666px; width:1000px"></span></span></span>Phan Tuấn Tài (thứ 5 từ phải sang, hàng cuối) ăn mừng chức vô địch cùng các đồng đội.</p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Chiến thắng này càng có ý nghĩa khi U23 Việt Nam gặp quá nhiều khó khăn về lực lượng vì ảnh hưởng của dịch Covid-19. Với bản lĩnh, ý chí, tinh thần quả cảm, tinh thần Việt Nam, tinh thần của những “Chiến binh sao vàng”, Ban huấn luyện và các cầu thủ đã vượt lên nghịch cảnh, quyết tâm hết mình vì màu cờ sắc áo vì niềm tin của người hâm mộ để có một quá trình chuẩn bị và thi đấu xuất sắc, mang lại niềm vui, niềm tự hào cho Tổ quốc, nhân dân và người hâm mộ cả nước, trong đó có những người Việt Nam, cán bộ, nhân viên Viettel tại Campuchia.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:Sarabun,sans-serif"><span style="color:#000000">Để chia sẻ niềm vui lớn này và khích lệ nỗ lực không ngừng của toàn thể đội tuyển U23 Việt Nam trong thời gian tập luyện, thi đấu, đại diện Công ty Viettel Cambodia, Tổng Giám đốc Phùng Văn Cường, đã dành tặng phần thưởng trị giá 10.000 USD cho các cầu thủ và ban huấn luyện.</span></span></span></p>

<p>&nbsp;</p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news12.webp', 5, 
  'Đại diện Viettel ghi danh top 10 gương mặt trẻ Việt Nam tiêu biểu 2021', 
  'Đồng chí Lưu Đức Phong, Phòng Nền tảng số - Trung tâm Chuyển đổi số - TCT Mạng lưới Viettel (VTNet) đã vượt qua nhiều ứng viên - là những đoàn viên, thanh niên ưu tú trên cả nước - để ghi danh vào top 10 Gương mặt trẻ Việt Nam tiêu biểu năm 2021', 
  '2022-03-07', 
  '<p>Dựa trên kết quả tham khảo từ hệ thống bình chọn trực tuyến của 20 đề cử, Trung ương Đoàn, hội đồng xét tặng Giải thưởng Gương mặt trẻ Việt Nam tiêu biểu năm 2021 đã phân tích, thảo luận kỹ về từng trường hợp, cân nhắc trên nhiều yếu tố và bỏ phiếu kín chọn ra 10 gương mặt xuất sắc nhất để trao giải thưởng Gương mặt trẻ Việt Nam tiêu biểu năm 2021 và 9 Gương mặt trẻ Việt Nam triển vọng năm 2021.</p>

<p>Kết quả công bố hôm 4/3 cho thấy đồng chí Lưu Đức Phong là một trong 10 Gương mặt trẻ Việt Nam tiêu biểu năm 2021. Đồng chí&nbsp;cũng là đại diện Viettel duy nhất được đề cử giải Gương mặt trẻ năm nay.</p>

<p><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/03/07/lu-duc-phong-btt.png" style="height:694px; width:1000px"><br>
<em>Đồng chí Lưu Đức Phong, Phòng Nền tảng số - Trung tâm Chuyển đổi số - TCT Mạng lưới Viettel (VTNet)</em></p>

<p>Thời gian qua, đồng chí Phong đã có nhiều đóng góp cho công tác chuyển đổi số doanh nghiệp.&nbsp;Đồng chí Phong là người trực tiếp nghiên cứu và phát triển nền tảng chuyển đổ số doanh nghiệp hàng đầu Việt Nam mang tên nBOX. Sản phẩm đã xuất sắc đạt giải thưởng Sao Khuê và Make in Vietnam năm 2020, khi áp dụng tại các Tổng Công ty trong Tập đoàn đã&nbsp;giúp tiết kiệm chi phí phát triển ứng dụng lên đến hàng chục tỉ đồng và thời gian nhanh gấp 5 lần cách làm truyền thống.</p>

<p>Tại VTNet, đồng chí cũng chủ trì và trực tiếp&nbsp;nghiên cứu, áp dụng các công nghệ 4.0 (trí tuệ nhân tạo -AI/ML, dữ liệu lớn - Big data) xây dựng các hệ thống hỗ trợ vận hành và khai thác mạng lưới của Viettel bao gồm: hệ thống hỗ trợ trả lời tự động VTNet – Bot chat, hệ thống nhận diện ảnh tự động (Computer Vision) giúp xử lý hơn 1 triệu lượt yêu cầu tự động/tháng với độ sẵn sàng 24/7.</p>

<p>Đồng chí Phong chính thức nhận giải thưởng vào&nbsp;Lễ tuyên dương diễn ra ngày 26-3 tại Nhà hát Lớn Hà Nội. Buổi lễ&nbsp;dự kiến có sự tham dự, trao giải thưởng của lãnh đạo Đảng, Nhà nước, Chính phủ và được truyền hình trực tiếp trên sóng Đài truyền hình Việt Nam.</p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news13.webp', 2, 
  'Viettel tặng 1 tỷ đồng tới Đội tuyển Bóng đá nữ Việt Nam nhân dịp Quốc tế Phụ nữ 8/3', 
  'Ngày 08/03/2022, tại buổi gặp mặt giữa Chủ tịch Quốc hội Vương Đình Huệ và Đội tuyến Bóng đá nữ Việt Nam diễn ra tại Hà Nội, Tập đoàn Công nghiệp – Viễn thông Quân đội (Viettel) đã trao tặng phần quà trị giá 1 tỷ đồng cho Đội tuyển.', 
  '2022-03-08', 
  '<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Món quà thể hiện sự trân trọng đối với những nỗ lực vượt bậc của các nữ tuyển thủ tại Giải vô địch Bóng đá nữ châu Á để lần đầu tiên giành quyền tham dự Giải vô địch Bóng đá nữ Thế giới năm 2023. Đây cũng là sự động viên, khích lệ tinh thần đội tuyển tiếp tục đoàn kết, phát huy hơn nữa trong các giải đấu trong nước và quốc tế sắp tới. </span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Viettel hi vọng đội tuyển sẽ tiếp tục hoàn thành xuất sắc nhiệm vụ tại SEA Games 31, mang vinh quang về cho bóng đá nước nhà. </span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Viettel là chủ quản của Trung tâm Thể thao Viettel, là đơn vị quản lý Đội bóng Viettel (Viettel FC) hiện đang tham gia thi đấu tại hạng cao nhất của giải bóng đá nam Việt Nam. </span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:Sarabun">Với mục tiêu đóng góp cho sứ mệnh đưa bóng đá Việt Nam đến World Cup, Viettel tập trung phát triển bóng đá một cách bài bản, lấy chỉ tiêu chính là số lượng cầu thủ đóng góp cho Đội tuyển Bóng đá nam Quốc gia. Với tầm nhìn đó, Tập đoàn triển khai các hoạt động đào tạo chuyên nghiệp và toàn diện cho các lứa cầu thủ, cả về chuyên môn, </span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun">bồi dưỡng</span></span><span style="font-size:13.0pt"><span style="font-family:Sarabun"> văn hoá và lối sống.</span></span></span></span></p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news14.webp', 2, 
  'Phó Chủ tịch Quốc hội thăm và làm việc với Tập đoàn Công nghiệp - Viễn thông Quân đội', 
  'Hà Nội, Ngày 17 tháng 3 năm 2022 – Thượng tướng Trần Quang Phương, Ủy viên TƯ Đảng, Phó Chủ tịch Quốc hội đã thăm và làm việc với Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel).', 
  '2022-03-18', 
  '<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:Sarabun">Tham dự chương trình có </span><span style="font-family:Sarabun">các Ủy viên TƯ Đảng: Tổng Thư ký Quốc hội, Chủ nhiệm Văn phòng Quốc hội Bùi Văn Cường; Chủ nhiệm Ủy ban Quốc phòng và An ninh, Thiếu tướng Lê Tấn Tới; Chủ nhiệm Ủy ban Tài chính và Ngân sách Nguyễn Phú Cường; Trưởng Ban Dân nguyện Dương Thanh Bình; Phó Tổng tham mưu trưởng Quân đội Nhân dân Việt Nam, Trung tướng Huỳnh Chiến Thắng.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:Sarabun">Tại Viettel, </span><span style="font-family:Sarabun">Phó Chủ tịch Quốc hội </span><span style="font-family:Sarabun">và đoàn công tác </span><span style="font-family:Sarabun">đã tham quan khu trưng bày sản phẩm công nghiệp công nghệ cao, tìm hiểu thực tế các trang thiết bị kỹ thuật quân sự hiện đại, các thiết bị hạ tầng viễn thông, công nghệ thông tin do Viettel nghiên cứu và sản xuất. Phó Chủ tịch Quốc hội cùng đoàn công tác </span><span style="font-family:Sarabun">đồng thời </span><span style="font-family:Sarabun">đã trải nghiệm các giải pháp chuyển đổi số và đảm bảo an ninh, an toàn trên không gian mạng do Viettel làm chủ.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:Sarabun">Phó Chủ tịch Quốc hội Trần Quang Phương và Đoàn công tác đã nghe </span><span style="font-family:Sarabun">Đại tá Tào Đức Thắng, Chủ tịch kiêm Tổng giám đốc Tập đoàn báo cáo về kết quả thực hiện nhiệm vụ của doanh nghiệp, trong đó nổi bật là các thành tựu Viettel đạt được trong hơn 30 năm hình thành và phát triển.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:Sarabun"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/03/18/anh-02-pho-chu-tich-quoc-hoi-tham-viettel.jpg" style="width:1000px"></span></span></span><em><span style="font-size:10.5pt"><span style="font-family:&quot;Arial&quot;,sans-serif"><span style="color:black">Thượng tướng Trần Quang Phương, Ủy viên TƯ Đảng, Phó Chủ tịch Quốc hội và đoàn công tác đã tham quan khu trưng bày sản phẩm công nghiệp công nghệ cao, tìm hiểu thực tế các trang thiết bị kỹ thuật quân sự hiện đại, các thiết bị hạ tầng viễn thông, công nghệ thông tin do Viettel nghiên cứu và sản xuất.&nbsp;</span></span></span></em></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Sarabun">Biểu dương các kết quả đạt được của Viettel, </span></span><span style="font-family:Sarabun">Thượng tướng Trần Quang Phương, Phó Chủ tịch Quốc hội ghi nhận những nỗ lực, cố gắng của </span><span style="font-family:Sarabun">Viettel </span><span style="font-family:Sarabun">trong thực hiện nhiệm vụ sản xuất kinh doanh và đảm bảo an ninh quốc phòng của Viettel.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:Sarabun">Theo </span><span style="font-family:Sarabun">Phó Chủ tịch Quốc hội</span><span style="font-family:Sarabun">, k</span><span style="font-family:Sarabun">ết quả sản xuất kinh doanh của Viettel đã thể hiện bằng tốc độ tăng trưởng vượt bậc trong nhiều năm, bằng số tiền đóng góp ngân sách nhà nước khi liên tục là doanh nghiệp trong tốp đầu các doanh nghiệp nộp thuế &nbsp;và thực hiện nhiều chương trình xã hội ý nghĩa. </span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:Sarabun">Đ</span><span style="font-family:Sarabun">ánh giá cao </span><span style="font-family:Sarabun">công tác </span><span style="font-family:Sarabun">đầu tư nước ngoài của Viettel, </span><span style="font-family:Sarabun">Phó Chủ tịch Quốc hội cho rằng hoạt động này </span><span style="font-family:Sarabun">không chỉ đóng góp vào phát triển kinh tế đất nước mà còn </span><span style="font-family:Sarabun">xây dựng </span><span style="font-family:Sarabun">hình ảnh </span><span style="font-family:Sarabun">con </span><span style="font-family:Sarabun">người Việt Nam hiện đại, </span><span style="font-family:Sarabun">quảng bá </span><span style="font-family:Sarabun">công nghệ </span><span style="font-family:Sarabun">Việt Nam </span><span style="font-family:Sarabun">với bạn bè quốc tế. Hiệu quả đầu tư nước ngoài của Viettel </span><span style="font-family:Sarabun">đồng thời </span><span style="font-family:Sarabun">đóng góp tích cực bảo vệ </span><span style="font-family:Sarabun">T</span><span style="font-family:Sarabun">ổ quốc từ xa.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:Sarabun">Thượng tướng </span><span style="font-family:Sarabun">Trần Quang Phương </span><span style="font-family:Sarabun">khẳng định</span><span style="font-family:Sarabun">, bằng nội lực của chính mình, Viettel đã </span><span style="font-family:Sarabun">tạo ra </span><span style="font-family:Sarabun">những kết quả đột phá </span><span style="font-family:Sarabun">với nhiều thành tựu </span><span style="font-family:Sarabun">trong lĩnh vực nghiên cứu chế tạo công nghiệp công nghệ cao</span><span style="font-family:Sarabun">. Bên cạnh đó Viettel cũng </span><span style="font-family:Sarabun">từng bước làm chủ những công nghệ hiện đại nhất của viễn thông, song hành với thế giới khi sản xuất thành công thiết bị mạng 4G, 5G. Trong lĩnh vực quân sự, Viettel đã nghiên cứu sản xuất thành công sản phẩm công nghiệp quốc phòng công nghệ cao, góp phần hiện đại hóa quân đội. </span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><em><span style="font-family:Sarabun">“</span></em><em><span style="font-family:Sarabun">Những kết quả mà Viettel đạt được là sự phát triển mới của ngành công nghiệp quốc phòng Việt Nam, tăng thêm niềm tin vững chắc của Đảng, Nhà nước, Bộ Quốc phòng đối với Viettel, nâng cao vị thế, uy tín của Viettel trong lĩnh vực công nghiệp quốc phòng”</span></em><span style="font-family:Sarabun">, Phó Chủ tịch Quốc hội phát biểu.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:Sarabun">Phó Chủ tịch Quốc hội cũng đánh giá Viettel đã thành công trong chiến lược chuyển đổi số, đóng góp lớn vào tiến trình chuyển đổi số quốc gia, hoan nghênh sứ mệnh Viettel đặt ra cho mình, đó là, tiên phong, chủ lực kiến thiết nên xã hội số ở Việt Nam với 4 trọng tâm gồm: Chính phủ số để người dân được phục vụ tốt hơn; Kinh tế số để người dân giàu có hơn; Xã hội số để người dân hạnh phúc hơn; An ninh mạng để người dân sống và làm việc an toàn hơn.</span></span></span></p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news15.webp', 2, 
  'Cơ hội để sinh viên xuất sắc ngành công nghệ thực tập tại Viettel trong các dự án chuyển đổi số Quốc gia', 
  'Tập đoàn Công nghiệp - Viễn thông Quân đội (Viettel) vừa công bố triển khai chương trình Thực tập sinh tài năng - Viettel Digital Talent (VDT) 2022. Trong năm thứ hai tổ chức chương trình, Viettel tăng gấp đôi chỉ tiêu tuyển thực tập sinh để tham gia vào các dự án chuyển đổi số quan trọng.', 
  '2022-03-21', 
  '<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="font-family:Sarabun">Vòng tuyển sinh của VDT 2022 kéo dài đến hết 31/3/2022 sẽ lựa chọn 135 thực tập sinh xuất sắc nhất thông qua ba bài thi Tiếng Anh, IQ và Chuyên môn. Ứng viên có thể xem thông tin chi tiết và đăng ký tham gia tại trang chủ của chương trình</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">:</span></span> <a href="https://tuyendung.viettel.vn/VRS_FE/viettel-digital-talent-program" style="color:#0563c1; text-decoration:underline"><span style="font-size:12.0pt"><span style="font-family:Sarabun">https://tuyendung.viettel.vn/VRS_FE/viettel-digital-talent-program</span></span></a><span style="font-size:12.0pt"><span style="font-family:Sarabun">.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="font-family:Sarabun">Chương trình</span></span> <span style="font-size:12.0pt"><span style="font-family:Sarabun">diễn ra trong 6 tháng. Trong 3 tháng đầu tiên, thực tập sinh được đào tạo chuyên sâu và định hướng nghề nghiệp bởi các chuyên gia hàng đầu trong lĩnh vực đã lựa chọn. Trong 3 tháng còn lại, thực tập sinh trực tiếp tham gia vào dự án thực tế tại các bộ phận chuyên môn của Viettel. Kết thúc chương trình, 25% thực tập sinh xuất sắc nhất sẽ được mời đảm nhận vị trí chính thức tại Viettel với mức lương cạnh tranh.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="font-family:Sarabun">Các sinh viên sẽ được đ</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">ồng hành cùng đội ngũ chuyên gia </span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">được xếp hạng trên thế giới như chuyên gia về</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun"> mã độc</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">; </span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">chuyên gia bảo mật</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">;</span></span> <span style="font-size:12.0pt"><span style="font-family:Sarabun">c</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">huyên gia trí tuệ nhân tạo</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">; chuyên gia </span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">vận hành khai thác</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun"> mạng lưới</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun"> toàn cầu</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">…</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="font-family:Sarabun"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/03/21/anh-03-vdt2022.jpg" style="width:1000px"></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="font-family:Sarabun">Tại VDT 2021, 22/70 thực tập sinh đã trực tiếp tham gia vào các dự án trọng điểm của Viettel như triển khai hạ tầng máy chủ riêng Private Cloud, mô hình nhận dạng tiếng nói tiếng Việt, hệ thống trí tuệ nhân tạo Customer Centric AI, sản phẩm giám sát thông tin mạng xã hội Reputa… Kết thúc VDT 2021, 12 thực tập sinh xuất sắc nhất đã được Viettel mời làm việc tại Tập đoàn.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="font-family:Sarabun">Chủ tịch - Tổng Giám đốc Viettel, ông Tào Đức Thắng cho biết: “Với sứ mệnh Tiên phong, Chủ lực Kiến tạo xã hội số, Viettel có nhu cầu rất lớn về nhân lực chất lượng cao. Là doanh nghiệp công nghệ hàng đầu của Việt Nam, Viettel xây dựng chương trình Viettel Digital Talent để tạo cơ hội cho các bạn trẻ trải nghiệm, cọ xát, đồng hành cùng Viettel tạo ra những thay đổi ý nghĩa, góp phần xây dựng xã hội số, kinh tế số Việt Nam.”</span></span></span></span></p>

<blockquote>
<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="font-family:Sarabun">Nằm trong chiến lược phát triển nhân lực trẻ lĩnh vực công nghệ nhằm thực hiện sứ mệnh tiên phong, chủ lực kiến tạo xã hội số, chương trình Thực tập sinh tài năng (</span></span><a href="https://tuyendung.viettel.vn/VRS_FE/viettel-digital-talent-program" style="color:#0563c1; text-decoration:underline"><span style="font-size:12.0pt"><span style="font-family:Sarabun">Viettel Digital Talent</span></span></a><span style="font-size:12.0pt"><span style="font-family:Sarabun">) là chương trình thường niên do Viettel tổ chức, bắt đầu từ năm 2021. </span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="font-family:Sarabun">Đối tượng của chương trình là các bạn sinh viên năm 3, 4, học viên sau đại học có thành tích học tập xuất sắc trong các ngành Công nghệ thông tin, Khoa học máy tính, Điện tử Viễn thông, An toàn thông tin, Khoa học dữ liệu &amp; Trí tuệ nhân tạo, Marketing và các ngành tương đương, có thành tích xuất sắc trong học tập hoặc công việc (</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">G</span></span><span style="font-size:12.0pt"><span style="font-family:Sarabun">PA tương đương từ 3.0/4.0 trở lên; hoặc đạt giải học sinh giỏi, quốc gia, quốc tế trong lĩnh vực liên quan; hoặc có thành tích xuất sắc khi tham gia các dự án lớn trong lĩnh vực liên quan).</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="font-family:Sarabun">Chương trình được thiết kế bởi các chuyên gia hàng đầu Viettel giúp các tài năng trẻ khai phá tiềm năng và phát triển chuyên môn trong các lĩnh vực Cloud, Cyber Security, Data Science &amp; AI, Internet of Things, Marketing.</span></span></span></span></p>
</blockquote>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news16.webp', 3, 
  'Thông báo v/v lựa chọn tổ chức đấu giá tài sản', 
  'Lô 29.993 đơn vị tài sản là vật tư thiết bị đã qua sử dụng tồn kho.', 
  '2022-03-23', 
  '<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Căn cứ Luật đấu giá tài sản số 01/2016/QH14 ngày 17/11/2016 của Quốc hội nước Cộng hòa xã hội chủ nghĩa Việt Nam;</span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Căn cứ quyết định số 1281/QĐ-VTQĐ ngày 22/03/2022 về việc phê duyệt &nbsp;giá bán và hình thức </span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">l</span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">ô vật tư thiết bị đã qua sử dụng tồn kho không có nhu cầu sử dụng của Tập đoàn Công nghiệp Viễn thông Quân đội.</span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">Tập đoàn Công nghiệp Viễn thông Quân đội (Viettel) thông báo về việc lựa chọn tổ chức đấu giá tài sản như sau: </span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">1. T</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">ên địa chỉ của đơn vị có tài sản </span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">đấu giá:</span></span></span></strong></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tên đơn vị: Tập đoàn Công nghiệp Viễn thông Quân đội (Viettel).</span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Địa chỉ: Lô D26 Khu đô thị mới Cầu Giấy, phường Yên Hòa, quận Cầu &nbsp;&nbsp;Giấy, TP. Hà Nội.</span></span></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">2</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">. T</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">ên tài sản, số lượng, chất lượng của tài sản </span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">đấu giá:</span></span></span></strong></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">Tên tài sản: </span></span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">29.993</span></span> <span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">đơn vị tài sản </span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">l</span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">à vật tư thiết bị </span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">đã qua sử dụng </span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">tồn kho</span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">.</span></span></span></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">3</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">. </span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">Giá khởi điểm của tài sản </span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">đấu giá:</span></span></span></strong></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">Giá khởi điểm bán thanh lý (đã bao gồm VAT): 1.516.000.000 VNĐ (Bằng chữ: Một tỉ năm trăm mười sáu triệu đồng). </span></span></span></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">Lưu ý: Bán cho cả lô tài sản, đây là giá bán tại chỗ (tại các địa điểm để tài sản của Viettel), toàn bộ chi phí vận chuyển, bốc xếp và các chi phí phát sinh khác (nếu có) do bên mua chịu.</span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">4</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">. Thời gian nhận hồ sơ: </span></span></span></strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">kể từ ngày đăng thông báo đến<strong> </strong></span></span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">17h30’ ngày </span></span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">25/</span></span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">03</span></span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">/20</span></span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">22</span></span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">.</span></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">5</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">. Địa điểm nộp hồ sơ:</span></span></span></strong></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Ban Đầu tư Xây dựng - Tập đoàn Công nghiệp Viễn thông Quân đội - Lô D26 Khu đô thị mới Cầu Giấy, phường Yên Hòa, quận Cầu Giấy, TP</span></span> <span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Hà Nội.</span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Đầu mối liên hệ: Trần Thị Nga <em>(email:ngatt8@viettel.com.vn; </em></span></span><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Điện thoại</span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">: 0976622333)</span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">.</span></span></em></span></span></li>
</ul>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">6</span></span></span></strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">. Tiêu chí lựa chọn tổ chức bán đấu giá tài sản: </span></span></span></strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">gồm 2 tiêu chí là Bắt buộc và Chấm điểm.</span></span></span></span></span></p>

<table cellspacing="0" class="Table" style="border-collapse:collapse; width:613px">
	<tbody>
		<tr>
			<td style="height:175px; width:613px">
			<p style="margin-right:-7px; text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">6</span></span></strong><strong><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">.1. Phương pháp đánh giá các tiêu chí:</span></span></em></strong><strong><em> </em></strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Các tiêu chí phải có văn bản giấy tờ chứng minh đi kèm</span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> (bản chính hoặc bản sao công chứng).</span></span></span></span></p>

			<ul>
				<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><u><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tiêu chí bắt buộc:</span></span></u><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> Tổ chức đấu giá tài sản phải đáp ứng 100% các tiêu chí bắt buộc mới được đưa vào đánh giá về điểm. Trường hợp không đạt một trong số các tiêu chí bắt buộc thì bị đánh giá là Không đạt và bị loại. </span></span></span></span></li>
				<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><u><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tiêu chí chấm điểm:</span></span></u><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> Tối thiểu phải đạt 80 điểm và không có tiêu chí nào bị chấm điểm =0 thì được đánh giá là Đạt. Đơn vị nào Đạt và có điểm cao hơn là đơn vị được lựa chọn. </span></span></span></span></li>
			</ul>

			<ul>
				<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Trường hơp các đơn vị được đánh giá là Đạt và có điểm cao nhất bằng nhau thì xét theo tiêu chí vượt mức tối đa, đơn vị nào có nhiều tiêu chí vượt mức điểm tối đa sẽ được lựa chọn.</span></span></span></span></li>
				<li style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Trường hợp các đơn vị được đánh giá là Đạt, điểm cao nhất bằng nhau, các tiêu chí vượt mức tối đa bằng nhau thì đơn vị nào vượt mức cao hơn là đơn vị được lựa chọn. </span></span></span></span></li>
			</ul>
			</td>
		</tr>
		<tr>
			<td style="height:25px; width:613px">
			<div style="page-break-after:always"><span style="display:none">&nbsp;</span></div>

			<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">6</span></span></strong><strong><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">.2. Tiêu chí bắt buộc: </span></span></em></strong></span></span></p>

			<table cellspacing="0" class="Table" style="border-collapse:collapse; border:none">
				<thead>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:67px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">STT</span></span></em></strong></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:231px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Hồ sơ yêu cầu</span></span></em></strong></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:166px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tiêu chí chấm điểm</span></span></em></strong></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:top; width:133px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Bắt buộc</span></span></em></strong></span></span></p>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:80px; vertical-align:top; width:67px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">1</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:80px; vertical-align:top; width:231px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Có tên trong danh sách các tổ chức đấu giá tài sản do Bộ Tư pháp công bố trong thời gian gần nhất</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:80px; vertical-align:top; width:166px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Có tên trong danh sách</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:80px; vertical-align:top; width:133px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">X</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; vertical-align:top; width:67px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:231px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Phương án đấu giá</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:166px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Đúng quy định của Pháp luật, đáp ứng yêu cầu của Viettel, đảm bảo tính công khai, minh bạch, khách quan và hiệu quả</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:top; width:133px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">X</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:97px; vertical-align:top; width:67px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">3</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:97px; vertical-align:top; width:231px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Cam kết v/v đơn vị bán đấu giá và đấu giá viên của đơn vị chưa từng bị vi phạm pháp luật về bán đấu giá tài sản theo kết luận của cơ quan nhà nước có thẩm quyền.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:97px; vertical-align:top; width:166px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Không bị vi phạm</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:97px; vertical-align:top; width:133px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">X</span></span></span></span></p>
						</td>
					</tr>
				</tbody>
			</table>

			<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">6</span></span></em></strong><strong><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">.3. Tiêu chí chấm điểm:</span></span></em></strong></span></span></p>

			<table cellspacing="0" class="Table" style="border-collapse:collapse; width:595px">
				<thead>
					<tr>
						<td rowspan="2" style="background-color:white; border-bottom:1px solid black; border-left:1px solid black; border-right:none; border-top:1px solid black; height:24px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">STT</span></span></em></strong></span></span></p>
						</td>
						<td rowspan="2" style="background-color:white; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:24px; width:122px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Hồ sơ yêu cầu</span></span></em></strong></span></span></p>
						</td>
						<td rowspan="2" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:24px; width:274px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tiêu chí chấm điểm</span></span></em></strong></span></span></p>
						</td>
						<td colspan="2" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:24px; width:151px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Chấm điểm</span></span></em></strong></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Số điểm </span></span></em></strong></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tổng điểm</span></span></em></strong></span></span></p>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:23px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">1</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Thời gian hoạt động liên tục trong lĩnh vực đấu giá tài sản của đơn vị tính đến thời điểm tổ chức phiên đấu giá.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;Trên 10 năm&nbsp; </span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;20 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;Từ 05 năm đến 10 năm </span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:23px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">10 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:22px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;Dưới 05 năm </span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:22px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;0 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Cơ sở vật chất cho phiên đấu giá này của Viettel</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Có đầy đủ trang thiết bị phục vụ đấu giá, có hội trường đấu giá thuộc quyền sở hữu hoặc được phép sử dụng chứa được 70 khách hàng trở lên. Có đưa ra phương án để đảm bảo an ninh, an toàn cho phiên đấu giá.</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Có đầy đủ trang thiết bị phục vụ đấu giá, có hội trường đấu giá cho từ 30 đến 70 khách h</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">àng</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">, có đưa ra phương án để đảm bảo an ninh, an toàn cho phiên đấu giá.</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">10 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Không đạt được một trong các tiêu chuẩn về cơ sở vật chất: Có đầy đủ trang thiết bị phục vụ đấu giá, có hội trường đấu giá, đưa được ra phương án để đảm bảo an ninh, an toàn cho phiên đấu giá.</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">0 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">3</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Năng lực, kinh nghiệm của đấu giá viên hành nghề tại đơn vị, được phân công làm đấu giá viên cho phiên đấu giá này của Viettel</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Đấu giá viên có kinh nghiệm hành nghề trên 06 năm và đã trực tiếp điều hành ít nhất là 25 phiên đấu giá/1 năm (trong vòng 3 năm từ 2019 đến 20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">1) (1)</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<ul>
							<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Đấu giá viên có kinh nghiệm hành nghề trên 06 năm và đã trực tiếp điều hành từ 15-24 phiên đấu giá/1 năm (trong vòng 3 năm từ 2019 đến 20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">1) (2)</span></span></span></span></li>
						</ul>

						<p style="margin-left:-1px; text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Hoặc:</span></span></em></span></span></p>

						<ul>
							<li style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Đấu giá viên có kinh nghiệm từ 03 năm đến 06 năm và đã trực tiếp điều hành ít nhất là 25 phiên đấu giá/1 năm (trong vòng 3 năm từ 2019 đến 20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">1) (3)</span></span></span></span></li>
						</ul>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">10 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Đấu giá viên không đạt theo các tiêu chí (1), (2), (3) ở trên</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;0 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">4</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Số lượng đấu giá viên hành nghề tại đơn vị</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Trên 5 đấu giá viên</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">15 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;15 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Từ 03 đến 05 đấu giá viên</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">10 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Dưới 03 đấu giá viên</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;0 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">5</span></span></span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Số lượng hợp đồng bán đấu giá các loại tài sản là động sản trong năm 2021 có giá trị thanh lý ≥</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> 1,6</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> tỷ đồng/1 hợp đồng</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Trên </span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">05</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> hợp đồng</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">10</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">10 điểm</span></span></span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Từ 0</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> đến </span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">05</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> hợp đồng</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">5</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Dưới 02 hợp đồng </span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">0</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">6</span></span></span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Số lượng các phiên đấu giá đã tổ chức thành công trong vòng 3 năm gần đây (<em>báo cáo theo biểu mẫu </em></span></span><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">phụ lục 1 </span></span></em><em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">đính kèm</span></span></em><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">)</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Trên 30 phiên/1 năm</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">10 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">10 điểm</span></span></span></span></p>

						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;</span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Từ 20 phiên đến 30 phiên/1 năm</span></span></span></span></p>
						</td>
						<td style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">5 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:41px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Dưới 20 phiên /1 năm</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:41px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&nbsp;0 điểm </span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="4" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:82px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">7</span></span></span></span></p>
						</td>
						<td rowspan="4" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:122px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Thù lao dịch vụ đấu giá tài sản</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> (ghi cụ thể thù lao dịch vụ đấu giá trước thuế, thuế và tổng thù lao dịch vụ đấu giá đã bao gồm thuế)</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Thấp hơn từ 20% trở lên so với quy định của Thông tư </span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">108</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/TT-BTC ngày 21/</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">12</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/2020 của Bộ Tài chính quy định khung thù lao dịch vụ đấu giá tài sản.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">3 điểm</span></span></span></span></p>
						</td>
						<td rowspan="4" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">3 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Thấp hơn từ 10% đến </span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&lt;</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20% so với quy định của Thông tư </span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">108</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/TT-BTC ngày 21/</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">12</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/2020 của Bộ Tài chính quy định khung thù lao dịch vụ đấu giá tài sản.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Thấp hơn </span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">&lt;</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">10% so với quy định của Thông tư </span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">108</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/TT-BTC ngày 21/</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">12</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/2020 của Bộ Tài chính quy định khung thù lao dịch vụ đấu giá tài sản.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">1</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Bằng biểu giá quy định của Thông tư </span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">108</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">20</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/TT-BTC ngày 21/</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">12</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">/2020 của Bộ Tài chính quy định khung thù lao dịch vụ đấu giá tài sản.</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:82px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">0,5 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">8</span></span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:122px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Chi phí đấu giá tài sản</span></span><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"> (ghi cụ thể chi phí đấu giá trước thuế, thuế và tổng chi phí đấu giá đã bao gồm thuế)</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tổ chức đấu giá tài sản có chi phí đấu giá thấp nhất</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2 điểm</span></span></span></span></p>
						</td>
						<td rowspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tổ chức đấu giá tài sản có chi phí đấu giá nằm trong khoảng giữa cao nhất và thấp nhất</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">1 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:274px">
						<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tổ chức đấu giá tài sản có chi phí đấu giá cao nhất</span></span></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">0,1 điểm</span></span></span></span></p>
						</td>
					</tr>
					<tr>
						<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:21px; width:48px">
						<p>&nbsp;</p>
						</td>
						<td colspan="3" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:472px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Tổng</span></span></strong></span></span></p>
						</td>
						<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:21px; width:76px">
						<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">100 điểm</span></span></strong></span></span></p>
						</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><strong><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">* Lưu ý:</span></span></span></em></strong></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">- Hồ sơ của tổ chức đấu giá được niêm phong</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"> và dán kín</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"> khi bàn giao cho Viettel.</span></span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">- Người đến nộp phải mang theo giấy giới thiệu và chứng minh thư nhân nhân.</span></span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">- Các hồ sơ Viettel nhận được sau </span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">17</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">h</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">3</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">0</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">’</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"> ngày 25/0</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">3</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">/202</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">2</span></span></span></em><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"> sẽ không được đưa vào danh sách đánh giá lựa chọn.</span></span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><em><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">- Viettel sẽ có văn bản thông báo kết quả cho tổ chức đấu giá được lựa chọn, những đơn vị không được thông báo kết quả được hiểu là không được lựa chọn, Viettel không hoàn trả hồ sơ với những đơn vị không được lựa chọn.</span></span></span></em></span></span></p>

<p style="text-align:justify"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trân trọng</span></span></span><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">./.</span></span></span></span></span></p>

<p style="text-align:justify"><strong style="font-family:Arial,sans-serif; font-size:10pt; text-align:center"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">Phụ lục 1: </span></span></span></strong><strong style="font-family:Arial,sans-serif; font-size:10pt; text-align:center"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">Biểu mẫu danh mục các phiên đấu giá thành công trong năm 2019</span></span></span></strong><strong style="font-family:Arial,sans-serif; font-size:10pt; text-align:center"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">/2020</span></span></span></strong><strong style="font-family:Arial,sans-serif; font-size:10pt; text-align:center"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">/2021</span></span></span></strong></p>

<table cellspacing="0" class="Table" style="border-collapse:collapse; margin-left:-1px; width:616px">
	<tbody>
		<tr>
			<td style="border-bottom-color:black; border-left-color:black; border-right-color:initial; border-right-width:initial; border-style:solid none solid solid; border-top-color:black; height:25px; width:48px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">STT</span></span></span></span></p>
			</td>
			<td style="border-color:black; border-style:solid; height:25px; vertical-align:top; width:87px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Số hợp đồng</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; vertical-align:top; width:97px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Ngày ký hợp đồng</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; vertical-align:top; width:92px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Chủ tài sản</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; width:108px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Loại tài sản</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; width:87px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Giá khởi điểm</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:solid solid solid none; border-top-color:black; height:25px; width:97px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:13.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">Giá sau đấu giá</span></span></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom-color:black; border-left-color:black; border-right-color:black; border-style:none solid solid; border-top-color:initial; border-top-width:initial; height:63px; width:48px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">1</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:87px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:97px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:92px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:108px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:87px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:97px">
			<p style="text-align:center">&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom-color:black; border-left-color:black; border-right-color:black; border-style:none solid solid; border-top-color:initial; border-top-width:initial; height:63px; width:48px">
			<p style="text-align:center"><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif">2</span></span></span></span></p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:87px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:97px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; vertical-align:top; width:92px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:108px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:87px">
			<p>&nbsp;</p>
			</td>
			<td style="border-bottom-color:black; border-left-color:initial; border-left-width:initial; border-right-color:black; border-style:none solid solid none; border-top-color:initial; border-top-width:initial; height:63px; width:97px">
			<p style="text-align:center">&nbsp;</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p><span style="font-size:10pt"><span style="font-family:Arial,sans-serif"><span style="font-size:14.0pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black">Chi tiết xem thêm tại <a href="https://drive.google.com/file/d/15rqzlAmMnPjDBzUR9tNBTztqS1z9nsBv/view?usp=sharing">ĐÂY</a>.</span></span></span></span></span></p>');
INSERT INTO `ALLNEWS` (status, thumbnail, category_id, title, description, date, content)
VALUES (1, 'public/assets/img/allnews/news17.webp', 5, 
  'Viettel tôn vinh tập thể, cá nhân xuất sắc toàn cầu 2021', 
  'Hà Nội, Ngày 28 tháng 3 năm 2022 - Tập đoàn Công nghiệp - Viễn thông Quân đội  (Viettel) tổ chức Viettel’s Stars, sự kiện tôn vinh các tập thể, cá nhân xuất sắc nhất trong năm 2021 của Viettel trên toàn cầu. Đây là hoạt động thường niên, được hình thành từ 2008, đến nay đã diễn ra được 12 năm.', 
  '2022-03-29', 
  '<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Sarabun">T</span></span><span style="background-color:white"><span style="font-family:Sarabun">ừ gần 50.000 CBNV và hơn 7.000 đơn vị thành viên,</span></span> <span style="background-color:white"><span style="font-family:Sarabun">Viettel’s Stars 2021 lựa chọn 8 tập thể và 8 cá nhân xuất sắc nhất trong năm để trao giải. Tiêu chí xét giải của Viettel’s Stars là có giải pháp, cách làm mới, sáng tạo, khác biệt, tạo ra sản phẩm mới, giá trị mới có thông điệp lan tỏa, cần được nhân rộng ở Viettel trên phạm vi toàn cầu.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Sarabun">T</span></span><span style="background-color:white"><span style="font-family:Sarabun">ổng giải thưởng Viettel’s Stars 2021 có giá trị là hơn 2,5 tỷ đồng, trong đó mỗi cá nhân, tập thể được tặng thưởng 100 triệu đồng. Ngoài ra, các cá nhân còn được tặng một chuyến công tác, học tập ở nước ngoài trị giá 100 triệu đồng/người.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Sarabun">Năm 2021, Viettel đã </span></span><span style="background-color:white"><span style="font-family:Sarabun">giữ vững sản xuất kinh doanh, đảm bảo an toàn cho đội ngũ CBNV, đồng thời là doanh nghiệp đi đầu trong hỗ trợ Chính phủ, người dân và các doanh nghiệp khác vượt qua đại dịch.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Sarabun"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/03/29/viettel-star-anh-01.jpg" style="height:666px; width:1000px"><br>
<em>Ban Tổng giám đốc Tập đoàn Công nghiệp - Viễn thông Quân đội Viettel và 8 cá nhân xuất sắc toàn cầu của Viettel 2021</em></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Sarabun">Trong bối cảnh Covid-19 diễn ra 2 năm liên tục, Viettel’s Stars năm nay tôn vinh các tập thể, cá nhân có sáng kiến giúp đơn vị đạt được mục tiêu kép vừa phòng, chống dịch, vừa hỗ trợ hoạt động kinh doanh tăng trưởng. Viettel’s Stars 2021 cũng đồng thời ghi nhận những thành tựu trong nghiên cứu sản xuất thiết bị công nghệ cao, các giải pháp công nghệ số và an toàn an ninh mạng. </span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Sarabun"><img alt="" src="https://cdn.viettel.com.vn/media/viettel//uploads/2022/03/29/viettel-star-anh-02.jpg" style="height:666px; width:1000px"><br>
<em>Ban Tổng giám đốc Tập đoàn Công nghiệp - Viễn thông Quân đội Viettel và 8 tập thể xuất sắc toàn cầu của Viettel 2021</em></span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="background-color:white"><span style="font-family:Sarabun">Tại buổi lễ, Đại tá Tào Đức Thắng, Chủ tịch kiêm Tổng giám đốc Viettel&nbsp;kêu gọi “Người Viettel hãy thổi bùng ngọn lửa khát khao, mở rộng không gian khát vọng, tiếp tục chinh phục những đỉnh cao mới để người Viettel hạnh phúc hơn, Viettel hùng mạnh hơn và Việt Nam song hành với thế giới”.</span></span></span></span></p>

<blockquote>
<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-size:10.0pt"><span style="background-color:white"><span style="font-family:Sarabun">Viettel’s Stars</span></span></span><span style="font-size:10.0pt"><span style="font-family:Sarabun"> là một trong những nỗ lực của Viettel trong việc ghi nhận, tôn vinh các tài năng, góp phần tạo dựng một môi trường làm việc hấp dẫn, <span style="color:#111111">thu hút, gìn giữ nguồn nhân lực chất lượng cao phục vụ cho chiến lược chuyển đổi số của Tập đoàn.&nbsp;Trong giai đoạn 2020-2025 Viettel đặt mục tiêu trở thành một “Talent-hub” – điểm đến đối với nguồn nhân lực chất lượng cao, đứng số 01 trong các doanh nghiệp Việt Nam và nằm trong Top 10 doanh nghiệp châu Á về thu hút nhân sự trong nhóm ngành công nghệ cao. </span></span></span></span></span></p>

<p><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">BOX- DANH SÁCH CÁC TẬP THỂ, CÁ NHÂN&nbsp; ĐIỂN HÌNH XUẤT NĂM</span></span></strong></span></span><strong> </strong><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><strong><span style="font-size:10.0pt"><span style="font-family:Sarabun">VIETTEL TOÀN CẦU NĂM 2021</span></span></strong></span></span></span></span></p>

<p><br>
<span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><strong><u><span style="font-size:10.0pt"><span style="font-family:Sarabun">08 tập thể:</span></span></u></strong></span></span></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Viện Hàng không Vũ trụ Viettel hoàn thành xuất sắc các nhiệm vụ nghiên cứu, chế tạo, thử nghiệm của đề án A1, S125.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Trung tâm Ra đa</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Công nghiệp Công nghệ cao Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> nghiên cứu thành công 02 sản phẩm mới có tính chất đột phá về công nghệ và thứ hạng trong ngành ra đa.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Trung tâm Vận hành Khai thác Toàn cầu</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Mạng lưới Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> vận hành khai thác thông minh, đảm bảo an toàn, đáp ứng kịp thời các nhu cầu kinh doanh, chỉ đạo từ các cấp, bảo đảm tốt chất lượng mạng và các yêu cầu trong mọi điều kiện cho Việt Nam và các thị trường</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Viettel Bình Phước</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Viễn thông Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">) có </span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">thành tích tăng trưởng tốt trên tất cả các dịch vụ</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Công ty Movitel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Cổ phần Đầu tư quốc tế Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> h</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">oàn thành xuất sắc 8/8 chỉ tiêu chính</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">,</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> dòng tiền chuyển về nước </span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">đạt 520%, </span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">cao nhất kể từ năm 2016 đến nay.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chi nhánh Kỹ thuật Viettel Nghệ An</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Cổ phần Công trình Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> hoàn thành vượt kế hoạch SXKD trên tất cả các lĩnh vực</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Trung tâm Đô thị thông minh</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Giải pháp Doanh nghiệp Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> tăng trưởng cao trong </span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">năm 2021 </span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">mang lại nguồn doanh thu mới cho Tổng Công ty và Tập đoàn</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Chi nhánh Bưu chính Viettel Hồ Chí Minh</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Cổ phần Bưu chính Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> chủ động sáng tạo tìm ra các giải pháp để đạt được mục tiêu kép, vừa đảm bảo an toàn cho CBNV vừa đảm bảo hoạt động SXKD.</span></span></span></span></span></span></li>
</ul>

<p><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><strong><u><span style="font-size:10.0pt"><span style="font-family:Sarabun">08 cá nhân:</span></span></u></strong></span></span></span></span></p>

<ul>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Nguyễn Đức Huy, Phó Giám đốc, Trung tâm Nghiên cứu công nghệ chuyển mạch</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Công nghiệp công nghệ cao Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> phát triển vIMS giúp Viettel làm chủ dịch vụ VoLTE (thoại trên nền LTE) và ViLTE (thoại có hình trên nền tảng LTE) nâng cao chất lượng dịch vụ 4G của Viettel.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Nguyễn Viết Hưởng, Trưởng phòng Nghiên cứu hệ thống Quan sát không gian, TT Chỉ Huy và Điều khiển</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Viện Hàng không Vũ trụ Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> nghiên cứu</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">,</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> phát triển</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> thành công</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> dự án thiết bị quân sự công nghệ cao</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Lê Tuấn Anh, Phó Giám đốc Trung tâm Quản lý Bán hàng</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT</span></span></span></span> <span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Viễn thông Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> triển khai &nbsp;06 giải pháp ứng dụng công nghệ nhằm thông minh hóa công cụ bán hàng.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Phan Văn Khanh, Giám đốc, Chi nhánh ART - Công ty Viettel Haiti</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Cổ phần Đầu tư Quốc tế Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> đã nén nỗi đau, gác lại chuyện riêng để cùng đồng nghiệp duy trì tinh thần đoàn kết, máu lửa, xông pha trên tuyến đầu</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Ouk Chipphal, Trưởng Phòng KDQT, Công ty Viettel Cambodia</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Cổ phần Đầu tư Quốc tế Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> với nhiều sáng kiến giúp kinh doanh tăng trưởng 2 con số.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Đào Trọng Nghĩa, Chuyên viên chính nghiên cứu chuyên sâu An toàn thông tin, Phòng Nghiên cứu chuyên sâu ATTT</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Công ty</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> An ninh mạng Viettel) </span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">vượt qua hàng nghìn nhà nghiên cứu bảo mật trên thế giới phát hiện lỗ hổng trên những hệ thống mới nhất. </span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Đinh Thị Dung, Giám đốc Trung tâm Bán lẻ </span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">(</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Công ty TM&amp;XNK Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> đưa Trung tâm Bán lẻ từ thua lỗ, trở thành một đơn vị có sức tăng trưởng lớn nhất Tập đoàn</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">.</span></span></span></span></span></span></li>
	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">Lê Công Tráng, Nhân viên bán hàng, Chi nhánh Bưu chính Viettel Đồng Nai</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> (</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">TCT Cổ phần Bưu chính Viettel</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">)</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun"> hoàn thành tới 150% kế hoạch được giao; cao hơn 6 lần so với mức bình quân của nhân viên trong đơn vị</span></span></span></span><span style="font-family:&quot;Times New Roman&quot;,serif"><span style="color:black"><span style="font-size:10.0pt"><span style="font-family:Sarabun">.</span></span></span></span></span></span></li>
</ul>
</blockquote>');