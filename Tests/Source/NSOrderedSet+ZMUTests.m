// 
// Wire
// Copyright (C) 2016 Wire Swiss GmbH
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.
// 


#import <XCTest/XCTest.h>
#import "NSOrderedSet+Zeta.h"


@interface NSOrderedSetAdditionTests : XCTestCase

@property (nonatomic) NSArray *sortDescriptors;

@end



@implementation NSOrderedSetAdditionTests

- (void)setUp
{
    [super setUp];
    self.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"lowercaseString" ascending:YES]];
}

- (void)tearDown
{
    self.sortDescriptors = nil;
    [super tearDown];
}

@end


@implementation NSOrderedSetAdditionTests (ZMSortedInsert)

- (void)testThatItCanInsertIntoAnEmptySet
{
    // given
    NSMutableOrderedSet *sut = [NSMutableOrderedSet orderedSet];
    
    // when
    [sut zm_insertObject:@"A" sortedByDescriptors:self.sortDescriptors];
    
    // then
    XCTAssertEqualObjects(sut, [NSMutableOrderedSet orderedSetWithObject:@"A"]);
}

- (void)testThatItCanInsertIntoASet_1
{
    // given
    NSMutableOrderedSet *sut = [NSMutableOrderedSet orderedSetWithObjects:@"B", @"C", nil];
    
    // when
    [sut zm_insertObject:@"A" sortedByDescriptors:self.sortDescriptors];
    
    // then
    NSOrderedSet *expected = [NSMutableOrderedSet orderedSetWithObjects:@"A", @"B", @"C", nil];
    XCTAssertEqualObjects(sut, expected);
}

- (void)testThatItCanInsertIntoASet_2
{
    // given
    NSMutableOrderedSet *sut = [NSMutableOrderedSet orderedSetWithObjects:@"A", @"C", nil];
    
    // when
    [sut zm_insertObject:@"B" sortedByDescriptors:self.sortDescriptors];
    
    // then
    NSOrderedSet *expected = [NSMutableOrderedSet orderedSetWithObjects:@"A", @"B", @"C", nil];
    XCTAssertEqualObjects(sut, expected);
}

- (void)testThatItCanInsertIntoASet_3
{
    // given
    NSMutableOrderedSet *sut = [NSMutableOrderedSet orderedSetWithObjects:@"A", @"B", nil];
    
    // when
    [sut zm_insertObject:@"C" sortedByDescriptors:self.sortDescriptors];
    
    // then
    NSOrderedSet *expected = [NSMutableOrderedSet orderedSetWithObjects:@"A", @"B", @"C", nil];
    XCTAssertEqualObjects(sut, expected);
}

- (void)testThatItCanInsertIntoASetWhenTheObjectAlreadyExists
{
    // given
    NSMutableOrderedSet *sut = [NSMutableOrderedSet orderedSetWithObjects:@"A", @"B", @"C", nil];
    
    // when
    [sut zm_insertObject:@"B" sortedByDescriptors:self.sortDescriptors];
    
    // then
    NSOrderedSet *expected = [NSMutableOrderedSet orderedSetWithObjects:@"A", @"B", @"C", nil];
    XCTAssertEqualObjects(sut, expected);
}

- (void)testPerformanceOfSortedInsertions
{
    NSArray *items = @[@(190), @(408), @(50), @(117), @(67), @(261), @(224), @(6), @(453), @(89), @(4), @(514), @(230),
                       @(406), @(357), @(467), @(284), @(284), @(1), @(323), @(532), @(379), @(97), @(93), @(420),
                       @(250), @(513), @(547), @(227), @(161), @(561), @(132), @(404), @(42), @(448), @(77), @(14),
                       @(56), @(301), @(412), @(557), @(428), @(187), @(5), @(561), @(362), @(335), @(86), @(522),
                       @(534), @(43), @(473), @(500), @(516), @(448), @(212), @(596), @(115), @(37), @(424), @(64),
                       @(434), @(390), @(103), @(72), @(264), @(47), @(79), @(522), @(281), @(313), @(559), @(598),
                       @(459), @(438), @(14), @(32), @(562), @(207), @(284), @(347), @(457), @(342), @(223), @(269),
                       @(530), @(598), @(234), @(451), @(483), @(214), @(321), @(444), @(238), @(423), @(365), @(474),
                       @(330), @(129), @(513), @(541), @(194), @(191), @(490), @(408), @(482), @(556), @(326), @(431),
                       @(46), @(78), @(580), @(596), @(201), @(15), @(261), @(266), @(201), @(385), @(322), @(500),
                       @(540), @(287), @(484), @(383), @(210), @(340), @(289), @(266), @(481), @(249), @(83), @(123),
                       @(559), @(289), @(306), @(509), @(368), @(155), @(547), @(89), @(207), @(365), @(473), @(363),
                       @(581), @(476), @(242), @(142), @(77), @(144), @(494), @(600), @(339), @(266), @(333), @(438),
                       @(17), @(564), @(333), @(266), @(292), @(376), @(356), @(9), @(330), @(311), @(418), @(479),
                       @(225), @(598), @(573), @(335), @(199), @(156), @(193), @(22), @(99), @(291), @(499), @(421),
                       @(449), @(25), @(117), @(101), @(153), @(368), @(68), @(536), @(270), @(381), @(1), @(194),
                       @(520), @(557), @(414), @(185), @(8), @(361), @(486), @(62), @(452), @(444), @(391), @(110),
                       @(251), @(105), @(399), @(241), @(98), @(124), @(324), @(192), @(431), @(207), @(260), @(434),
                       @(294), @(508), @(184), @(95), @(501), @(561), @(316), @(333), @(253), @(197), @(86), @(247),
                       @(54), @(60), @(343), @(511), @(563), @(63), @(354), @(163), @(582), @(119), @(116), @(240),
                       @(173), @(553), @(428), @(208), @(39), @(118), @(303), @(104), @(318), @(234), @(514), @(138),
                       @(499), @(144), @(403), @(54), @(116), @(407), @(224), @(389), @(545), @(328), @(426), @(464),
                       @(531), @(443), @(223), @(578), @(5), @(114), @(517), @(101), @(104), @(241), @(456), @(435),
                       @(503), @(269), @(81), @(363), @(559), @(342), @(215), @(599), @(275), @(308), @(587), @(486),
                       @(566), @(590), @(393), @(540), @(150), @(313), @(116), @(127), @(1), @(477), @(258), @(120),
                       @(240), @(326), @(147), @(330), @(183), @(561), @(11), @(180), @(344), @(376), @(488), @(467),
                       @(333), @(476), @(288), @(582), @(278), @(599), @(275), @(436), @(21), @(323), @(453), @(600),
                       @(385), @(167), @(204), @(424), @(94), @(340), @(586), @(29), @(317), @(85), @(571), @(302),
                       @(328), @(491), @(169), @(411), @(537), @(571), @(504), @(67), @(557), @(358), @(564), @(259),
                       @(185), @(248), @(506), @(490), @(161), @(72), @(98), @(404), @(17), @(586), @(271), @(265),
                       @(439), @(159), @(375), @(390), @(415), @(407), @(363), @(352), @(563), @(202), @(70), @(156),
                       @(187), @(577), @(112), @(453), @(598), @(111), @(513), @(270), @(154), @(99), @(578), @(177),
                       @(515), @(533), @(469), @(176), @(307), @(60), @(199), @(272), @(168), @(204), @(196), @(524),
                       @(440), @(245), @(243), @(585), @(572), @(26), @(142), @(84), @(500), @(424), @(209), @(590),
                       @(460), @(144), @(73), @(21), @(328), @(327), @(217), @(36), @(14), @(92), @(322), @(590),
                       @(416), @(530), @(523), @(238), @(302), @(560), @(149), @(21), @(300), @(254), @(260), @(119),
                       @(185), @(220), @(99), @(87), @(195), @(497), @(58), @(240), @(408), @(516), @(566), @(100),
                       @(443), @(251), @(362), @(19), @(549), @(134), @(500), @(517), @(68), @(130), @(578), @(341),
                       @(64), @(341), @(590), @(555), @(380), @(132), @(504), @(239), @(96), @(112), @(557), @(37),
                       @(146), @(464), @(346), @(4), @(456), @(132), @(297), @(599), @(255), @(35), @(380), @(393),
                       @(366), @(501), @(342), @(448), @(504), @(580), @(477), @(350), @(558), @(524), @(546), @(193),
                       @(510), @(535), @(82), @(350), @(27), @(562), @(368), @(596), @(99), @(401), @(346), @(296),
                       @(436), @(330), @(459), @(446), @(483), @(29), @(256), @(43), @(476), @(213), @(75), @(268),
                       @(131), @(453), @(69), @(506), @(339), @(119), @(106), @(311), @(321), @(572), @(382), @(579),
                       @(79), @(414), @(305), @(149), @(146), @(530), @(137), @(368), @(321), @(485), @(114), @(172),
                       @(160), @(178), @(383), @(290), @(443), @(489), @(241), @(93), @(519), @(296), @(165), @(402),
                       @(175), @(148), @(325), @(170), @(95), @(536), @(470), @(41), @(578), @(107), @(98), @(490),
                       @(563), @(240), @(176), @(83), @(236), @(155), @(252), @(259), @(214), @(238), @(221), @(15),
                       @(325), @(504), @(293), @(506), @(84), @(451), @(430), @(279), @(519), @(242), @(203), @(287),
                       @(316), @(563), @(493), @(351), @(429), @(386), @(218), @(160), @(210), @(232), @(363), @(185),
                       @(354), @(321), @(112), @(513), @(596), @(394), @(359), @(397), @(306), @(446), @(440), @(355),
                       @(563), @(509), @(591), @(532), @(575), @(352), @(412), @(169), @(558), @(34), @(339), @(229),
                       @(133), @(280), @(137), @(316), @(68), @(220), @(337), @(436), @(572), @(342), @(573), @(260),
                       @(93), @(140), @(262), @(151), @(365), @(86), @(183), @(466), @(311), @(394), @(547), @(228),
                       @(575), @(128), @(169), @(270), @(357), @(486), @(565), @(106), @(41), @(268), @(135), @(516),
                       @(203), @(480), @(14), @(34), @(544), @(220), @(446), @(593), @(45), @(516), @(535), @(10),
                       @(206), @(143), @(203), @(315), @(485), @(280), @(88), @(504), @(263), @(506), @(495), @(303),
                       @(336), @(249), @(401), @(238), @(229), @(304), @(86), @(163), @(30), @(221), @(300), @(528),
                       @(415), @(102), @(508), @(563), @(90), @(90), @(298), @(29), @(106), @(265), @(270), @(286),
                       @(565), @(568), @(228), @(426), @(256), @(488), @(163), @(504), @(224), @(497), @(261), @(120),
                       @(218), @(188), @(478), @(425), @(545), @(310), @(87), @(592), @(222), @(8), @(278), @(66),
                       @(453), @(527), @(412), @(49), @(2), @(79), @(221), @(366), @(488), @(58), @(505), @(272), @(352),
                       @(442), @(103), @(225), @(544), @(497), @(257), @(169), @(48), @(568), @(434), @(216), @(24),
                       @(550), @(371), @(467), @(233), @(576), @(423), @(148), @(275), @(354), @(595), @(13), @(409),
                       @(458), @(406), @(536), @(154), @(156), @(89), @(530), @(481), @(185), @(543), @(286), @(589),
                       @(343), @(547), @(99), @(119), @(75), @(275), @(427), @(242), @(441), @(272), @(83), @(524),
                       @(380), @(138), @(415), @(575), @(158), @(88), @(483), @(539), @(132), @(291), @(458), @(147),
                       @(338), @(41), @(136), @(484), @(293), @(36), @(360), @(31), @(204), @(253), @(272), @(114),
                       @(147), @(440), @(170), @(265), @(400), @(589), @(223), @(341), @(587), @(440), @(324), @(60),
                       @(574), @(177), @(215), @(252), @(162), @(50), @(235), @(64), @(574), @(171), @(530), @(119),
                       @(313), @(272), @(374), @(91), @(365), @(488), @(516), @(163), @(181), @(462), @(44), @(69),
                       @(81), @(204), @(187), @(389), @(348), @(48), @(508), @(14), @(475), @(104), @(260), @(466),
                       @(85), @(18), @(245), @(186), @(24), @(565), @(520), @(122), @(284), @(471), @(368), @(572),
                       @(5), @(532), @(396), @(548), @(106), @(539), @(196), @(295), @(569), @(523), @(562), @(119),
                       @(424), @(223), @(354), @(65), @(27), @(470), @(108), @(315), @(592), @(536), @(583), @(535),
                       @(428), @(534), @(140), @(296), @(213), @(29), @(1), @(413), @(500), @(473), @(79), @(286),
                       @(202), @(343), @(262), @(341), @(480), @(10), @(277), @(107), @(561), @(175), @(198), @(117),
                       @(64), @(101), @(249), @(267), @(65), @(471), @(369), @(583), @(214), @(317), @(581), @(153),
                       @(492), @(347), @(58), @(455), @(313), @(21), @(353), @(24), @(380), @(165), @(478), @(394),
                       @(507), @(122), @(280), @(169), @(345), @(68), @(360), @(277), @(347), @(232), @(572), @(295),
                       @(122), @(60), @(39), @(77), @(330), @(26), @(399), @(202), @(364), @(195), @(15), @(173),
                       @(449), @(525), @(440), @(258), @(432), @(116), @(173), @(533), @(255), @(248), @(596), @(10),
                       @(348), @(520), @(66), @(211), @(3), @(311), @(352), @(424), @(84), @(436), @(148), @(566),
                       @(393), @(324)];
    NSMutableOrderedSet *sut = [NSMutableOrderedSet orderedSet];
    NSArray *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]];
    [self measureBlock:^{
        for (id obj in items) {
            [sut zm_insertObject:obj sortedByDescriptors:sortDescriptors];
        }
    }];
}

@end


@implementation NSOrderedSetAdditionTests (ZMSorted)

- (void)testThatItReturnsNilAsTheFirstSortedObjectWhenEmpty;
{
    XCTAssertNil([[NSOrderedSet orderedSet] firstObjectSortedByDescriptors:self.sortDescriptors]);
}

- (void)testThatItReturnsTheFirstSortedObject_1;
{
    // given
    NSOrderedSet *sut = [NSOrderedSet orderedSetWithObjects:@"A", @"B", @"C", nil];
    
    // then
    XCTAssertEqualObjects([sut firstObjectSortedByDescriptors:self.sortDescriptors], @"A");
}

- (void)testThatItReturnsTheFirstSortedObject_2;
{
    // given
    NSOrderedSet *sut = [NSOrderedSet orderedSetWithObjects:@"C", @"B", @"A", nil];
    
    // then
    XCTAssertEqualObjects([sut firstObjectSortedByDescriptors:self.sortDescriptors], @"A");
}

@end
