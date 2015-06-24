require_relative 'train'
require_relative 'histogram'
require_relative 'util'
require_relative 'graph'
require_relative "sherlock_db"
require_relative "sherlock_init"

ids = [
'079fee0af27f1d2a688020b0dc34d9b4',
'3d01aa89ac96d0d0b73a42a68b1556e7',
'83e464735d321ad83eb1a2d242e67e00',
'd88aa9fa459bfe9c8825798c16d0c5f8',
'2465e4faea2954eb10a09c7392c49ad5',
'60b234fe5110937c1821e87e92b87a4b',
'd47928417bd21ab8df82ffd86b954149',
'542aba60f688c1850f773b2f4f25f26d',
'a2756a4678fff7a48e63a5921aff55c7',
'5ebe3a30b486e493d1f017fbfb9fd05c',
'45fc7689baf3f74ce186cbfef1c04533',
'0f1a2f9e0118b7f7d391f84178b8893b',
'3c387bb14b369cdd3a86c65e6fda7db0',
'be8de0ce300905ef34b96d07b64a5c0b',
'b2472473041ce54f69b850aeaa449ec7',
'26e3a0d922c11e2cc50d77a436743ff7',
'd79d855229df5bce728330680bf3194b',
'c2482c4d96700150796a0082830b0b26',
'4bd99e4adceeffae72b8a755d8fbb6b9',
'afcbf06fbe767ea95a6f3e1ce1c4c4c7',
'31c1daca3f4a4238bd9de191acb57a21',
'3ade08ddf886e01f8d92095225175f8b',
'a38c5268e0f8dd13acf95eabeb82a83e',
'5a3ba6fa8d765bcdf8a254cf4b8db90a',
'98c4d98c6f0663a7a3b4e337b66698e7',
'fdbe4b7e23d4e9b23a29441564c00d6a',
'ee8667d9b98087aad0a257c723c1b0e9',
'4391d38c4c2985b7774fd23a545cc7b2',
'7ce81e1e1986a323fa6286f0718e329c',
'e4fbf62987648e19f7b6cf02c6210bdb',
'4c2b9d0f7cba90b19c61b5da5fffefcf',
'd786df842b00ae3a2566396a88d6804d',
'b281aa7f775de0200cb9bd830f1ead7a',
'7a2c9db3b10b5bd6afc53a7b454e9912',
'97d8acecea4c52057760c684c508dd73',
'3766bbb1c2845922040c7cf8bbe97ae1',
'97d1c77cb77d202a7f1a5aab13a8361d',
'0948a360d702a8416b5132f0d5fd6288',
'fd508f2b37de15483946c810ad4669e1',
'2b0b68bade3cf710dd87fc51f0aa9ca4',
'ca16d7a8e82e4b678c5f655249027da6',
'f13ac3ad54e314aeea70184d052eeb30',
'47f901056bd358540f85e15191ff9a29',
'dfdca7642971dbe151c7320c249448e8',
'220e192627b600d00eaa6b42ce8844da',
'313851878d2939a5cfb14113931b4d76',
'b2bf76bada84fc5c86f68c24d2c7aa2c',
'eeb103439d8a61cf546f64f1840b4a55',
'0080ce2427ac82239b8dfebee9e60d31',
'7bc8f1e3d7938f3572e749725a1778ae',
'f088d9702b111739eaeaba70ddfc0132',
'3c739651d41b06ade9c365c67f8688b5',
'a7eecc077ef9ffb9df8cc2c3075bb2e4',
'0cc687fa52bd1b01d9cc89bad15526ac',
'dd5b4ef0b1570819e9fc52ac5ec29631',
'db8ea05f29796f92c0acfea846f1e2b1',
'9b0e3eb39e5cadcb476b3fe9a2a9fed5',
'5b12a585eb7d4de9e3796949c0846bee',
'4d0051770a7a7e9731a67f97ac2f260a',
'aef39eb5c8439046a23099bfda36b73a',
'cf0fc58b8efe540199dc0eb3cdaf1003',
'9f509f80ff65f2f09904d548e89dea59',
'cde18b636c96a83e3f3137f6e84a2f1c',
'9b6d55ea75451e53aa86ac7b7395b1c0',
'1a8c092938b42e392ee607a846373b62',
'd77deba4471050f03fdbd1a4a49209ee',
'7e2aad413eeb6d349d978d2c00d1db3f',
'f1d149c81e3d3af14bbed2df6fc33152',
'4fc51906dc8be35095328f0d0b5a7390',
'a89ee46d0fff7adda18df557ea9a7f37',
'6bd2a7d9016cb091e1db44001da14c43',
'be0fd01382d30d2ad32abea5dae246c7',
'eef554a8159936fe0a6c957320996554',
'c779dfba2a7ed95c3344eaa53d64eb53',
'9183a9be91e9aee737cfab9787b133dc',
'683d2d9d78902f561c03a9faca5fa4f5',
'53458d08e1d5ff271ca298ec1c9df847',
'aad1057ff459268156f141a09dfa756d',
'1ee9d176749b36d581bac7c8b5304a4e',
'4bf4b5eec955b90394af4b86d8ec53a5',
'2f607c32eb934e72b7e6e10ef0654449',
'aca754a700be29d91c37cb55ee06b7f0',
'1931881718bc44830b52eb56a2d2ed8e',
'cab6334e87472911f08b2798124e8d4a',
'e56c290cb0339f281e6c8a11e7b34ac9',
'f4d897ee15afff881abea4545a605609',
'32bbf6714eefd226eab56e7b380d7737',
'ce14e89a137cd1ccd4145a316584a906',
'd1b443805b7a8eae5b04ee1902ae298c',
'8ec99c1f30876c1c6315e989c6e30f39',
'3ec4a89981706891f74161bf2b396229',
'214a4bc5fdb7d209759e8d40be0d6567',
'7de5f11d5231df0b0411bb03bf0f74d2',
'346fc73ed7839c5cf6a7841e0f9bdc15',
'1046968a41107d189dc94b517d4cb636',
'a205e0ca260b713013d6212509a7581f',
'80293ff0392587375fac62c75ae461da',
'3150546ebd9433812fe9985559e2c508',
'5505fc6908d31949bf7f9573bf50a295',
'7785be915ba569363d621405889ca17e',
'e28b19dcf0dbb731318edc0815a40c8e',
'b4c861f3835c7c3a6f2c5b93d2bf54df',
'818a285e006953c2bf5c1cb0fa94012e',
'ce98a7df704b77637f1a5e3746fb4c70',
'f7f9b6758f79f44ec372023e8ef7fde5',
'42d6eb23855cb77b4a286e44b7afedd7',
'07f4a369e34fd00d8efe9a87837766ed',
'2616b84eac790f81cb270088f22a98e2',
'33e8c6442cf278b7bb1e79a213f3498d',
'f060d384a8ef3ef6b401d38314a22f3c',
'fffddb7c733c73bfc76c2822a17e84e4',
'3d9d15bfe2d6685f7bb26bd6612a6878',
'5b0344d6e5dd71daaaa8ba77f7db9cbd',
'49553df019ccb70420075d06f0d13597',
'5bcccf9e3bc643bcc1e114534a36c3e3',
'1101d241eb41f2a8f88fd0701f2b45b1',
'c9a1c3c4258c9f019e6b0c55bc785bf5',
'348244bda1df56288652467559fed878',
'a30b92774149292dd426cb208e1af147',
'bc716423a427f3c725f73fa7456f0d52',
'7eae7902ef8da390a059393470ce401b',
'9225cb6730b178cf606978a95d6e9c5f',
'8fa91c1b0b6de5e6a082ef9f388f36b3',
'e5ef1b408a9f0c25a5d92a6a93ed3dd1',
'ed6e15388ea2ef408728f00a22147699',
'6e67ba79f2ed12171a67938dbe5f9b9d',
'63bd81168c762bc5345ced8513bd538b',
'521dd402456b75b3c8a49b064e3f1c99',
'1e3c57462baaf8adb98765717186732c',
'b8de31e0442eaec7620ff33a6e15fc31',
'2839f0a5a89791f2a75b7f58f4717058',
'9b0784cf039acbd966b30583772dc4ce',
'b18fdfacc7d7549b128f93e0e95dd6fb',
'1bd81073bdb0ff5fe3ea516d24594355',
'dd5f0161f547df283f8dca8b703aa0fd',
'0409c7276c66cdc7595580e9c13410c6',
'ea339967dd820d013e4f03d87bb9e8e1',
'de99c74be6be0fa1e7c0bf9cd3803a54',
'1baea0b11d10dc85a67f5292b6d0f3a5',
'9d897a0a0b1ae4a2e79ea673b08d6fd6',
'57ccad30e823d12b5bdb8badd3712ece',
'ce703b7278987256aa53b0cf655e1c69',
'5af938281e3a0bb02cc9946d369af1bf',
'10fdb11b13fff4b822ddc239ad6f3969',
'7f260a20df6fe985217b7bb8a8bee9bd',
'e209ea9f9188f16b849731c16f0b0dcf',
'd2a99c6d753f4db73c1a520699185216',
'4502d44446b6110f99e6e6d55df0c739',
'8902a22dbe84d76f79be5e53d27763de',
'30fb66f1f20ea19a3065142761acdfcc',
'434f463902f2c11e1d68822bcdc8c6d9',
'df796e05d87b4ad21ef991387687e4c2',
'18c5ae99b9aef7803bec0fa8acbfdd84',
'd4e856a5984287c8a207faa1cf5d8a12',
'137568440d8a2419ff4c4535c939da3a',
'b97e2250374aa3b55edad9d1029a40d5',
'a6743420e69cfa08e102ecafe7139d7e',
'7e7bd04a5783650fbad0815a28e9b70a',
'813f8083d91e7ad7420762a8b48278a1',
'faf236abafd765cbbd97b20609ec01ff',
'247b5a9351d999d1e145b178e30f786f',
'cd7e17e35ef37ce38a4e48e91cde1a78',
'096d38441b78bcc7f7e87e3f9ba009af',
'80284c73fa77108b49aace97c1c50576',
'fcd52e904e1a093d7f7fc92cfc6f06b6',
'cf29db60f28b49596e39a6137c883017',
'237331a9aa09d164864337b4a27820d5',
'e8fa1826555ad408092b0b803c1b5391',
'506821eae86510011b8ed0e73e0e38b2',
'db97ac32982dc748251eb1d0795cf2e2',
'c9501c9829d2c5fab5e9bfb8e8ec91aa',
'09371191ec0fd0f0a51d9be8ee2ba3cd',
'93f20db7405dcb4a57aa32df0506276a',
'f36055c3798f74fb008fe47b8fe4af20',
'64b43b7c1fdfe8da6d8e039045c6b852',
'4d77725d2a690541491b67c203e663fb',
'c79e23c4bbccd247f86a18125a7893f1',
'e0a164bf8055a42d583002eef2c70c29',
'a83132078295d6bb99c7598ddea2fbba',
'dee99bb3f905c13dd6d25212d5f88ad5',
'd52b6f04de58422a59df3b02127eb249',
'1c05f0071ea0e17c32005fd9c0840049',
'003b255561d93cf8ccd1d02bc2136674',
'979c6076fbdd329f7bb4e33ea3f9a1c0',
'e6e7327ac3d9fba10e08f29d47f44aa0',
'f4861f6ec526d2364809aca226c24c96',
'74e77d038f63162ee91e0920b024dc93',
'fca8c64b93a5a55fadc6c8a9f0358db7',
'54a1a7d54370bf82933d9e9356d2a703',
'b4ef80e85930be2dd0aab1bfaef352ae',
'baa2a4999da8d7740f09d6b98732ba0f',
'1ed695ef00fb255a1a1ba3ddde6dfc7c',
'4164f06f62280f4388fe59c5f8ebed79',
'ef2c6ad17139d71b36313cfb1ff4db0c',
'efa38329a7b93ce3c17b15fddbcc49f5',
'cf0ac194bb8b660c1919dc821e6bf4e8',
'33d69ffd49b9cbfb119f3615308557ab',
'd70f57b9e07f2aa34e2b2c91860c5e03',
'4dc25be64d2fd7ace271990ec292a3a4',
'2c3e34a8c42822eedbdd48ce23792143',
'1bec3e1fd66ec8ea15c0f6e07bce15f9',
'9fff29bf498119f719590766f18a8d6a',
'205fd0b0315781654867a511143862e7',
'95e837acebd3683dcf70517574b8f025',
'cb48c2b8e23bb9d03c7c4be4fa2b88b2',
'240c6be452a280123d3cdf03dd0c21b2',
'ccd045ed3c777df8f806c6620de00937',
'c0511c0d7e42b3a979599a082d9c04ea',
'139e7d8af583e2bf1f51590d49948d17',
'8bad707362ce32358d1a570d6de21102',
'025b22fe62a1a97c511d1f28efc31b20',
'9f166bceeaf04e95dad81bcca3cfa29c',
'120996b52ed50b5eb53c5fb29891ab93',
'6e6ff87015b57e5c85697faf970823e9',
'deb2e94c747b446de80178ddeba909f9',
'a1edbfdc96018463b6e4991938925df9',
'9131647d8552d3428e0f163e4dfd3ffd',
'400598252998d9dafd871aaf1b6e4ca6',
'c92ac292e782ce3571f1dc1819876f82',
'c6f7cf2cfda7e44920ea1c7ff3d549bf',
'9b05072fe2e1d9a4a9ee14e5c04f071d',
'e21f8373084e57f4ad72454da3b37c7f',
'26b5a04ed7dfb06660d229de7f1e46f9',
'ca6ce6297dea13f6dbf017217eae9be5',
'df2ffa58db6686e8d6bba2343ecb4312',
'bd846626b6c4f73a3b40e9427a6f57f7',
'420e37e5288edf534873018526df96ef',
'9766dfa6244e523591012c4c71a84b63',
'7aecb68effb1791085e9c2b871c17404',
'99ebe9e8f59358ec3a7d4aad6cd54088',
'65991e5d7efd79c87b29337d74762f4e',
'1ebe81ec04fb02082bed7d64171c1acf',
'4146594021a4b11f5dbdba7a09e27625',
'f481fab56f5ddf2f126c0baea7eaab9c',
'8cd3c08cf16228398764174755bf3260',
'5c49097a2a7a4f013c6e46efba768deb',
'a641b535f8ec1ffa6a14ba0852082acb',
'd15d244a943443e436bb0f44ef5abba7',
'9eb2bc72386b46c3441b0ea135cc2100',
'b09cc86335256bad0a337fd087836122',
'b080f22e406558b214d906539ad9150d',
'8503b475a69df20dad5ea888b84bed7a',
'4b0dba4d27c70c19dc2451e31eacd529',
'6c782817f1863866076a8ea1a74dd867',
'6adbbc4c66710b9b7dfe83bd23c26f2d',
'addc7fe0f8e2606fb358d854692c56e4',
'6fe0b4546887d8806fae5efe371f4a00',
'ed101997588746185f77d48b3da4403b',
'68fa6e5bc8392cefca3d23113ccc1fc7',
'7deb2be794472d0f5f1de0831ac134b2',
'd237049bb8873363845788ce94d20078',
'f6595c35949faeef95cee03a8bb188c5',
'b2630314771ab407b0997621022bb9ad',
'a91b56d66d477caa22a2d30ee8d6d86f',
'06c11b241fbd2464d32e8d981d987405',
'c860ae271470d5cdfbd9485ce6ce274a',
'c67d8f252444d5b2ff54fcbab6265019',
'37f89da9dc93ae014f2bd13923972488',
'8106bbb2c4f1fd8cdda2fc111e50eb96',
'd057643fb03fbd423f6f6d80cc2d122a',
'52b30b8430293581a3c36af27a4d794d',
'683a349888c2faf63795bba3017db339',
'1bb425c2c15b2eb345d4b5b2910621db',
'af0991eaaacf49f84106c3d204ad430e',
'379d4a06a80a5268ce7fa5fe64682f77',
'53b12f4c9244395ee156bcd955058b68',
'ce55fea4974a8047d73a4c5fe9d1050d',
'06cf03db4dc586ccd57bc6e56ce9a60b',
'2d08990d31958f25f72cb2b29051b8ed',
'9dd86a84ccbc5ca6c0067a02a1e53e00',
'06cc560ea128db7d87f77648532cfa98',
'cde63a9d5054003cc4554f2bfca5d4d4',
'c730cf335cbe9181776a1b542917c080',
'cd08a21445a2d206cba570d1d26f152a',
'a38a5d23acf37e733eb6d36b8c8deb52',
'30022c5f6541b653285c6e9ccc193004',
'f94d9584f2e3a119d5118f85a5386ed5',
'b94db4071b61a2ec509d950e347c6eca',
'8894694e2ed0bbbb90e25a87c308579a',
'70ee5f087be9579dd499f2432c4d67c0',
'3c809ee390f8d8d200147cf114773110',
'30b6c5f60b9385fa481c71c8e5e9f09a',
'02e7348d8af1804dcc9270ab4022b5b0',
'1a7748b6b279e03fe8e797e939092c9f',
'0d5cd5734423dd002cb62fc1f4b6524f',
'4bf91623182c2379a8a8ae269d4d3733',
'9eea7ad7ddf672582aef873839c8d10b',
'2a85872313f92840439e3918f5995c77',
'21273a9236d9e4ee9c22d5de76e5facf',
'0744761a0d4a97d294e52ec2afc51dde',
'caef7f1134bfea1e5259e962eb817c0a',
'1448a2065102c598c1556e58c03bfc37',
'4423323f14fdd572190c777b4c163b0b',
'57ab44112a3342172418c6e81bfea677',
'f37bc2e30271d18fbfa2a265e9c681a2',
'a85010a598318238dd9b5566b15627c1',
'bacc75082edf992fbecf549610604e4a',
'19f6c233dc391451b32a416aa9ed323c',
'fe4cffe4ca896c5d2faabac00238086c',
'00f506c5de74027518eba95f8c83c3ae',
'cf2e0d8bfb6bb77d959113e47b734585',
'2fc1275c22f137c6b67ad15a1265ac05',
'b7f0ec341b1f1a01b88834b7342fcb16',
'e5cf69895acb9cbda07273abd35eac54',
'3346171ba79eafa81313e39d8082703d',
'584a0606551b0ddab140d264f588845d',
'46fa0c74a108d3341ac95718a599946c',
'bc67d044d0bc090480d55f8e9258d7e2',
'57ff690b7b29da08764f9bd00fd1b56e',
'07dacd9820e9191793e00ccb83cc85e8',
'52c344475123c8d38da7d3431b024f15',
'8f3a7033886f385aa817a05033ef8a92',
'f0c2d1f88b49e261eaeb2a830bb8898a',
'0f10d0dd83648b9c0478316d91f50f7f',
'254e462a7c723840e8c86bec52c25279',
'856828f01fccea3a5623e0de5fc7f4d5',
'5d9f4b479e24aec037275e8215754b95',
'8c89ecdf9d5c3fa1aaa76804a3f1b332',
'f368923c8525b40b9fa9138d10d1affb',
'884999c4337ce0536f07556eea6a082c',
'ddeb93f745799756321111c36da5413a',
'46a40746ccf518d54503af137fd69ff4',
'747a65e1b54e58f23da1e63c5425771c',
'1220ed33c2d57639f8c24a7385bc4e5e',
'a448328f5bca4d70c827046ca0ce139f',
'7fd19dc389f388754b79c13058ca246c',
'752b0cd8aa9c65a628159e4b5c6c0a84',
'030ac81fb2da83e86bb419434b017aa0',
'a39aa4c087e193b33c71afd9792a5317',
'dbb8c250c1df43caac564413c8e14fcf',
'1e34f24a2ab67b1de7a3eadd0ce0daf2',
'6d647ad6c410b485f4b6e963dd3f4676',
'113f0e2826eb7a4c5408e7d211825a79',
'7280c9c93ac33649f6714462ff98a53b',
'7db7d57c8f9783d26ecae157e6cbda36',
'3bf47cba610ca9b225dc0523a2f1d33e',
'6e9bfe5da55b434d4371da58b86c0edd',
'58322465093df2fa695474f77355e788',
'bd83c9ab19954f8d65064ee9aa7b2034',
'872449aebcf7d337d5524376bcac4f06',
'829d2d8abe622ef19cde178596ae7af0',
'57ef49d5b18af6e2fa9329c816cf8654',
'1eea381b5e736a2c15dff075b3554ac0',
'ba66f0b31ef2b4c90336a1ead53686b4',
'552178b36d1e4902217b27ec30fc2e89',
'ece322747db16adec283252898d8854e',
'dd41332a351aec6a238b971a30f56eab',
'06daf0cf975250df6dfedc347adc7165',
'151e064a529aec241b229c1d21fcd79e',
'2a8121ae0c6896f89de4c33b88c83eb9',
'25787c1d18c5fd434ce65a646d9b446c',
'fde3fbdebb72bdceacdb0f950222c300',
'89f0f32282834b8439ccc44bc83d80ba',
'7da21bd1263c90ab345391ae5e7c320c',
'89dba39b4960c004ec22f86e46031df6',
'b6324f5537efc572d78d9eb6db493588',
'38e9f76ae864315094b407f869e2fd7b',
'1060185b1b808ac0a7998b4367efd7c4',
'7747903ef3db8e480db4aaa22106aeeb',
'a9a0dcad1ed75e2091fb3e44c5d1909d',
'8da4a41f34edacbbacd5042973ce7799',
'6297e3038bd6765b22154dd11e7b82ea',
'44d4e818f13fa30c4d9e32c8e1ff7778',
'7fe9e5446e707d8108c474f138a71723',
'5a45bf1914fd6f4663bdc01241ae5ee5',
'a7a5235566dc92c817bcf289660e32a4',
'80b79c624bfeca952279f251230f2d7d',
'8fef2b690aa2e4b390768bde27a7b3c3',
'ea51e010e19e08cc0a59d097aa24b059',
'dd457572476495ec60828bbca41f2ce3',
'8793966945587a2fb41d7a67170eda0d',
'c9c781cb1207e6d2eb0af98e664349a3',
'44857c8c65e64d64a73302dc51e58045',
'3521214b63803d0403c9692f6ecb2fb5',
'b52b14565e1f4fe2d567ad6a746a1b59',
'bea9843f868aba1698ca386c501ee14e',
'f0cdd92a4283b6d6f2294ebd4f780d66',
'bb28592f9605ba236d80f4636fdac16e',
'e05c48f3b5b0508b9ba06232e15c5d69',
'ce63f64fced108cde87e5bf933ba322d',
'6f925eda366e68c418577637ac565e36',
'0e65a3fa8baddb45980251d6d4856dce',
'98fd95f2caa40893b1865f39c57249ec',
'ee8e6a03387dcb49812446ad4ac1a46c',
'87d22b52ef9b8858ea510a093724cfdd',
'5cf4af7748c267d18e90472a58c37e56',
'ee4ecee8706e552bdb15ecbda45513a1',
'd295438298999a81e9e2c400f37ca9c8',
'c9faa81f85f47ee3e618a80ad6af0c45',
'1c5428a5138bc47756b99ab3ce9bc337',
'0ed24ae7296bc9f5b1116475615da5fc',
'e778b5b5086d58e330cad42a65997993',
'b66971154be5bdbd8510aede2cb070a3',
'94a7b24cbed23187910a55635525eba8',
'1d6bfe77359152e1dd3c8c93a2a37a1f',
'390930c594fefc7b3d3abf8faab736c1',
'fcc2397a041c788e8993280f5581e3dd',
'887e8a839f5f137029a46c415621e45e',
'5aa60cbbf57c163e5fc1aa38c0bf17dc',
'cb0a4c43b55c30f4165f1f242bbc189c',
'dc86d1de2d23c8bbbd92765104b47ec5',
'4a2b41af1807e2968991ccb930c8070f',
'29d9941b6efbdfcfc48464b4408b5280',
'c3cf84e1902fff5443d964f8cbbd5bd7',
'c3f39acee7522ca2992737178c7a1a24',
'2e04d150af1939bc198f5a298db2091f',
'c4cd662aed34ca61a7a7abfea9c1d9ac',
'407d2168e4d14ba458de91bb3fca3729',
'ea9da84293c2f3a856cdbebd13f0144b',
'680310ccf3456b8463cda34726261178',
'b76df8218645c9752ce42c0ac840c85d',
'91108cc5bd038b363efe5367bf606922',
'feeb8834b71dcb246eb6b049b8aa59d6',
'9dedb71a6b55f7075bbbe8c80792f44c',
'aed832895d17944bcc0a66f0d255ad51',
'60235f664d13ccff2b46b07ec6d9b723',
'58f155b9b81ecd391bb255899443368c',
'450b8a2ac0b7f5577217f3f69c972de3',
'3e873d8e899b601f55188ec640edd8bd',
'14bdeb612edcfd4edffbfe09c6c87d4d',
'8a1a8a484c4c80214ccf94151c164faa',
'3994438537544bcd63e659e1b97c36b3',
'f06d65f36651c64a19fe6ffe24f28a8d',
'ec0b0796ee35f8f77e0708d4b9b678ba',
'4ca4431c630be2bfa451e7d2c53ee638',
'ab529cdfc0cf9e06bab8d218d36523de',
'8cfd5944227e33380eb324cf52c7c980',
'ae0f36d2c8f9d0a96cb3b3f6005bce0b',
'f42fa3f2f983691fff2d5d56bc59fb27',
'a4462e9669deb00d8cf5a3c5940dd776',
'38061b16cd78d50d1fcebba2d7980707',
'71fdb7fcce2c2d3ec9c342373e8b2961',
'62c9c37b47e8c9e91aead9f4148b0a6c',
'80577c64c6f243b89d670cc83678f840',
'cdcece82902b25493c364a69ea08a5ed',
'8a51ad86b3e3b6ff670cb973bcbea648',
'5fd0de0c4c7c815a176975813cf5d71d',
'bb872d34926131324f017f25253b8512',
'ac24174a52d264bc957be5d597773bd2',
'a197a94b3abe8b9b9723b65240c7e2e8',
'eee74e177e8702ba667d8a6998c36b24',
'a32d501eeae6a2ca0dc89d5396787bfd',
'4e9dee53fe0c25a7d033bb945114e030',
'655298a4dbdcaba0669c98388f2d03ee',
'4363da736a73bc47f083ccf4197df651',
'fb5425215bbabb6e1dca5dd951e4eca5',
'51d7fd85439ee0adc048ff637957a37b',
'e46d7d8f16507225bcb3091b2b43b2e9',
'e36f8426cab4bd0cfe45bc141ae950fa',
'69178fe97260bd4da5597fc7bc480b66',
'cb89ccfe141d72bc54c94e55d21bb218',
'530d73a1a978a7cb10eac9abd947ac87',
'd4df9a0f3f99cd69d5f1207130232def',
'0ffafe005ef75d004cd8cb0e82ae51fc',
'49cba0a68c9e7287831f882d77ab7bff',
'f61328987c6693767808be9594ba4732',
'8f801c3cee6edbc87663665d25a8d274',
'c5274b850983b508bf66d18b64385ccf',
'a7570109b0db63896419be375666c223',
'153af723ee643a4399b8a3cd79a32399',
'7e17592014199f7d72261661cd342d87',
'80c7923431df60a7c37200e03d102525',
'995f879a60f3275162e52e299cfa517c',
'3d1ae18741d1824b8e4d93c7eceb5074',
'e6d6815cf32d3d299532223e947d9679',
'1f682685f64e4ac9634bc40206828683',
'bb8b4f66fbdd6d170dff8e334eb2b6ce',
'b5b4abc633272ead1880ed6ba351db6e',
'6c9dd37fec0553614a50d5bc74d7f678',
'07372e6249e02a5b9dd6bd00d8411869',
'082ab5cb855fce641b554bdf29401326',
'f3072f0c3c170abd5a683c949e4d6ce5',
'b05dad86a81b971169736ebd1bc9f682',
'1921cac73c37d910d6cfa98a0877b5d8',
'9a85bc86bf08a95609f4ed766d3717fb',
'a29ff8408221ff71c60064fde7df6225',
'77ceb73622d5861c82506be49f325d90',
'd9f6ea1b192bcf7640097118962207b4',
'82fd8616da459f115d10ae764cd1fa47',
'17cbb416098e30d86697bbcf652945a7',
'874f4b9af4e096a698c39d2a6bb2eab0',
'41a2b140a662b45e5d507cc9b27445c9',
'e27eeb1c6634160a7250182bad6a174a',
'dedd701b0bc3049a83c6fd8d23042d63',
'2bbc0d6ec6abc80f66dc5a7d6b38b0ca',
'79ec358dfbf748cd64a4b44a405e6346',
'4961e2cf19420e49024766e3d2e40f3c',
'83ef056c9db309774396e36abbb86f0d',
'fda6ed8d61afd3e008b53ccddaf2d8c2',
'f4c33aa6943784d70113b9a42864c1c8',
'3ea7020723b79c9b8efabee68c4a6ad6',
'4f85606b6732ea1fefeda894e131dc8a',
'8726ab968d454dba3702f9c82aa6e4c7',
'13c9f2f4167455809bf4c7fafd1e215b',
'86c304cadfde786d16eef51a112b2fd9',
'c5d870f255f90fc4393b7b9396a5464f',
'dd923af767004aa13e7b6dbc59945821',
'7bfe63cf8b507aff09e59aa2327e6b4e',
'f95cb9a0b20381bb48f5285d081003d7',
'5215cadd3cbe6813eb18d9fc4f86e288',
'3176e1ebef38e3ee471e3a89fa2f937d',
'28dfb89b8fe1b8e956e7133f7ea53248',
'9985bfefaba101c4d7543add98c138e1',
'b15d32e60b407683dcd2a3ba41642f92',
'2b06f4d3cc22a83851ee1bd5727dcc03',
'6622d2124f7fa47aab9af2f5a763330d',
'c79ea57cf32a9c3842ff47daa5fd20d9',
'bb56a0fd60eeb517330f8b1bbaad2dc4',
'd73bd7d09ea9c27b6bfea17aabd33e26',
'f1bbac4bea66cfbf0c252c4717ecf3e1',
'fed64399981c64f58d645abd2ca2488f',
'02482a7d7965fd486d7130a0028ac174',
'30ceaabf63f2d9f8cba38f644921e3b2',
'19bc2ec20104cfbd30fb4bee3892c2ac',
'f22ceccbda50092f47effa057ac3b3c8',
'9fbff791ac6d32ce3fbe7a6d2d808b6f',
'c75ce237acb5e7d2e74e8329713e09b9',
'aa19d4276a5bd63ad5ac7622e6bec9c5',
'3b43aa61f32335fbfd480d19987b32ee',
'0ba0cdaa218e5a77c8cce5965074bb29',
'8e82159df7248559c98258e3eb9a18ff',
'5b70d6331aaa8f7ef97baf8ee50084c6',
'5f04a18611e00c3db999588c8468f86e',
'0a235e782fac179463da81690addaede',
'adb6bd938e0e6a2fc2aa0279f0ce9494',
'619f636eeacae3a04c1bd3892b28fac5',
'f14811ddc4ee7ebb434de7f15d846d59',
'b17c6448900ac4407b6653eb93a9c26b',
'd09add7f3009ef73d04bb1b59b6d23b0',
'7cb4472ac2d3f46fc7a9e572d743afdd',
'267eb54d3525d4e35e617e1407aa5d62',
'da7c1cb535b5d1270cbdb1da46a584b0',
'1d86023bcb008e9d1aa62db622b3264d',
'f8180dad3fd93109b612c3a41842e2c1',
'081fe1196759a144070b55c2fdd9345d',
'8e4bf7a4996b94414987ab6d6126599a',
'd87865ac67b50352f5356132dec5611b',
'45575a0312e97b9fae1a2c2ac8d21542',
'aa73bc4d6e27f46e2788b1c2af96b1fb',
'41da24f1c3320d4ddc1d43d66c6bf8f2',
'2c9a0a24ff04215eec3d0d08a364c3f8',
'24997e09c9ca6cee3e2898dba1e4f54d',
'3b83090b694554e9c7cc10121b9706f6',
'0b3578aff54d98da864ffab2538009c1',
'7092b22e4c68c56efdc30a3ca05bc358',
'1c5398b939d367c42e340af12bb24293',
'0bd57ba89ad70ff99fecbfbbf435532e',
'60e6713f099dfce9b4c0190a959e438c',
'd6696ed61480240fec4b4da05079ed21',
'bf7d1c7c1db26d0647266129605d73a5',
'866263812752752f98e258f82e17b2ae',
'2dc803d4ec60ee23b41a9b27bfbb7841',
'63faab7cb5e6e94d623809dc2d41f425',
'1aa1ae19fd9e1c41fa23e16217120702',
'f604359861f4e5120e408624c4a8303b',
'cd605d6eae446433063d7c6aaf99835e',
'a35dc694548ec4a7a2fb3e23439bf657',
'8c9b351d60b8f8f774bb8045d4695da2',
'c7e82156149a7fdb734bed796acd2049',
'99ba0de95080b39fd4030be1bab22372',
'd6df18b8929a9f8650bf448126f8a606',
'599778fdde03c4cc45a66627c6083e34',
'dfbb4f61d1af68bb487f634208f0822c',
'554393556d0c0f35c2f9f23356c453fc',
'2e6060ceffc6393ff1d104b136a20425',
'ac23f6b43075d085cde401e3dbbfce84',
'0f649292f31bb970e70f43cbe358d616',
'8bb0e42652c855f77a9c18f28e14f742',
'0b320b610873a47fc2b5c07a230343a3',
'47086d6a42fc19db3d940e5b30f3234a',
'f40762dc78ba1251df06985b14e7817b',
'9e8ba691a5309b52c4104de4f90b8421',
'af2515b084d8c261d2499e0f376219d4',
'19cd520a16f15b3a1aa5c33f144cba74',
'1249c2476c91177c1f52202a65dba914',
'759c0a2f285c1101f9c1f41ca4700764',
'd540b21c440fe798121dfb4ff355c8d8',
'52a28843755e9e3482d7a64f03b4ceb3',
'8c6da40cf1a6cf56b6dac74c124122fc',
'bf3eee7fbbdddd65e91f4b62d23ea349',
'980c27a74dc725e4a00670340ba1b4e9',
'eded5ca42ae667129d58b6a7bc3cd550',
'af4b34206a0ecb0c324a684d46b3ceed',
'd2170d0a97d6112a945e73a10ce5d5e1',
'b3288399e41f0eb5af17350c806b87b2',
'a389b22c08bad6b4a19213230cedfe7b',
'169a76b1a8d6be321c0e4e290284808c',
'4623a39bea465bf89057409189c94726',
'84f7f1a62c21fc97c4260a5c39976dd4',
'a4ab2544babbb7f201db8efbc400fccf',
'882f6fc8b756e09cf81fa932cf6a7e6b',
'e25be22b1a1861fcb9ca228c116d88b9',
'2b391d40c0dc2357f2ac98bc4b4f4ff9',
'696a60613fd58fd36c63d61add2b035d',
'18866344cda1aeb3cf73771210298098',
'b5143f217eb729fcc1e604627fee3a93',
'b98f6b72c6fddd7c946471f2615d8ae2',
'b9b213e7beeef6abcf10cc36f5fc71be',
'850ed52d986880687aad2716f697f681',
'ca24322e572eab2b4f70b4a6a3f0a011',
'fd417dafeab95f1f8d3b6e693162362d',
'4fabb0e2457408c7f1d4c3d66b60178c',
'435b8226966d2fb40d52bafd6aaa8a93',
'2c332023f899fa2d6e917d259a9581be',
'872a8ad6b3aa5416eb1d0be74d001bf5',
'5890fbecfd2ac873d7521f4082fee43f',
'a61e6aed32ff0b072f7a63f4ed0bc0e5',
'302e3f36808d8253bc17d770cb22d798',
'101b06235bb0ab05b9e60ade1f884a90',
'565cc90a7c23e6937f06b826c9b7ba84',
'd53aa82393a038a57d03223a4b0e3385',
'a3ef00ceb8a17d87d15b861241e86ea9',
'26599a8b55d6f400370b14922fa7f0df',
'bcdeee15506ab7f6c5fee040b475e7c1',
'baccdb078c5f0940843654fc060be6c7',
'02be1d2bb49d5da259895e1497aaaeff',
'987b0e482c2d32e7bca5d9b4b622b3b8',
'750d122c412cf5edad21ac733d7e00c4',
'582b993cb2c6c795e67d1273996ff8df',
'5b58e55efc4df760ff82037eaf947316',
'bc6d60fee5fd03658ed82ed70fccff13',
'5627ca099dea12f453fd20ba16c2681a',
'b839c6f67c077fa828ed41b7ca72b8c0',
'6fe01fa94edcbd39a4fc0472b0c84d30',
'4898848b958271870e5aa9ac6148c49a',
'978fb2a7a27f09d633c531102cff3fe4',
'4afc03b3d55010c089a351892473a6de',
'b35a91689e6a58fcbb1e23a7ecd680fb',
'6352558f60332a345114440f4504feb7',
'6a334252054233548a26e14fe1a6fd31',
'f7c44f2c40efefca2b80b604c4b14823',
'7f2836da2188a429df00497407f424ee',
'37418565bc1a0fce738ce65edd48afd5',
'c4ee9d459a2f02dc1eb61978857a3c4e',
'9af519cc161b3ab4b6c95ffdf11c9ea7',
'f2a7341750c1cc6dc8bea45185a7fe26',
'6971a1fb8becf44eb8c0e68930f3704f',
'1dd1605b3cc21537bcd161563de3c54f',
'6351ee0173b282bcd3bc9e602d8c9066',
'8ef1272c624f2afa5418df7c5d31c1b0',
'23ab1827b334e030ada7d1028fccaed7',
'67ed5003c6c1dbd64ae05e222ea47859',
'fa403741e26453cb9b8009987c5c8f60',
'bfdd037f504772944b4f077c0a598b33',
'5aea16d7364fb206853dd632859950a2',
'2d039c2b79b2c9f0145d36f792e1ca4e',
'4a18a47f1064dbfefc009b3c5d7bff4b',
'6b927b06ca928ef96c3ffffb28029d30',
'07e406ae4af4c0f586c47cb9ac986b1e',
'da6ddc1a620f9e8240cf15a50f510d9f',
'bc8fd86dcd854b5acdadaf3258e128a5',
'57b87a4919e5c142e8f901bbfd35ed4a',
'4075a6bef0f7240c6eb87dff5485ca9f',
'fbf3d5c20708c03da0a63d69dab9d923',
'639b20b6913af0cbee4df690cf781991',
'a86f49cfbffdba2d02e6ffc5427b1f0f',
'd10f00c2a0e426cfcf8f6b818ee64907',
'07afe593dd5532578b483324242e041e',
'32b6643d8dd72d0fe64e34b6841386bf',
'008cb6fa4f418681375b2d46aee45da3',
'0b2060dc9862d210e173c23d20ccab0c',
'd45bcdea1a7747dcb045164be6fd71eb',
'95032ec50a4b20625ad0f11e3224f88d',
'c00bda7693c139f948dfe96e82fe0efa',
'ade7ed6480fc0a27edc08ab64f4ec4c7',
'0dd756d5553ce684813af338b343331a',
'bf1ea1e719a474689d140b621f169024',
'ad8c39d08a9ff7e7515389b03a364028',
'47d1bece9184ff8d49c1bcb8dc614cbb',
'ca179813bfaf73a687879b9a9e245979',
'e974d0990a2043521807fe25250c4c7f',
'e7bfcf859f931dff46adceee012f5ede',
'b892b720c690dadc11f3faf1213b8bf3',
'ff3c99397120fab3a398d0db636ba17f',
'88e2f4d1ef5513aba0694aeb7c6e3a91',
'44e8ab288fce4f4bbd08634fef99c8d7',
'db01aad7451832e13453ba615f1b5b4e',
'6ed72d2914eeee4af7a362c87fcf04a5',
'70d7269c0988315d7954901f640d36fd',
'f34d4b9354707902893a6866cb489ab6',
'707bf972fd6394e5a25f6479e53d8f3a',
'09702e1e659c7eb847fc748ff374b756',
'44ffa68b2ac102e3ea3cf010c1762f7e',
'd382bbe75671244c108100269b58dd22',
'4260af2ba23c013027f8482ef8d2adca',
'e7e0974daa4f480990ec0571977d0810',
'be8374389fe0c76d6d613c99099e3dac',
'ecd6d604efd5360018d1fd9cdbf855b5',
'72a2a4c0f137c9aa82a1d7c03739652e',
'e1a752b712fced218563716846dc6d36',
'9748fd219907f2bf3028b9b6f98a5e6e',
'48bfe78b06dc6b7182bc44e3fc96dc68',
'6711014d4115811a03fd94fec739dc39',
'129438a74199650fd5264bc279fd6daf',
'1e5646efbe859044e31dd8753c2ecb84',
'aeabd08fc9a49a4e445baee1dbfae4aa',
'2a8ba6ff3f48ca12b263d9066e189c8b',
'764171b925ccbe4ca1934ba1949ca789',
'ae70be257a2ac8a251faa8b8048722e7',
'7d569ade2c2ff93fb3cdb1be62352e50',
'fd26e52dc361d9b34ec74e296a0d8fb7',
'12f58c83c7d78f186a56dd70425b6381',
'de74a0fe1e4f174f2e374d7088b8132f',
'24b5653f91c25ec7825b00d9923e75ca',
'fb450b1ee21a923f56d08bcbfff6b2d8',
'ed28fa29be42839f262f86d70c99eb71',
'94d9116e053c7ee8e11de282caf25aa0',
'8110095372f81b7d1f98b537e1aae475',
'4216dd504cae68617f7962dd78f6972c',
'3496f3fbb09d5716211b999a745ea485',
'0229eb0b5e9bc80b39137658d9ca8419',
'c80df9f6fd9e08b75a097a458af7c535',
'6c167d8142230626b23f1a395c09b633',
'0016b23c646baa584b6ce7f199f8c4dc',
'27b8e4000635682e98af9901ba081423',
'a0d3b1f283fbab840d47504fddbbd746',
'bd34384f6ff372a2ce6d63ebba38ed7b',
'67ddce79631428248fd01707476ed30f',
'7fc6b2b3761a0b70e2202d1cd36f6496',
'ee698f6dd25ca7dd5a5146b8a2e0c986',
'12f981123485fbf1ef7a693fe4101f54',
'd0395f0b6a90e48bff4f12fbe309038c',
'04d2ee5a73bf80b76f2f3d4eea8a0bfe',
'5442fd4d49558c5c8e1b9d7bfe11ccb2',
'f3ab19fae9ee8fa136fdcbab602bc215',
'1df3f407ba014b14869b01e9a5ba1cff',
'f27185b792694c90d362cb1200a4f70e',
'261b1482f42dd1b77a3bd679a7402e95',
'7733364e33749526ff608e4b7118829e',
'c556f62d171b35b65f4ef10a2db3c834',
'b677d722d7e95c67c6243c1403a51271',
'804b134bbf40670c40fcca4607a0af3d',
'01270df04f512c49d8ae9b27193036bd',
'8ce40bbce951ef13608dff85ac1e58cb',
'90551204548135a75bbc7fe53de2207b',
'698e10f461642527b8200c4294dba526',
'de020166520fdc4a7cc8c6c8d7af11db',
'ab60b08c7addd2ae01a0c616e82f9b8c',
'6d98a5f8a3df403d22a5ececc5b80655',
'a4c43e0dbf7b80e4ae23b73d1e2ddd7c',
'5f65dcfae81816681496fd2776c2ebb3',
'eba9d6fb0524b25e0b0fd89d8a07defe',
'3a48f953b635a25f4f5fbb3b4e9691fb',
'04176cb82c139cb3e34d0b7c1958bf6f',
'101e01a52b1815853becaf101dd4cd53',
'd3e5b82397e8e55edc0b29c8436ab801',
'272a0ba5321a62c0064cef9a7eca493d',
'd468a068937619c574bb4f839afbfe54',
'563aac9daa99b8be7a56eb6fa6e19aa5',
'2e92a74fb4ce9d2986d56b7aaf9d5046',
'7cd3d50871ed7cba7da2c1e1f837cf6b',
'a2c482c51cfdc382faba7944473bd2a1',
'303cdc15cda27454f7133b3cc5049676',
'faa1d9bd3d12bfade14681b08ec46c22',
'e280ddb2c8a248f7ec0000a8750429d7',
'9e9fbd275220debbf4fc013ffcb6c258',
'297b114fa02c4556ef7a1af60b784a84',
'70e3462ebbd80abb6249512661a8209e',
'e3fc8dc07178227ef26d85f6b43d4a30',
'a5e0fa252dd1a4dadf3f2a67d9b53e63',
'f16ba5dcb6017a0676b718b19683d638',
'de666d31976f39c89c8b422ce557876d',
'e048b5b740a7dfa6e04ca7bc7dd3b58b',
'5423cc616bfc744533584ee78194362a',
'b72dbf71dfafee748d820ce619c48600',
'24d8a85a8e1f6b2fccb55399ce4577c9',
'f8379b1c1d8e0d00cd40751ddca82888',
'654a9c3026b1ffee856618b7263c00e6',
'0e07810150fa0352a3affac53cfd0b19',
'6c13363462352f5c18ac0d3baf8fac3b',
'0d0b094b1cb79bd2f32aefb580c4a84f',
'f3da20727f08eb8648c4f5258d457bf1',
'3b95c3ff5309bece1d76f05f40aa15b1',
'b8b022cd25202671537bedfe7c2c69c3',
'84860460b6eaab988fd4c546803437a7',
'76458ccdf2b98cbbdb8d12bb624b6e6e',
'edd5c096053f073a61a4df65c9fe62d3',
'c4cd63315dd5876bffe08c3b348a516d',
'af0fc5ac66c6bc9041a383b217714add',
'41bbba48ef9dfa34e5ba7037d9e0a773',
'12e1594858baeb941942d56145c25e0c',
'2ca414c01128ec1c32010a36ed456492',
'2874d9f684c3e0f147eb3de3aeff4311',
'a7a0727db48f05d0d1fb6d6c15c80567',
'8e58bcade3cc6a81033be1d011d6232f',
'e4cf93af3848549f91d30a9cb96438d5',
'bebadbd32dde002bef17b3b385f87fab',
'b22b310b85be0d8210edd2bcd355407a',
'e7afbcf2f76e8f79714e46a41a5fc96c',
'0b015ffe00494cfa4c0b6f8de5f18b90',
'72af9abb83908c3cd63e1397fc80a92c',
'3d6369a0ee5496f064717a4f440c661c',
'c1c2384783b0239a29b6b0df25a2bb0c',
'd570bef871bbad564c9bfb8c376ebc0d',
'2700408f50a3258e5c80777ed420edc1',
'87c8447d3ae4fb71d481081b0c2e220e',
'f180efcf442183398da0e86fe1919b23',
'00106878b833e485b49cc427d98d04f1',
'1522e10cde8df3d70cf5e24e32c4f1c5',
'e96cd4306bde3e81372fd18f1fe4156a',
'8c777ca970f5bf09972db4f6834efbaf',
'0bb080fdfa4c20bb305aa22a008def15',
'495325132dead90681b02aec0825f4bc',
'c1e4548bbc775d495f594dbd1e0c64f6',
'e2268d6540aa465f947743d340cd9531',
'd01991a11fbfb136813e1324a0fe2d2b',
'2891ddd2495a26eab0b314b2814ceeb4',
'4216f634d0ad18bb39b30fb800205419',
'0521c1a809b36892bf6f7804e148b359',
'59d2a70dfaf99f68665e1ffaa4708764',
'8fd771b58e732aff031c737d701439d4',
'5f81c6071067256a7f478c5b1f816bb3',
'4125d52a5a4386ce7a64e038942412b9',
'48638cab7beb7292b0b4c22b6d6b9b4a',
'fce10f09a170ddeaab882dd87d13ef84',
'e603600f7c7290d0d88dd559fcd9e796',
'365906d34691db672a7c339ea5a99ee4',
'56e2d07504ea56991c6b619c2eefe7ef',
'73687e8ba7a87a980990eaac5ca6508d',
'6b820563564b87a8aa17d3ff8d2bed7f',
'2316638bbdb7fa38c43eb43227d6a40c',
'14ea4d20a864d301a0378b8eee38028d',
'2c6b76590686d87f9c25c8f2ee4e6c4c',
'f4f9cd30d366f31fa9061886fdc0143e',
'193b0bf36557694eb6089f776bf04599',
'1c68d14a32b5ad86af127785ead4a251',
'e83f22feb12511578fb794106d2c6b49',
'e5502726f897851eb36e38e475439f0c',
'fe0d5364cbc20efc33074dd74e0282b3',
'28c4a58e57679cd9652e493f2f557cde',
'8675d743a3a578c06b9d41144cb98962',
'cde7c0aa1aba2b25b0c0fc7d79b33dda',
'8a9545c38945add0e8b0a4e644900d6b',
'4197f0271eba69a5a366ce928655cbc1',
'7ae1fdc31f774ebfaae6420c4836e2b7',
'ef9e5c7c0cf808a6d3a24e9d7cba76d3',
'e372e3e6e59f522754366dcd1830c047',
'1076e6b998d868e274a23e006970e654',
'b9a9765258ff843a6c8351363b36a192',
'a5ab1913f6d3e566f794712731e4fdb6',
'7d6c1c595a83dc0683856ed8229695e7',
'32955d1348d52f5082890d688b6ee498',
'ecf6ecb7bfd81a28b77b4a57a16f04f4',
'c68b3c9d5f8fbaa33f13ff3cc8bca503',
'056e96b7a3cc21aa71969a7b3d3af547',
'c0141c754090bd160a9da5971f98216f',
'f2ce0ae8c4992dc7788eb1f409b1a89b',
'f906a85f97df8f0ce0bb62399aba4fae',
'74d5f108656df9f00877aee9c3ecae2e',
'913c727b528f7d7e5719c85ea04c37e0',
'2e0b3ecdd4f284ba5f8ee5d99af72c69',
'619f210ab24f7f9abb54bf75e11eaea6',
'4f1c730a8373243832c1fc957c842258',
'270ad4c8593be9a04d39090be03bebad',
'0b0879fea91c03bb7384c273f22dccd9',
'8fb515a64dedb8ddfc04d3d610bf0b6f',
'132f5f074f3e47dc2d1acfe113c1f176',
'fbe368acf22df756f75ade9b0fbce23e',
'c1e591ac69fee967e1f09f9fba42bcf6',
'194ed7869b8d243de5ed98590756a3c3',
'64a4342df58eed8e8145bc912671469b',
'e7e2e4d7af23dfda6a3d3487b4fb4d07',
'4eae35a4dd3bf80e9b9cc4d67c443c64',
'7810ee1fb309d6a4f0efcf823f451984',
'37808688409649dcc216a7ec05420ac3',
'dd1a5273dd48bf681d66caf487a65795',
'227df80b4a01e65b8974aff7694c5d09',
'87ff9aacfcbe8bb87aa9a453426b93b9',
'90800b2a9406e17e653ccdfdbf5e66d8',
'bbc1a499f0ff044549b64a568acdfd56',
'e5bacc7ae64e53fc31e9169b7169d629',
'082ec9769f19a21474a71908f7534521',
'dc8edbd3e599eda42847e226ca5b2777',
'a25dfeb98fb8ffc1cfc1c1b167ce0e3d',
'bbbe0493e56bd3c101a832de24d2b726',
'64151730e0c2ea28336313e7a15deaae',
'8b1a86ccfc9665417f16b5161a822b80',
'805ba7a8b384cd2f11e12e573299130c',
'900b7d6c2f9666d7375bee0b67250a95',
'707e51d4252f1d4257cab3ec16f3e8a2',
'9f8083d7355e1a331f763da50a4d3f53',
'bda826052312ce297abf2f1f51b3c040',
'8356710cc406e476233cb69c49a24773',
'0744c1d3bee7e83f48b17a689671276c',
'4bc7d8fc8b8e9fb43836d159675280e8',
'911ea4a6122bc22cdc0c9473124162f7',
'5fe5f89a704fd806814e4c8b9e228317',
'2a042ead77bdb20be3571142bee6b4ab',
'68cc4e24144a41f3b9b90392262fd381',
'b7a36ca7446b1af695891668a14a5b43',
'de7b1a6adc0e8133d324c9bb91898d6c',
'bc368995367f9b06a07a6cfbd58acd1a',
'f9666fcbd3edff0a306a384a7a61140b',
'2194eb280090f2377e85957230556c44',
'99757f8c47bd4706b1f7f05fdee87110',
'1c2f6d81e96b4823c34de91c73cfa3b7',
'6b0410c20df66c2c11a70419b0c339c5',
'a093c8b7529ff0fa706e70aa89f1c0f2',
'a61548ba6b8cc17a536989d2c0e9a719',
'fc1490f3ef44fd80cd7045e198a9e0c7',
'7c3bbeda0467e570dddfc47eb036d47c',
'11d2a5abcb2ade26d4772b9266351e11',
'4bae9a25d2390c75ff529334c673e47e',
'e2443f6234a35bc6111836cdbbaa2374',
'3291d98436049fcf353cd2f09c35657b',
'6e9ecf0757221f9f84e9c11fc5f9245d',
'6bb6ffaaac855a88b9fe3411bc0ba99f',
'45fb637b291ad01a6d02afee2adbbdf0',
'3cc9fdeaa204e5b49dffe15bd21051b0',
'd70aacf37e6c3b78ad82cad3c3483a3e',
'48a415c78530a3474e19f4778eba4518',
'0e33bcbef8719905c912e8c99d79b987',
'b36d78cc38cbe406e94bf27d875afef1',
'd5fe52626a4a1441f19359786b56c9b2',
'b829e49b36ccb47b311c02bf3db02d6c',
'12ea4d17838f9a4dc4b79489ee94c0e0',
'cf36e1fbc760befe86753b15d8706dcf',
'6ec7cdf5c417ff1dffc21a59a2f3cf51',
'574cb72d0b1ca456678addfbce5c09c4',
'89624d73b72e65d6c32cfb0f8145cf2e',
'e7d25c676409d229a35843a9e01ef9e4',
'5aadcce2a1a656be9b731e5cb71e75d1',
'1dd3a4f0d5c5617a0e0246b1eca367b4',
'10841d9ae906e1c828020270372344e2',
'1d93d29c88613760e984b0e1db31ad4d',
'd0695e7576d0e3c24cd1ab87696ae05c',
'864b108dbb6d2fb9eff80db88d84bf59',
'd74f8821533062753bae9438e7332332',
'ab55da40271909166cbe54212791bee1',
'6ea8993fc1e9e30af39a48dedf92535b',
'2a139cca00093ede4c97228e27e9fee8',
'4826f9b11ed7b1a75d34f4b4e02f75ae',
'63c33b1e976bef417222f9806d13bfcf',
'876b3347329bf5a1ad0ec9ac2c688087',
'68688e1e1d98bb1d457d39ad794f2866',
'24cee876eb8b8ca68d6bd2ec73a8a663',
'2c952b23a7c5d35ba03940654359587f',
'678620a3b759b0c7664d3789829d2405',
'3ee3d5732048575c224c6317d72ed238',
'081897c3d2c5f72282ccc20adfe6dab5',
'75f97992a868dfa30d1e5a1c4e5e4d4f',
'255e6b4248b406a0666e48004184ad44',
'9ebff2de6eacc53eb5d25d4437056855',
'0a76a6f45f81e13717b0ecec05d8c430',
'0d00855c5d5194d14e79e83fe0704e95',
'8aa8d45e285d2115b1e05a0110a23158',
'c6fe8a2d3bc7344cfa429d6351ea134d',
'd8f5643cebb5475c3673b4b54ea9fdd4',
'e6b0ac1a898933bef3571da46a27aacd',
'68c6b0db1f39d71c9fe345b6f805ba7f',
'2e20a5cda5fe2e1461e6b895c53a3907',
'0739cfe953cfab41c83dbb397b00d5cb',
'b9e1a756dd99ccf6ae38c46fb849e5f8',
'01e75ddcc784e1fbed8fe998d6b85a23',
'3efde7a782f6d7577c5d1be1b83f6940',
'4e5c46f99521cb46a9c7d39b06db9e17',
'7f4740a81c0d98a6169154635565372a',
'12f4b660ea085f0f46e3c9b2f80cad28',
'f320284c2954816a16dac78b54cee043',
'efb8b21230452523b6e033c5ec9f6886',
'0cb0187145f2c11c987c426a8ed161a9',
'c1e68ae00b63de31c62aff7c2d2945b2',
'8aed4472ff8e9cba48d320a3918f8eba',
'ddaaa571bc24d0e811bd23604bdaec04',
'91fdd7bb86bcf43faf4cf491e1a36c86',
'3caeb93ff2bf17cb22d56959821125b9',
'1f3bc5390c395bff349bb2d60ddb95ee',
'3fb29e86d2aa70019dc80e91d2eeb759',
'acdb34b4279f1bcb354911b8bdfa7406',
'7f79d86441e4396d278a61af878ac97b',
'ee4b6d897aea8b63b16c8378ae2423f7',
'd1aa104b2e98313648aabf693bf1a47a',
'a694474ffc97347ce3e850747e33f0cf',
'6513b2b0efdbdf06dce437f809078fad',
'dfee911cac2f56f24b3033ffb5cde9a4',
'1987d60c0b7322f9b184ddd5f3c30f40',
'a01260e9a3a0dfa206b7cbff3df9db05',
'bff82e3291c16f9299656e1c9cf0a5e6',
'e9b520399bc01ad98d1d79ea25239ef5',
'542468b796a79b3c262bdb890c872c0d',
'17aceb7a26a424576e4d802892262351',
'fdc9700ff95c9ab9e0b0dbf81d7bb697',
'5c5cab31627d3865c82f7ef23b4f9c6f',
'0286b61c1521fca26e20890328314e9e',
'dea2070830f8d7c1de7439b2c2c719ce',
'62282fe4a334d6225b27f5ddb84ac1ce',
'5435c5d0e16c2a35f78fe99962106582',
'0ebf15071422fdc55adec0ac19af65c7',
'4f6c09594967131bcb62ee00c5691da5',
'4fe3a65e2e80ffe20b4d4fede546248b',
'3c2947209680d31287c519dacdf8fc7a',
'f3a752916cf26f1c138c4e0ea40dfe3e',
'53eb91454a2ad601c8641843e2af37de',
'cfaf8caaa8a98ca5684c0ade02eeb0d7',
'23e77e94134c0868607a24c001ba4656',
'c00ca186ada9e6f4d8611c1bec2d43ce',
'a816d3084490edab5575ba98eb51e974',
'540d35608c00148a2d7c4b6d1e540e1c',
'2b202e84aab95dfe080f1f6a09e03c69',
'195c5ca274ea18bb9c8a9df66705e378'
]

module SherlockInject

  def self.inject_amount_feb(user_ids)
    user_ids.map{|user_id|
      (0...rand(8..16)).to_a.map{|i|
        SherlockDb::Transfers.new({
          timestamp: "2015-02-01",
          month: "2015-02",
          amount: rand(20..50),
          user_id: user_id,
          transfer_type: "fraud"
        })
      }
    }.flatten
  end

  def self.inject_amount_1(user_id)
    min = 0
    max = 500
    per_month = 12
    per_month_deviation = 10
    injection_amount = 30
    injection_number = 10
    months = (0..18).to_a
    #
    amounts = months.map{|m|
      (0...(per_month + rand(-per_month_deviation..per_month_deviation))).to_a.map{|t|
        rand(min..max)
      }
    }
    # injections!
    amounts[-1] += (0...injection_number).to_a.map{|i|
      injection_amount
    }
    amounts.map.with_index{|m, i|
      month = if i < 12 then '2014-%02d' % (i+1) else '2015-%02d' % (i-11) end
      m.map{|a|
        SherlockDb::Transfers.new({
          timestamp: "2015-0#{i+1}-01",
          month: month,
          amount: a,
          user_id: user_id,
          transfer_type: "fraud"
        })
      }
    }.flatten
  end

end

SherlockInject.inject_amount_feb(ids).map(&:save)

#SherlockDb::Transfers.delete_all
#(1..100).each{|i|
  #user_id = 'user_inject_amount_1_%03d' % i
  #SherlockInject.inject_amount_1(user_id).map(&:save)
#}
#Train::save_all_profiles()
#Train::save_all_distances()
##Graph::save_amount_report