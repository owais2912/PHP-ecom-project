-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 03, 2022 at 08:38 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomme`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Beds', 1),
(2, 'Chairs', 1),
(4, 'Sofas', 1),
(6, 'Tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(8, 'Owais', 'owais@gmail.com', '0987654321', 'This is a test comment', '2022-10-30 12:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `added_on`) VALUES
(15, 11, 'Shahid Chowk', 'Valsad/Gujarat', 396001, 'COD', 75888, 'pending', 1, '2022-10-31 07:22:52'),
(16, 16, 'Gundlav', 'Valsad/Gujarat', 396001, 'COD', 22948, 'pending', 4, '2022-10-31 07:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(39, 15, 29, 1, 32390),
(40, 15, 42, 1, 21999),
(41, 15, 43, 1, 21499),
(42, 16, 35, 1, 11449),
(43, 16, 32, 1, 11499);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(5, 'complete'),
(4, 'canceled'),
(3, 'shipped'),
(2, 'processing'),
(1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `status`) VALUES
(26, 1, 4, 'Upholstered bed frame, Djuparp dark green', 44990, 38999, 4, 'tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5.jpg', 'TUFJORD will make you long for bedtime.', 'The headboard’s embracing curves help you to unwind, and make lazy mornings spent in bed even cosier. The soft velvet with a beautiful lustre adds a luxurious feel.', 0, 1),
(27, 1, 4, 'Solid Dark Wood Bed', 30900, 24499, 3, 'hemnes-bed-frame-black-brown__0735709_pe740107_s5.jpg', 'Sustainable beauty from sustainably-sourced solid wood', 'A durable and renewable material that maintains its genuine character with each passing year. Combines with the other furniture in the HEMNES series.', 0, 1),
(28, 1, 4, 'Knisa light grey/white Bed', 38999, 29999, 4, 'slattum-kullen-bedroom-furniture-set-of-4-knisa-light-grey-white__1101373_pe866633_s5.jpg', 'Subtle but gorgeouslly designed bed frame', 'SLATTUM and KULLEN bed frame have a clean, simple design that looks great . Enjoy a coordinated look with this cosy upholstered bed frame that makes your bedroom awesome.', 1, 1),
(29, 1, 5, 'SONGESAND White Bed', 39900, 32390, 5, 'songesand-bedroom-furniture-set-of-4-white__1102126_pe866516_s5.jpg', 'Traditional design and attention to detail, SONGESAND offers a classic look and long-lasting quality.', 'Enjoy a coordinated look in your bedroom with this clean white bed that enhances your bedroom look. SONGESAND bed frame is sturdy with soft, profile edges and high legs – a classic shape that will last for many years.', 0, 1),
(30, 2, 1, 'Pario Guest Chair in Blue Colour', 9850, 7499, 2, 'pario-guest-chair-in-blue-colour-by-furniturstation-pario-guest-chair-in-blue-c.jpg', 'A Hybrid between a Chair and Sofa, Lounge Chair is not as heavy as a sofa or as lightweight as a chair either.', 'Its slightly reclined back lets you lean back in style. They are chairs to sink in and stay awhile. Pair it with an ottoman and they will have great snooze-ability value. Available in the high or low back style.', 0, 1),
(31, 2, 1, 'Nogales Velvet Lounge Chair In Blue Colour', 12990, 8999, 2, 'nogales-lounge-chair-in-blue-colour-by-amberville-nogales-lounge-chair-in-blue-colour-by-amberville.jpg', 'Amberville is synonymous to a stately and gracious living.', 'Amberville is synonymous to a stately and gracious living. Taking inspiration from the classic colonial style of furniture prevalent during the 1800s,the Amberville Colonial line reflects distinct curved lines, classically proportioned form, symmetrical moldings and trims having a very smooth and superior finish, which evoke a sense of nostalgia.', 0, 1),
(32, 2, 1, 'Morocco Lounge Chair In Berry Red Colour', 15990, 11499, 4, 'morocco-velvet-wing-chair-in-berry-red-colour-by-vittoria-morocco-velvet-wing-chair-in-berry-red-col-xpwcv9.jpg', 'Vittoria leading manufacturer of the widest range of chairs, sofas and seatings with providing the most inventive designs which are perfectly suited for modern day living.', 'Wing Chairs are sculptural, imposing classic chairs with high backs that curve inwards at the end like wings and having plush armrest which add to the comfort and general appeal. Frame Material - Red Meranti Solid Wood + Heavy Grade Ply Wood (Wherever Applicable) Upholstery material - Premium Velvet Fabric (100% Polyester, 300 GSM, Martindale Count-40,000+ Rubs) Legs Material - Solid Wood Foam Foam - Heavy Grade PU Foam, Foam Density - 32 Density, Medium Softness Suspension System - Elastic Webbing]', 1, 1),
(33, 2, 1, 'Peacock Velvet Barrel Chair in Pink Colour on Golden Base', 19990, 16450, 4, 'peacock-velvet-barrel-chair-in-pink-colour-on-golden-base-by-bohemiana-peacock-velvet-barrel-chair-i-ei1bce.jpg', 'Upholstery : Velvet Fabric\r\n\r\nFrame : Mango Wood & Metal', 'Woodsworth epitomizes the idea of bringing exceptional value with distinctive furniture for your home. Reflecting designs that are sleek, trendy and functional, Woodsworth delivers the right blend of style and value, aesthetics and functionality, as well as comfort and uncompromised quality.', 0, 1),
(34, 2, 2, 'Cube Outdoor Chair In White Wicker', 44990, 3249, 4, 'cube-outdoor-chair-in-white-wicker---grey-colour-by-advent-international-cube-outdoor-chair-in-white-lzgnof.jpg', 'Furniture Material - Mild Steel Powder Coated - Outdoor Rope Weaving - Toughened Glass', 'Advent International has emerged as a name well-known brand for providing complete outdoor solutions with high quality and international designs completely handcrafted in India. The Brand believes that outdoor lifestyle should be set in comfort and luxury just like indoor living. Hence their extensive range incorporates both classic and modern designs that compliment a variety of living spaces.', 0, 1),
(35, 2, 2, 'Hydrengea Outdoor Chair in Grey Colour', 14980, 11449, 3, 'hydrengea-outdoor-chair-in-grey-colour-by-ventura-hydrengea-outdoor-chair-in-grey-colour-by-ventura-os2owd.jpg', 'Primary Material : Textlyene Rope\r\n\r\nFrame : Mild Steel', 'Ventura Lifestyles Pvt. Ltd. is an acclaimed company in the furniture industry with a PAN India presence offering a complete range of Home & Office furniture along with solutions for laboratories, Hospitals & Healthcare establishment, Education & Training Institutes, Auditorium & Stadiums.\r\n\r\n\r\nPatio Chairs are light, portable and mostly weather-proof chairs to sit back relax and soak in the outdoors. Place them in your verandas, balconies or lawns and go ahead and dine alfresco or leisurely sip on your sundowners.', 1, 1),
(36, 2, 2, 'Crystal Plastic Chairs in Weather Brown Colour', 4999, 4349, 2, 'crystal-plastic-chairs--set-of-2--in-weather-brown-colour-by-nilkamal-crystal-plastic-chairs--set-of-aapzko.jpg', 'Material : Polypropylene, Strong,Durable,& Translucent body \"C\" Shaped legs for maximum strength.', 'Nilkamal, the most established brands known amongst masses, offering affordable and durable lifestyle furniture for your home and personal space. Available in variety of colours and designs; these not only bring appeal to your living space but also provide you with best in style and durability.\r\n\r\n\r\nPlastic Chairs are high on utilitarian value, are multi-functional, easy to clean and can stand the rigors of frequent use. They come in a variety of colours and are often stackable to save space.', 0, 1),
(39, 4, 3, 'VIMLE 4-seat sofa with chaise longue, Gunnared medium grey', 85999, 81449, 2, 'vimle-4-seat-sofa-with-chaise-longue-gunnared-medium-grey__0778324_pe758893_s5.jpg', 'The VIMLE sofa series has sections that can be combined as you like into a customised solution for you and your home – and as your life changes, you can complete the sofa and let it change with you.', 'This soft sofa will have a long life since the seat cushions are filled with high resilience foam that gives good support for your body and quickly regains its original shape when you get up.\r\n\r\nThe sofa\'s sections can be combined in different ways to get a size and shape that suits you and your home.', 0, 1),
(41, 4, 3, 'LANDSKRONA 4-seat sofa, with chaise longue', 87000, 83499, 3, 'landskrona-4-seat-sofa-with-chaise-longue-gunnared-light-green-metal__0825453_pe680346_s5.jpg', 'Warm and welcoming, neat and stylish. The supporting seat cushions, the cover’s soft finish and the tight fit gives this sofa a perfect balance between its comfort, functions and look.', 'The fabric cover has a warm and welcoming look, while the tight fit gives the sofa a neat and stylish expression.\r\n\r\nSeat cushions filled with high-resilience foam and polyester fibre wadding provide great seating comfort.', 1, 1),
(42, 4, 6, 'GAMMALBYN 3-seat sofa, brown', 25000, 21999, 4, 'gammalbyn-3-seat-sofa-brown__1030893_pe836425_s5.jpg', 'Have a seat and watch a movie with family or enjoy a good book. You sit really comfortably on this artificial leather sofa with polyester-filled removable cushions. Also available as a 2-seat sofa.\r\n\r\nDelivery and assembly prices not included.', 'Durable metal springs in the seat give the sofa a springy comfort, allowing you to sit, relax and enjoy it for many years.\r\n\r\nThe fixed Bomstad cover is made of a durable material that both feels and looks like leather. The material consists of polyester and cotton and has a protective coating of polyurethane.', 0, 1),
(43, 6, 7, 'LERHAMN Table and 4 chairs', 24990, 21499, 5, 'lerhamn-table-and-4-chairs-black-brown-vittaryd-beige__0761150_pe751122_s5.jpg', 'The clear-lacquered surface is easy to wipe clean.', 'The chair frame is made of solid wood, which is a durable natural material.\r\n\r\nThe cover can be machine washed.', 1, 1),
(44, 6, 7, 'INGATORP / INGATORP Table and 4 chairs', 54480, 49980, 3, 'ingatorp-ingatorp-table-and-4-chairs-black__0871187_pe660324_s5.jpg', 'The extra leaf can be stored within easy reach under the table top.', 'It’s quick and easy to change the size of the table to suit your different needs. With the extra leaf stored under the table top you can extend the table to seat from 4 to 6 people.\r\n\r\nCan be easily extended by one person.\r\n\r\nConcealed locking function prevents gaps between top and leaf and keeps the extra leaf in place.', 0, 1),
(45, 6, 7, 'NACKANÄS / NACKANÄS Table and 4 chairs', 25890, 22499, 4, 'nackanaes-nackanaes-table-and-4-chairs-acacia-acacia__1127603_pe876274_s5.jpg', 'Easy to combine with chairs and benches in the same series or why not mix with other chairs from our website.', 'A round table is a social table and this one invites to relaxed conversation. The warm wood and soft, rounded edges create a cosy and relaxed atmosphere. Easy to place anywhere in the home.', 0, 1),
(46, 6, 8, 'ASKHOLMEN  Outdoor Table', 6199, 5849, 2, 'naskholmen-table-outdoor-foldable-light-brown-stained__0907491_pe713976_s5.jpg', 'Practical outdoor table for a garden, terrace or balcony – with space for 4. Easy to fold up in order to save space and is made of durable stained hardwood to last longer before any maintenance is needed.', 'Takes little room to store as the table folds flat.\r\nFor added durability and so you can enjoy the natural expression of the wood, the furniture has been pre-treated with a layer of semi-transparent wood stain.', 0, 1),
(47, 6, 8, 'ÄPPLARÖ Gateleg outdoor table', 8999, 8499, 5, 'aepplaroe-gateleg-table-outdoor-brown-stained__0801499_pe768150_s5.jpg', '2 folding drop-leaves allow you to adjust the table size according to your needs.', 'For added durability and so you can enjoy the natural expression of the wood, the furniture has been pre-treated with several layers of semi-transparent wood stain.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 2, 'In-door Chairs', 1),
(2, 2, 'Out-door Chairs', 1),
(3, 4, 'L Sofas', 1),
(4, 1, 'Bed Frames', 1),
(5, 1, 'New arrivals', 1),
(6, 4, 'leather sofa', 1),
(7, 6, 'Dining Tables', 1),
(8, 6, 'Outdoor tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(11, 'Owais', 'Owais@321', 'owais@gmail.com', '0987654321', '2022-10-30 10:13:05'),
(12, 'Sagar', 'Sagar@321', 'sagar@gmail.com', '0987612345', '2022-10-30 11:58:40'),
(16, 'Shiv', 'Shiv@321', 'shiv@gmail.com', '8799887784', '2022-10-31 09:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(18, 4, 14, '2022-10-28 08:12:34'),
(20, 4, 1, '2022-10-29 10:23:33'),
(22, 4, 40, '2022-10-30 09:43:52'),
(23, 4, 29, '2022-10-30 09:45:03'),
(27, 11, 40, '2022-10-30 11:52:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
