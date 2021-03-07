-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 07, 2021 at 06:00 PM
-- Server version: 5.7.29-log
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uzfor`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_ads`
--

CREATE TABLE `cms_ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT '0',
  `view` tinyint(3) UNSIGNED DEFAULT '0',
  `layout` tinyint(3) UNSIGNED DEFAULT '0',
  `count` int(10) UNSIGNED DEFAULT '0',
  `count_link` int(10) UNSIGNED DEFAULT '0',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` int(10) UNSIGNED DEFAULT '0',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `time` int(10) UNSIGNED DEFAULT '0',
  `day` int(10) UNSIGNED DEFAULT '0',
  `mesto` tinyint(3) UNSIGNED DEFAULT '0',
  `bold` tinyint(3) UNSIGNED DEFAULT '0',
  `italic` tinyint(3) UNSIGNED DEFAULT '0',
  `underline` tinyint(3) UNSIGNED DEFAULT '0',
  `show` tinyint(3) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_album_cat`
--

CREATE TABLE `cms_album_cat` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_album_comments`
--

CREATE TABLE `cms_album_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_album_downloads`
--

CREATE TABLE `cms_album_downloads` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `file_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_album_files`
--

CREATE TABLE `cms_album_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `album_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tmb_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comments` tinyint(1) NOT NULL DEFAULT '1',
  `comm_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `vote_plus` int(11) NOT NULL DEFAULT '0',
  `vote_minus` int(11) NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `downloads` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `unread_comments` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_album_views`
--

CREATE TABLE `cms_album_views` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `file_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_album_votes`
--

CREATE TABLE `cms_album_votes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `file_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `vote` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_ban_ip`
--

CREATE TABLE `cms_ban_ip` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip1` bigint(20) NOT NULL DEFAULT '0',
  `ip2` bigint(20) NOT NULL DEFAULT '0',
  `ban_type` tinyint(4) NOT NULL DEFAULT '0',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `who` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_ban_users`
--

CREATE TABLE `cms_ban_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `ban_time` int(11) NOT NULL DEFAULT '0',
  `ban_while` int(11) NOT NULL DEFAULT '0',
  `ban_type` tinyint(4) NOT NULL DEFAULT '1',
  `ban_who` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ban_ref` int(11) NOT NULL DEFAULT '0',
  `ban_reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ban_raz` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_contact`
--

CREATE TABLE `cms_contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `from_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `friends` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ban` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `man` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_counters`
--

CREATE TABLE `cms_counters` (
  `id` int(10) UNSIGNED NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` tinyint(4) NOT NULL DEFAULT '1',
  `switch` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_forum_files`
--

CREATE TABLE `cms_forum_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subcat` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `post` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `filename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `filetype` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dlcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_forum_rdm`
--

CREATE TABLE `cms_forum_rdm` (
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_forum_vote`
--

CREATE TABLE `cms_forum_vote` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_forum_vote_users`
--

CREATE TABLE `cms_forum_vote_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL DEFAULT '0',
  `topic` int(11) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_library_comments`
--

CREATE TABLE `cms_library_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_library_rating`
--

CREATE TABLE `cms_library_rating` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `st_id` int(10) UNSIGNED NOT NULL,
  `point` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_mail`
--

CREATE TABLE `cms_mail` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `from_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `sys` tinyint(1) NOT NULL DEFAULT '0',
  `delete` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `them` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `spam` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_sessions`
--

CREATE TABLE `cms_sessions` (
  `session_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` bigint(20) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(20) NOT NULL DEFAULT '0',
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sestime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `movings` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `place` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_sessions`
--

INSERT INTO `cms_sessions` (`session_id`, `ip`, `ip_via_proxy`, `browser`, `lastdate`, `sestime`, `views`, `movings`, `place`) VALUES
('8eb98278bed4511b876e2e7abbf7c998', 2130706433, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615128144, 1615128043, 8, 3, '/login');

-- --------------------------------------------------------

--
-- Table structure for table `cms_users_data`
--

CREATE TABLE `cms_users_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `val` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_users_guestbook`
--

CREATE TABLE `cms_users_guestbook` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_id` int(10) UNSIGNED NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_users_iphistory`
--

CREATE TABLE `cms_users_iphistory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip` bigint(20) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(20) NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users_iphistory`
--

INSERT INTO `cms_users_iphistory` (`id`, `user_id`, `ip`, `ip_via_proxy`, `time`) VALUES
(1, 1, 0, 0, 1614869388);

-- --------------------------------------------------------

--
-- Table structure for table `download__bookmark`
--

CREATE TABLE `download__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download__category`
--

CREATE TABLE `download__category` (
  `id` int(10) UNSIGNED NOT NULL,
  `refid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dir` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rus_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download__comments`
--

CREATE TABLE `download__comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_id` int(10) UNSIGNED NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download__files`
--

CREATE TABLE `download__files` (
  `id` int(10) UNSIGNED NOT NULL,
  `refid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dir` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rus_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0|0',
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comm_count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download__more`
--

CREATE TABLE `download__more` (
  `id` int(10) UNSIGNED NOT NULL,
  `refid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rus_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_messages`
--

CREATE TABLE `email_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `priority` int(11) DEFAULT NULL COMMENT 'Priority of sending the message',
  `locale` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language used for displaying the message',
  `template` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Template name',
  `fields` text COLLATE utf8mb4_unicode_ci COMMENT 'Event fields',
  `sent_at` timestamp NULL DEFAULT NULL COMMENT 'The time when the message was sent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_messages`
--

INSERT INTO `email_messages` (`id`, `priority`, `locale`, `template`, `fields`, `sent_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'uz', 'system::mail/templates/registration', '{\"email_to\":\"Akbarali@webschool.uz\",\"name_to\":\"Akbarali\",\"subject\":\"Registration on the website\",\"user_name\":\"Akbarali\",\"user_login\":\"Akbarali\",\"link_to_confirm\":\"http:\\/\\/uzfor.loc\\/registration\\/?act=confirm_email&id=2&code=email_6044e6159c1662.24720772\"}', '2021-03-07 14:41:33', '2021-03-07 14:41:25', '2021-03-07 14:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `forum_cat`
--

CREATE TABLE `forum_cat` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_userid` int(11) NOT NULL,
  `time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ichki_cat` int(11) DEFAULT '0',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `tushuncha` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pustoy'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_cat`
--

INSERT INTO `forum_cat` (`id`, `name`, `created_userid`, `time`, `ichki_cat`, `cat_id`, `tushuncha`, `code`) VALUES
(1, 'HIKMATNOMA', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(2, 'ILM-FAN', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(3, 'JAMIYAT VA INSON', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(4, 'DARSLAR VA MAQOLALAR', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(5, 'INTERNET VA DASTURLASH', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(6, 'INTERNET TIJORAT', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(7, 'KOMPYUTER VA TEXNIKA', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(8, 'TELEFON VA OPERATORLAR', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(9, 'UMUMIY BO&#39;LIM', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(10, 'MULOQOT FORUMI', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(11, 'SAN&#39;AT OLAMI', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(12, 'SAYT HAQIDA', 1, '2021-03-04 16', 0, 0, '', 'pustoy'),
(13, 'Aforizmlar', 1, '2021-03-04 16', 0, 1, 'Ko&#39;plab ma&#39;noli aforizmlar', 'aforizmlar'),
(14, 'Nutqlar', 1, '2021-03-04 16', 0, 1, 'Dunyoni o‘zgartirgan nutqlar', 'nutqlar'),
(15, 'Maqollar', 1, '2021-03-04 16', 0, 1, 'Jahon xalqlari va O&#39;zbek xalq maqollari', 'maqollar'),
(16, 'Ibrat olami', 1, '2021-03-04 16', 0, 1, 'Ibratli hikoyatlar', 'ibrat-olami'),
(17, 'Talaba va o&#39;quvchilar', 1, '2021-03-04 16', 1, 2, 'Talabalar uchun kerakli maslahat va ma&#39;lumotlar', 'talaba-va-o39quvchilar'),
(18, 'Chet tillari', 1, '2021-03-04 16', 1, 2, 'Chet tillarini o&#39;rganamiz!', 'chet-tillari'),
(19, 'Ilm-fan taraqqiyoti', 1, '2021-03-04 16', 1, 2, 'Yuqorida ko&#39;rsatilmagan boshqa fanlar bo&#39;yicha gaplashamiz', 'ilm-fan-taraqqiyoti'),
(21, 'Aniq va tabiiy fanlar', 1, '2021-03-04 16', 1, 2, 'Aniq fanlar bo&#39;yicha bilimlarimizni charxlaymiz', 'aniq-va-tabiiy-fanlar'),
(22, 'Kutubxona', 1, '2021-03-04 16', 1, 2, 'Elektron kitoblar to&#39;plami', 'kutubxona'),
(23, 'Ma&#39;rifat', 1, '2021-03-04 16', 1, 2, 'Ma&#39;rifat - qalbning Alloh yagonaligini tadqiq etmog’idir!', 'ma39rifat'),
(24, 'Ayollar bo&#39;limi', 1, '2021-03-04 16', 1, 3, 'Muhtarama ayollarimizni qiziqtiradigan mavzular', 'ayollar-bo39limi'),
(25, 'Salomatlik', 1, '2021-03-04 16', 1, 3, 'Salomatlik sirlari, inson hayoti uchun zaruriy maslahatlar', 'salomatlik'),
(26, 'Pazandalik sirlari', 1, '2021-03-04 16', 1, 3, 'Mazali va chiroyli taom tayyorlash sirlari va ritseplari', 'pazandalik-sirlari'),
(27, 'Onlayn mutaxassis', 1, '2021-03-04 16', 1, 3, 'Savollaringizga mutaxassislar javob berishadi', 'onlayn-mutaxassis'),
(28, 'AKT bo&#39;yicha darslar va maqolalar', 1, '2021-03-04 16', 1, 4, 'Dasturchilar uchun tayyor kodlar', 'akt-bo39yicha-darslar-va-maqolalar'),
(29, 'Foydali bloglar', 1, '2021-03-04 16', 1, 4, 'Har-xil turdagi foydali bloglar', 'foydali-bloglar'),
(30, 'Hosting va domenlar', 1, '2021-03-04 16', 1, 5, 'Hosting, konstruktor tanlash va ular haqida fikrlar', 'hosting-va-domenlar'),
(31, 'SEO ommalashtirish va qidiruv tizimlari', 1, '2021-03-04 16', 1, 5, 'Qidiruv tizimlarida yuqori o&#39;rinlarga chiqishda maslahatlar', 'seo-ommalashtirish-va-qidiruv-tizimlari'),
(32, 'Foydalanuvchi sayti', 1, '2021-03-04 16', 1, 5, 'Forum foydalanuvchilari saytlari', 'foydalanuvchi-sayti'),
(33, 'Internet resurslar', 1, '2021-03-04 16', 1, 5, 'Har-xil internet resurslari (saytlar) haqida', 'internet-resurslar'),
(34, 'Sayt yaratishda yordam', 1, '2021-03-04 16', 1, 5, 'Sayt yaratishda ishlarida yordam beramiz', 'sayt-yaratishda-yordam'),
(35, 'Skriptlar muhokamasi', 1, '2021-03-04 16', 1, 5, 'PHP dasturlash tilida yaratilgan scriptlar muhokamasi', 'skriptlar-muhokamasi'),
(36, 'Dasturlash tillari', 1, '2021-03-04 16', 1, 5, 'PHP, JavaScript, HTML va boshqa dasturlash tillari haqida', 'dasturlash-tillari'),
(37, 'Internetda pul ishlash', 1, '2021-03-04 16', 1, 6, 'Internetda pul ishlash bo&#39;yicha fikrlashamiz', 'internetda-pul-ishlash'),
(38, 'Pullik xizmat va takliflar (frilans)', 1, '2021-03-04 16', 1, 6, 'Frilans, xizmat ko&#39;rsatish takliflari', 'pullik-xizmat-va-takliflar-frilans'),
(39, 'Savdo-sotiq', 1, '2021-03-04 16', 1, 6, 'Oldi-sotdi yoki almashtirish haqidagi e&#39;lonlar', 'savdo-sotiq'),
(40, 'Kompyuter (Hardware)', 1, '2021-03-04 16', 1, 7, 'Kompyuterlar va ularni o&#39;rnatish, tuzatish haqida ma&#39;lumot', 'kompyuter-hardware'),
(41, 'Kompyuter (Software)', 1, '2021-03-04 16', 1, 7, 'Kompyuter dasturlari va ularni o&#39;rnatish, izlab topish', 'kompyuter-software'),
(42, 'Yangi texnologiyalar', 1, '2021-03-04 16', 1, 7, 'Texnikalar va ularni o&#39;rnatish, tuzatish haqida ma&#39;lumot', 'yangi-texnologiyalar'),
(43, 'Ustaxona', 1, '2021-03-04 16', 1, 8, 'Mobil telefonlar bo&#39;yicha savollar', 'ustaxona'),
(44, 'Telefon turlari', 1, '2021-03-04 16', 1, 8, 'Telefon turlari uchun bo&#39;lim', 'telefon-turlari'),
(45, 'Mobil operatorlar', 1, '2021-03-04 16', 1, 8, 'Milliy operatorlarimiz haqida munozaralar', 'mobil-operatorlar'),
(46, 'Internet provayderlar', 1, '2021-03-04 16', 1, 8, 'Internet provayderlari haqida', 'internet-provayderlar'),
(47, 'Sport olami', 1, '2021-03-04 16', 1, 9, 'Sportning barcha sohalari bo&#39;yicha fikr almashamiz', 'sport-olami'),
(48, 'Dunyo yangiliklari', 1, '2021-03-04 16', 1, 9, 'Butun dunyo yangiliklari bilan shu yerda tanishamiz', 'dunyo-yangiliklari'),
(49, 'She&#39;riyat dunyosi', 1, '2021-03-04 16', 1, 9, 'She&#39;riyat ihlosmandlari uchun', 'she39riyat-dunyosi'),
(50, 'Avto olam', 1, '2021-03-04 16', 1, 9, 'Avtomobillar haqida barcha muhokamalar', 'avto-olam'),
(51, 'Erkin mavzular', 1, '2021-03-04 16', 1, 10, 'Erkin fikr bildirish uchun mahsus bo&#39;lim', 'erkin-mavzular'),
(52, 'Hajviya olami', 1, '2021-03-04 16', 1, 10, 'Hazil, kulgili voqealar, birgalikda kulishamiz!', 'hajviya-olami'),
(53, 'Tanishuvlar', 1, '2021-03-04 16', 1, 10, 'Forumdoshlar bilan yaqindan tanishuv', 'tanishuvlar'),
(54, 'O&#39;yinlar, testlar va so&#39;rovlar', 1, '2021-03-04 16', 1, 10, 'Qiziqarli o&#39;yin, test, so&#39;rovlar bo&#39;limi', 'o39yinlar-testlar-va-so39rovlar'),
(55, 'Tabriklar va tilaklar', 1, '2021-03-04 16', 1, 10, 'Bayram tabriklari, tug&#39;ilgan kunlarni nishonlaymiz', 'tabriklar-va-tilaklar'),
(56, 'Forumdoshlar intervyusi', 1, '2021-03-04 16', 1, 10, 'Forumimiz a&#39;zolari bilan eksklyuziv muloqot', 'forumdoshlar-intervyusi'),
(57, 'O&#39;zbek kinosi', 1, '2021-03-04 16', 1, 11, 'O&#39;zbek kino olamidagi yangiliklari haqida o&#39;rtoqlashamiz', 'o39zbek-kinosi'),
(58, 'Jahon kinosi', 1, '2021-03-04 16', 1, 11, 'Jahon kino olami yangiliklari haqida', 'jahon-kinosi'),
(59, 'O&#39;zbek musiqa san&#39;ati', 1, '2021-03-04 16', 1, 11, 'O&#39;zbek musiqa san&#39;ati, shou-biznes yangiliklari', 'o39zbek-musiqa-san39ati'),
(60, 'Jahon musiqa san&#39;ati', 1, '2021-03-04 16', 1, 11, 'Jahon musiqa san&#39;ati, shou-biznes yangiliklari', 'jahon-musiqa-san39ati'),
(61, 'Forum haqida', 1, '2021-03-04 16', 1, 12, 'UZFOR forumi haqida muhokama', 'forum-haqida'),
(62, 'Forum yangiliklari', 1, '2021-03-04 16', 1, 12, 'Forumimiz yangiliklari va bildirilgan fikrlar', 'forum-yangiliklari'),
(63, 'Forum arxivi', 1, '2021-03-04 16', 1, 12, 'Anchadan buyon muhokama qilinmagan eski mavzular', 'forum-arxivi');

-- --------------------------------------------------------

--
-- Table structure for table `forum_messages`
--

CREATE TABLE `forum_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` int(11) NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edit_time` int(11) DEFAULT NULL,
  `edit_count` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_messages`
--

INSERT INTO `forum_messages` (`id`, `topic_id`, `text`, `date`, `user_id`, `user_name`, `user_agent`, `editor_name`, `edit_time`, `edit_count`, `deleted`, `deleted_by`) VALUES
(1, 2, 'salom', 1615126388, 1, 'admin', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Tewst uchun post   ﻿', 1615126430, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL),
(3, 2, 'Test uchun', 1615128154, 2, 'Akbarali', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL),
(4, 2, 'Test uchun yana   ﻿', 1615128224, 2, 'Akbarali', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL),
(5, 2, '[b]Bbcoke tekshirildi   ﻿[/b]', 1615128375, 2, 'Akbarali', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL),
(6, 2, '[b]BBcode [/b][i]ishlamoqda [/i][u]xozircha [/u][s]underline [/s]', 1615128618, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL),
(7, 2, 'assalom   ﻿   ﻿', 1615128682, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL),
(8, 2, 'test', 1615128686, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL),
(9, 2, 'sahifalash uchun kerak', 1615128694, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL),
(10, 2, '1111', 1615128698, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL),
(11, 2, 'test uchun', 1615129055, 1, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forum_sections`
--

CREATE TABLE `forum_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '100',
  `access` int(11) DEFAULT NULL,
  `section_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_theme`
--

CREATE TABLE `forum_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` date NOT NULL,
  `cat_id` int(11) NOT NULL,
  `theme_text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_theme`
--

INSERT INTO `forum_theme` (`id`, `name`, `user_id`, `time`, `cat_id`, `theme_text`) VALUES
(1, 'Mavzu nomi', 1, '2021-03-05', 13, 'Test uchun ochilgan mavzu'),
(2, 'Forum ish faoliyatini boshladi', 1, '2021-03-07', 61, 'Forum ish faoliyatini boshladi biz bilan bo`ling');

-- --------------------------------------------------------

--
-- Table structure for table `forum_topic`
--

CREATE TABLE `forum_topic` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `post_count` int(11) DEFAULT NULL,
  `mod_post_count` int(11) DEFAULT NULL,
  `last_post_date` int(11) DEFAULT NULL,
  `last_post_author` int(10) UNSIGNED DEFAULT NULL,
  `last_post_author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_message_id` bigint(20) DEFAULT NULL,
  `mod_last_post_date` int(11) DEFAULT NULL,
  `mod_last_post_author` int(10) UNSIGNED DEFAULT NULL,
  `mod_last_post_author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mod_last_message_id` bigint(20) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  `closed_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `curators` mediumtext COLLATE utf8mb4_unicode_ci,
  `pinned` tinyint(1) DEFAULT NULL,
  `has_poll` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` int(10) UNSIGNED NOT NULL,
  `adm` tinyint(1) NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` bigint(20) NOT NULL DEFAULT '0',
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `otvet` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `otime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `edit_who` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `edit_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `edit_count` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`id`, `adm`, `time`, `user_id`, `name`, `text`, `ip`, `browser`, `admin`, `otvet`, `otime`, `edit_who`, `edit_time`, `edit_count`) VALUES
(1, 0, 1614958052, 1, 'admin', 'asasas', 2130706433, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '', '', 0, '', 0, 0),
(2, 0, 1615123911, 0, 'Akbarali', 'Salom   ﻿', 2130706433, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '', '', 0, '', 0, 0),
(3, 0, 1615124383, 1, 'admin', '[b]salom[/b]', 2130706433, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '', '', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `karma_users`
--

CREATE TABLE `karma_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `karma_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `points` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_cats`
--

CREATE TABLE `library_cats` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` tinyint(1) NOT NULL DEFAULT '0',
  `pos` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_add` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_tags`
--

CREATE TABLE `library_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `lib_text_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_texts`
--

CREATE TABLE `library_texts` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `announce` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploader` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uploader_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `count_views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `premod` tinyint(1) NOT NULL DEFAULT '0',
  `comments` tinyint(1) NOT NULL DEFAULT '0',
  `comm_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_articles`
--

CREATE TABLE `news_articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `active_from` datetime DEFAULT NULL,
  `active_to` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `preview_text` text COLLATE utf8mb4_unicode_ci,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` int(11) DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_comments`
--

CREATE TABLE `news_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_search_index`
--

CREATE TABLE `news_search_index` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_sections`
--

CREATE TABLE `news_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_votes`
--

CREATE TABLE `news_votes` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Module name',
  `event_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Event type',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User identifier',
  `sender_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Sender identifier',
  `entity_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Entity identifier',
  `fields` text COLLATE utf8mb4_unicode_ci COMMENT 'Event fields',
  `read_at` timestamp NULL DEFAULT NULL COMMENT 'Read date',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_lat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rights` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `failed_login` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `imname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sex` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `komm` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `postforum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `postguest` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `yearofbirth` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `datereg` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icq` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `jabber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `www` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `about` text COLLATE utf8mb4_unicode_ci,
  `live` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mibile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` bigint(20) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(20) NOT NULL DEFAULT '0',
  `browser` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preg` tinyint(1) NOT NULL DEFAULT '0',
  `regadm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mailvis` tinyint(1) NOT NULL DEFAULT '0',
  `dayb` int(11) NOT NULL DEFAULT '0',
  `monthb` int(11) NOT NULL DEFAULT '0',
  `sestime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_on_site` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rest_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rest_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `movings` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `place` text COLLATE utf8mb4_unicode_ci,
  `set_user` text COLLATE utf8mb4_unicode_ci,
  `set_forum` text COLLATE utf8mb4_unicode_ci,
  `set_mail` text COLLATE utf8mb4_unicode_ci,
  `karma_plus` int(11) NOT NULL DEFAULT '0',
  `karma_minus` int(11) NOT NULL DEFAULT '0',
  `karma_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `karma_off` tinyint(1) NOT NULL DEFAULT '0',
  `comm_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comm_old` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `smileys` text COLLATE utf8mb4_unicode_ci,
  `notification_settings` text COLLATE utf8mb4_unicode_ci,
  `email_confirmed` tinyint(1) DEFAULT NULL,
  `confirmation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_notes` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `name_lat`, `password`, `rights`, `failed_login`, `imname`, `sex`, `komm`, `postforum`, `postguest`, `yearofbirth`, `datereg`, `lastdate`, `mail`, `icq`, `skype`, `jabber`, `www`, `about`, `live`, `mibile`, `status`, `ip`, `ip_via_proxy`, `browser`, `preg`, `regadm`, `mailvis`, `dayb`, `monthb`, `sestime`, `total_on_site`, `lastpost`, `rest_code`, `rest_time`, `movings`, `place`, `set_user`, `set_forum`, `set_mail`, `karma_plus`, `karma_minus`, `karma_time`, `karma_off`, `comm_count`, `comm_old`, `smileys`, `notification_settings`, `email_confirmed`, `confirmation_code`, `new_email`, `admin_notes`) VALUES
(1, 'admin', 'admin', '8fe7b187c85c1db5966787ee2062e8a4', 9, 0, '', 'm', 0, 0, 2, 0, 1614869388, 1615129214, 'uzfor@uzhackersw.uz', 0, '', '', 'http://uzfor.loc', '', '', '', '', 2130706433, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '', 0, 0, 0, 1615128585, 0, 1615124383, '', 0, 13, '/forum/forum-haqida/2', 'a:0:{}', 'a:0:{}', 'a:0:{}', 0, 0, 1615123866, 0, 0, 0, 'a:0:{}', NULL, 1, NULL, NULL, NULL),
(2, 'Akbarali', 'akbarali', '2f3cf17c3dd7dce239ed7e6d0a5b54bc', 0, 0, 'Akbarali', 'm', 0, 0, 0, 0, 1615128085, 1615128411, 'Akbarali@webschool.uz', 0, '', '', '', '', '', '', '', 2130706433, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '', 0, 0, 0, 1615128144, 0, 0, '', 0, 9, '/forum/forum-haqida/2', 'a:0:{}', 'a:0:{}', 'a:0:{}', 0, 0, 1615128144, 0, 0, 0, 'a:0:{}', NULL, 1, 'email_6044e6159c1662.24720772', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_ads`
--
ALTER TABLE `cms_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_album_cat`
--
ALTER TABLE `cms_album_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `access` (`access`);

--
-- Indexes for table `cms_album_comments`
--
ALTER TABLE `cms_album_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_id` (`sub_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cms_album_downloads`
--
ALTER TABLE `cms_album_downloads`
  ADD PRIMARY KEY (`user_id`,`file_id`);

--
-- Indexes for table `cms_album_files`
--
ALTER TABLE `cms_album_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `access` (`access`);

--
-- Indexes for table `cms_album_views`
--
ALTER TABLE `cms_album_views`
  ADD PRIMARY KEY (`user_id`,`file_id`);

--
-- Indexes for table `cms_album_votes`
--
ALTER TABLE `cms_album_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `cms_ban_ip`
--
ALTER TABLE `cms_ban_ip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip1` (`ip1`),
  ADD UNIQUE KEY `ip2` (`ip2`);

--
-- Indexes for table `cms_ban_users`
--
ALTER TABLE `cms_ban_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ban_time` (`ban_time`);

--
-- Indexes for table `cms_contact`
--
ALTER TABLE `cms_contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`user_id`,`from_id`),
  ADD KEY `time` (`time`),
  ADD KEY `ban` (`ban`);

--
-- Indexes for table `cms_counters`
--
ALTER TABLE `cms_counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_forum_files`
--
ALTER TABLE `cms_forum_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat` (`cat`),
  ADD KEY `subcat` (`subcat`),
  ADD KEY `topic` (`topic`),
  ADD KEY `post` (`post`);

--
-- Indexes for table `cms_forum_rdm`
--
ALTER TABLE `cms_forum_rdm`
  ADD PRIMARY KEY (`topic_id`,`user_id`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `cms_forum_vote`
--
ALTER TABLE `cms_forum_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_topic` (`type`,`topic`),
  ADD KEY `type` (`type`),
  ADD KEY `topic` (`topic`);

--
-- Indexes for table `cms_forum_vote_users`
--
ALTER TABLE `cms_forum_vote_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_user` (`topic`,`user`),
  ADD KEY `topic` (`topic`);

--
-- Indexes for table `cms_library_comments`
--
ALTER TABLE `cms_library_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_id` (`sub_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cms_library_rating`
--
ALTER TABLE `cms_library_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_article` (`user_id`,`st_id`);

--
-- Indexes for table `cms_mail`
--
ALTER TABLE `cms_mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `time` (`time`),
  ADD KEY `read` (`read`),
  ADD KEY `sys` (`sys`),
  ADD KEY `delete` (`delete`);

--
-- Indexes for table `cms_sessions`
--
ALTER TABLE `cms_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `lastdate` (`lastdate`);

--
-- Indexes for table `cms_users_data`
--
ALTER TABLE `cms_users_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `key` (`key`);

--
-- Indexes for table `cms_users_guestbook`
--
ALTER TABLE `cms_users_guestbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_id` (`sub_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cms_users_iphistory`
--
ALTER TABLE `cms_users_iphistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_ip` (`ip`);

--
-- Indexes for table `download__bookmark`
--
ALTER TABLE `download__bookmark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `download__category`
--
ALTER TABLE `download__category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refid` (`refid`),
  ADD KEY `total` (`total`);

--
-- Indexes for table `download__comments`
--
ALTER TABLE `download__comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_id` (`sub_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `download__files`
--
ALTER TABLE `download__files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refid` (`refid`),
  ADD KEY `time` (`time`),
  ADD KEY `type` (`type`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comm_count` (`comm_count`);

--
-- Indexes for table `download__more`
--
ALTER TABLE `download__more`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refid` (`refid`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `email_messages`
--
ALTER TABLE `email_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_cat`
--
ALTER TABLE `forum_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_messages`
--
ALTER TABLE `forum_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `deleted` (`deleted`);
ALTER TABLE `forum_messages` ADD FULLTEXT KEY `text` (`text`);

--
-- Indexes for table `forum_sections`
--
ALTER TABLE `forum_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `forum_theme`
--
ALTER TABLE `forum_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adm` (`adm`),
  ADD KEY `time` (`time`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `karma_users`
--
ALTER TABLE `karma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `karma_user` (`karma_user`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `library_cats`
--
ALTER TABLE `library_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library_tags`
--
ALTER TABLE `library_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lib_text_id` (`lib_text_id`),
  ADD KEY `tag_name` (`tag_name`);

--
-- Indexes for table `library_texts`
--
ALTER TABLE `library_texts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);
ALTER TABLE `library_texts` ADD FULLTEXT KEY `text` (`text`);

--
-- Indexes for table `news_articles`
--
ALTER TABLE `news_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `section_code` (`section_id`,`code`),
  ADD KEY `news_articles_section_id_index` (`section_id`),
  ADD KEY `news_articles_code_index` (`code`),
  ADD KEY `news_articles_tags_index` (`tags`);

--
-- Indexes for table `news_comments`
--
ALTER TABLE `news_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_comments_article_id_index` (`article_id`);

--
-- Indexes for table `news_search_index`
--
ALTER TABLE `news_search_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_search_index_article_id_index` (`article_id`);

--
-- Indexes for table `news_sections`
--
ALTER TABLE `news_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_sections_parent_index` (`parent`),
  ADD KEY `news_sections_code_index` (`code`);

--
-- Indexes for table `news_votes`
--
ALTER TABLE `news_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `article_user` (`article_id`,`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_module_type_entity` (`user_id`,`module`,`event_type`,`entity_id`),
  ADD KEY `notifications_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name_lat` (`name_lat`),
  ADD KEY `lastdate` (`lastdate`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_ads`
--
ALTER TABLE `cms_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_album_cat`
--
ALTER TABLE `cms_album_cat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_album_comments`
--
ALTER TABLE `cms_album_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_album_files`
--
ALTER TABLE `cms_album_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_album_votes`
--
ALTER TABLE `cms_album_votes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_ban_ip`
--
ALTER TABLE `cms_ban_ip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_ban_users`
--
ALTER TABLE `cms_ban_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_contact`
--
ALTER TABLE `cms_contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_counters`
--
ALTER TABLE `cms_counters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_forum_files`
--
ALTER TABLE `cms_forum_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_forum_vote`
--
ALTER TABLE `cms_forum_vote`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_forum_vote_users`
--
ALTER TABLE `cms_forum_vote_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_library_comments`
--
ALTER TABLE `cms_library_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_library_rating`
--
ALTER TABLE `cms_library_rating`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_mail`
--
ALTER TABLE `cms_mail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_users_data`
--
ALTER TABLE `cms_users_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_users_guestbook`
--
ALTER TABLE `cms_users_guestbook`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_users_iphistory`
--
ALTER TABLE `cms_users_iphistory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `download__bookmark`
--
ALTER TABLE `download__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `download__category`
--
ALTER TABLE `download__category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `download__comments`
--
ALTER TABLE `download__comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `download__files`
--
ALTER TABLE `download__files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `download__more`
--
ALTER TABLE `download__more`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_messages`
--
ALTER TABLE `email_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `forum_cat`
--
ALTER TABLE `forum_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `forum_messages`
--
ALTER TABLE `forum_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `forum_sections`
--
ALTER TABLE `forum_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_theme`
--
ALTER TABLE `forum_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `forum_topic`
--
ALTER TABLE `forum_topic`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `karma_users`
--
ALTER TABLE `karma_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_cats`
--
ALTER TABLE `library_cats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_tags`
--
ALTER TABLE `library_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_texts`
--
ALTER TABLE `library_texts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_articles`
--
ALTER TABLE `news_articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_comments`
--
ALTER TABLE `news_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_search_index`
--
ALTER TABLE `news_search_index`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_sections`
--
ALTER TABLE `news_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_votes`
--
ALTER TABLE `news_votes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news_comments`
--
ALTER TABLE `news_comments`
  ADD CONSTRAINT `news_comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `news_articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news_search_index`
--
ALTER TABLE `news_search_index`
  ADD CONSTRAINT `news_search_index_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `news_articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news_votes`
--
ALTER TABLE `news_votes`
  ADD CONSTRAINT `news_votes_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `news_articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
