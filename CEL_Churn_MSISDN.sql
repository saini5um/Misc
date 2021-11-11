alter session set current_schema = SIEBEL;
alter session set nls_date_format = 'dd-Mon-YYYY HH24:MI:SS';

select p.name, a.created, a.SERIAL_NUM, a.STATUS_CD, a.STATUS_CHG_DT, a.ROOT_ASSET_ID, a.OWNER_ACCNT_ID, 
a.BILL_ACCNT_ID, a.BILL_PROFILE_ID, p.TYPE
from s_asset a, s_prod_int p
where SERIAL_NUM in ('0123775553',
'0123777588',
'0123786993',
'0123793529',
'0123797693',
'0123798835',
'0123804000',
'0123822392',
'0123827490',
'0123828476',
'0123839373',
'0123843970',
'0123845897',
'0123859299',
'0123874604',
'0123876186',
'0123881446',
'0123890955',
'0123894901',
'0123898904',
'0123901424',
'0123909605',
'0123920189',
'0123924546',
'0123925737',
'0123936381',
'0123943393',
'0123944180',
'0123951037',
'0123972193',
'0123972697',
'0123972745',
'0123975866',
'0123978701',
'0123980438',
'0123989642',
'0123997499',
'0124004831',
'0124010411',
'0124010474',
'0124028135',
'0124050084',
'0124051132',
'0124051249',
'0124077149',
'0124079624',
'0124091192',
'0124099018',
'0124110688',
'0124112522',
'0124112553',
'0124124406',
'0124135114',
'0124141826',
'0124144514',
'0124146332',
'0124174097',
'0124201059',
'0124203613',
'0124206628',
'0124211200',
'0124213938',
'0124216149',
'0124220130',
'0124225870',
'0124230898',
'0124237344',
'0124238860',
'0124244190',
'0124250289',
'0124250983',
'0124256883',
'0124263578',
'0124280355',
'0124281150',
'0124284252',
'0124300566',
'0124309339',
'0124316430',
'0124320252',
'0124326760',
'0124331292',
'0124337030',
'0124352819',
'0124355136',
'0124355791',
'0124363564',
'0124366956',
'0124380426',
'0124382361',
'0124386636',
'0124389919',
'0124422828',
'0124433373',
'0124434845',
'0124439493',
'0124440436',
'0124447533',
'0124464846',
'0124467825',
'0124474998',
'0124478827',
'0124478950',
'0124495625',
'0124499691',
'0124500118',
'0124516842',
'0124532833',
'0124541197',
'0124544964',
'0124555125',
'0124555355',
'0124569371',
'0124571769',
'0124575374',
'0124583864',
'0124585084',
'0124589034',
'0124615394',
'0124616945',
'0124635482',
'0124642553',
'0124649856',
'0124661039',
'0124668028',
'0124669108',
'0124669730',
'0124684684',
'0124686939',
'0124691265',
'0124693279',
'0124697272',
'0124698559',
'0124707371',
'0124708124',
'0124711678',
'0124733923',
'0124738317',
'0124752738',
'0124759086',
'0124765623',
'0124782244',
'0124786551',
'0124788975',
'0124797770',
'0124805333',
'0124820241',
'0124820320',
'0124822148',
'0124825299',
'0124827717',
'0124831304',
'0124834825',
'0124841880',
'0124847269',
'0124867918',
'0124870792',
'0124885422',
'0124886299',
'0124887222',
'0124892804',
'0124893949',
'0124904917',
'0124905927',
'0124906609',
'0124907704',
'0124915901',
'0124928878',
'0124929993',
'0124930676',
'0124946065',
'0124946282',
'0124948810',
'0124951181',
'0124979733',
'0124985102',
'0124991193',
'0124992378',
'0124999734',
'0125020729',
'0125021633',
'0125030598',
'0125046441',
'0125057763',
'0125083735',
'0125089827',
'0125092951',
'0125097592',
'0125108179',
'0125122388',
'0125129105',
'0125129483',
'0125133655',
'0125137400',
'0125140622',
'0125153471',
'0125159102',
'0125172432',
'0125188841',
'0125191881',
'0125195260',
'0125196768',
'0125202445',
'0125215075',
'0125222156',
'0125227016',
'0125230448',
'0125237288',
'0125255009',
'0125272612',
'0125273630',
'0125274831',
'0125276213',
'0125289888',
'0125294970',
'0125312175',
'0125317732',
'0125328908',
'0125341611',
'0125343276',
'0125347078',
'0125359242',
'0125364832',
'0125377939',
'0125385555',
'0125391992',
'0125393922',
'0125397172',
'0125398668',
'0125400414',
'0125419401',
'0125423623',
'0125433576',
'0125444318',
'0125444569',
'0125445033',
'0125450263',
'0125455415',
'0125462011',
'0125463682',
'0125468902',
'0125481605',
'0125488028',
'0125506142',
'0125508884',
'0125524431',
'0125531070',
'0125531309',
'0125551232',
'0125554705',
'0125564685',
'0125566570',
'0125566857',
'0125569839',
'0125599360',
'0125611291',
'0125613883',
'0125623439',
'0125624120',
'0125630034',
'0125656514',
'0125657825',
'0125671988',
'0125685716',
'0125689434',
'0125704296',
'0125721074',
'0125730352',
'0125732477',
'0125759590',
'0125760240',
'0125762044',
'0125770071',
'0125770332',
'0125772516',
'0125773515',
'0125774000',
'0125776479',
'0125796675',
'0125797346',
'0125805972',
'0125807028',
'0125811155',
'0125813957',
'0125827379',
'0125828355',
'0125859782',
'0125866196',
'0125886990',
'0125898865',
'0125901012',
'0125915558',
'0125923825',
'0125926043',
'0125927187',
'0125947070',
'0125948085',
'0125949331',
'0125954371',
'0125976923',
'0125994844',
'0125999008',
'0126020179',
'0126020752',
'0126024612',
'0126029566',
'0126042190',
'0126046348',
'0126049809',
'0126050522',
'0126050772',
'0126055688',
'0126057231',
'0126063765',
'0126065780',
'0126067309',
'0126067770',
'0126070301',
'0126074515',
'0126075750',
'0126080200',
'0126092168',
'0126095831',
'0126107012',
'0126128058',
'0126128321',
'0126128564',
'0126131897',
'0126134375',
'0126136503',
'0126148585',
'0126158544',
'0126159771',
'0126167247',
'0126185884',
'0126186418',
'0126198916',
'0126205260',
'0126206513',
'0126226179',
'0126226338',
'0126228318',
'0126231608',
'0126241853',
'0126245282',
'0126255059',
'0126260049',
'0126275005',
'0126282551',
'0126286968',
'0126292892',
'0126301264',
'0126305566',
'0126315224',
'0126320656',
'0126320904',
'0126327845',
'0126329291',
'0126338223',
'0126355533',
'0126364165',
'0126367506',
'0126372797',
'0126392094',
'0126394565',
'0126397768',
'0126407396',
'0126411260',
'0126415530',
'0126418277',
'0126425550',
'0126426194',
'0126430828',
'0126436237',
'0126436643',
'0126461322',
'0126461472',
'0126464124',
'0126467773',
'0126474590',
'0126485547',
'0126486465',
'0126488430',
'0126499677',
'0126506117',
'0126507530',
'0126517290',
'0126523132',
'0126541854',
'0126542406',
'0126552505',
'0126553590',
'0126553937',
'0126564002',
'0126565017',
'0126565386',
'0126567088',
'0126571906',
'0126576652',
'0126577935',
'0126580233',
'0126585805',
'0126598181',
'0126598277',
'0126599306',
'0126600202',
'0126604552',
'0126608564',
'0126610948',
'0126612342',
'0126615846',
'0126623334',
'0126624146',
'0126627062',
'0126628924',
'0126630080',
'0126634496',
'0126641773',
'0126647466',
'0126654375',
'0126655095',
'0126655840',
'0126658362',
'0126658921',
'0126670899',
'0126682475',
'0126689943',
'0126691750',
'0126697361',
'0126698371',
'0126699231',
'0126705449',
'0126718420',
'0126721584',
'0126724167',
'0126728648',
'0126732369',
'0126733050',
'0126744244',
'0126758576',
'0126760888',
'0126772756',
'0126775313',
'0126779061',
'0126782589',
'0126782705',
'0126797081',
'0126803088',
'0126816086',
'0126837771',
'0126845878',
'0126847573',
'0126852505',
'0126857006',
'0126858625',
'0126861730',
'0126864460',
'0126867268',
'0126869826',
'0126891644',
'0126905009',
'0126908307',
'0126908879',
'0126910086',
'0126919463',
'0126922264',
'0126930989',
'0126941701',
'0126942494',
'0126946231',
'0126946945',
'0126951445',
'0126960199',
'0126961107',
'0126961234',
'0126964002',
'0126969224',
'0126974881',
'0126979614',
'0126982834',
'0126984272',
'0126995970',
'0126998823',
'0127003680',
'0127010354',
'0127010648',
'0127010650',
'0127017665',
'0127025595',
'0127028774',
'0127040029',
'0127067337',
'0127089785',
'0127098688',
'0127099789',
'0127103194',
'0127103283',
'0127112577',
'0127116466',
'0127118243',
'0127126770',
'0127130367',
'0127135513',
'0127141321',
'0127142363',
'0127146490',
'0127151716',
'0127154506',
'0127163634',
'0127173325',
'0127181190',
'0127211494',
'0127213532',
'0127226394',
'0127243794',
'0127247226',
'0127250986',
'0127257711',
'0127262626',
'0127263481',
'0127275484',
'0127310010',
'0127321254',
'0127323004',
'0127334696',
'0127335778',
'0127336378',
'0127382545',
'0127403765',
'0127406420',
'0127458482',
'0127484792',
'0127484832',
'0127506255',
'0127514000',
'0127517834',
'0127531235',
'0127531688',
'0127533268',
'0127543120',
'0127548866',
'0127553609',
'0127558116',
'0127571074',
'0127577611',
'0127581858',
'0127593567',
'0127595828',
'0127601488',
'0127629208',
'0127636266',
'0127646030',
'0127654819',
'0127689952',
'0127693201',
'0127694711',
'0127703468',
'0127707793',
'0127716679',
'0127724241',
'0127726674',
'0127727820',
'0127728865',
'0127735793',
'0127738122',
'0127757585',
'0127760304',
'0127770833',
'0127778218',
'0127788676',
'0127799838',
'0127800299',
'0127806266',
'0127809753',
'0127812390',
'0127816293',
'0127823575',
'0127826522',
'0127842482',
'0127862436',
'0127883217',
'0127890808',
'0127891645',
'0127892144',
'0127905040',
'0127916400',
'0127926448',
'0127941108',
'0127952097',
'0127969347',
'0127973718',
'0127974894',
'0128019001',
'0128020261',
'0128028234',
'0128029150',
'0128040495',
'0128046874',
'0128055370',
'0128061015',
'0128090012',
'0128107678',
'0128115296',
'0128133844',
'0128181418',
'0128252206',
'0128296896',
'0128331699',
'0128333002',
'0128340709',
'0128372728',
'0128442647',
'0128465929',
'0128557799',
'0128561922',
'0128593858',
'0128625023',
'0128640087',
'0128662423',
'0128668388',
'0128703502',
'0128705400',
'0128708171',
'0128727377',
'0128741426',
'0128782354',
'0128789345',
'0128801850',
'0128811082',
'0128818658',
'0128818886',
'0128822559',
'0128825516',
'0128825844',
'0128831942',
'0128854429',
'0128858559',
'0128862004',
'0128882140',
'0128889281',
'0128896068',
'0128896091',
'0128999286',
'0129025338',
'0129040903',
'0129041235',
'0129041563',
'0129041892',
'0129045063',
'0129057648',
'0129097459',
'0129109252',
'0129118322',
'0129121024',
'0129125882',
'0129161865',
'0129164905',
'0129171227',
'0129175700',
'0129198758',
'0129202534',
'0129206869',
'0129208459',
'0129209013',
'0129209975',
'0129212562',
'0129222979',
'0129247899',
'0129249294',
'0129254537',
'0129282503',
'0129282708',
'0129286870',
'0129288102',
'0129289060',
'0129319074',
'0129343771',
'0129345030',
'0129351000',
'0129363474',
'0129366808',
'0129374149',
'0129377579',
'0129379543',
'0129390687',
'0129412739',
'0129420730',
'0129445052',
'0129445550',
'0129456943',
'0129471082',
'0129471096',
'0129481410',
'0129495655',
'0129504615',
'0129507978',
'0129522471',
'0129549118',
'0129566026',
'0129603922',
'0129606368',
'0129610837',
'0129612202',
'0129612442',
'0129616467',
'0129627627',
'0129637700',
'0129659359',
'0129682277',
'0129695537',
'0129708970',
'0129741376',
'0129753739',
'0129767439',
'0129777236',
'0129791263',
'0129797393',
'0129800387',
'0129818723',
'0129832516',
'0129832681',
'0129836670',
'0129860991',
'0129862112',
'0129865211',
'0129876022',
'0129876195',
'0129897626',
'0129899039',
'0129899080',
'0129992288',
'0129998634',
'0132004759',
'0132006140',
'0132007457',
'0132007726',
'0132010102',
'0132010330',
'0132012199',
'0132012418',
'0132012687',
'0132014996',
'0132016040',
'0132016468',
'0132018290',
'0132024989',
'0132027033',
'0132029376',
'0132029692',
'0132032300',
'0132034088',
'0132034692',
'0132035673',
'0132042023',
'0132042428',
'0132044335',
'0132046543',
'0132052816',
'0132054322',
'0132060805',
'0132061026',
'0132061059',
'0132062447',
'0132062680',
'0132063107',
'0132064288',
'0132066738',
'0132066884',
'0132067233',
'0132069352',
'0132069587',
'0132070895',
'0132077060',
'0132077096',
'0132077570',
'0132077844',
'0132078334',
'0132078423',
'0132080393',
'0132080684',
'0132082325',
'0132082356',
'0132083410',
'0132084483',
'0132085529',
'0132088300',
'0132088594',
'0132089262',
'0132089644',
'0132090901',
'0132091709',
'0132093060',
'0132094874',
'0132095300',
'0132095672',
'0132098060',
'0132098287',
'0132098875',
'0132099804',
'0132101966',
'0132102171',
'0132102676',
'0132103060',
'0132105116',
'0132107415',
'0132108063',
'0132112293',
'0132114915',
'0132116961',
'0132118019',
'0132119132',
'0132120074',
'0132121809',
'0132123001',
'0132123290',
'0132126207',
'0132132982',
'0132151600',
'0132169111',
'0132169605',
'0132180812',
'0132192317',
'0132195226',
'0132200772',
'0132200916',
'0132202230',
'0132212954',
'0132213995',
'0132214413',
'0132220229',
'0132222214',
'0132222298',
'0132222617',
'0132225760',
'0132226702',
'0132227323',
'0132229122',
'0132236256',
'0132236555',
'0132240102',
'0132242417',
'0132248564',
'0132253235',
'0132255135',
'0132255652',
'0132267022',
'0132271981',
'0132272051',
'0132273251',
'0132277012',
'0132278636',
'0132282250',
'0132282566',
'0132283867',
'0132285367',
'0132286081',
'0132291781',
'0132296996',
'0132299094',
'0132299150',
'0132299757',
'0132299873',
'0132305930',
'0132311112',
'0132312114',
'0132312644',
'0132313426',
'0132315110',
'0132321879',
'0132322920',
'0132323111',
'0132323840',
'0132324465',
'0132328048',
'0132330533',
'0132332889',
'0132333473',
'0132336326',
'0132338000',
'0132339903',
'0132345992',
'0132346113',
'0132349809',
'0132354162',
'0132354658',
'0132355134',
'0132357431',
'0132357713',
'0132360055',
'0132362529',
'0132363373',
'0132365981',
'0132375665',
'0132380943',
'0132381340',
'0132386007',
'0132387005',
'0132391538',
'0132393383',
'0132397929',
'0132402040',
'0132402063',
'0132403248',
'0132405045',
'0132405797',
'0132405931',
'0132406024',
'0132406337',
'0132408182',
'0132408340',
'0132410910',
'0132414545',
'0132419495',
'0132421848',
'0132430915',
'0132432286',
'0132433000',
'0132435001',
'0132441697',
'0132442988',
'0132449412',
'0132450811',
'0132451122',
'0132455459',
'0132458389',
'0132459922',
'0132461736',
'0132462247',
'0132469668',
'0132480145',
'0132480431',
'0132482992',
'0132484175',
'0132485466',
'0132492347',
'0132492620',
'0132495214',
'0132503359',
'0132503477',
'0132503774',
'0132506304',
'0132506588',
'0132506761',
'0132510586',
'0132512257',
'0132512525',
'0132518377',
'0132521211',
'0132521912',
'0132525590',
'0132525807',
'0132541564',
'0132542586',
'0132546755',
'0132547314',
'0132548322',
'0132550121',
'0132550557',
'0132553612',
'0132554525',
'0132556767',
'0132557284',
'0132558029',
'0132559561',
'0132560934',
'0132564093',
'0132566751',
'0132570694',
'0132574258',
'0132578945',
'0132582183',
'0132584560',
'0132585398',
'0132588855',
'0132591269',
'0132592800',
'0132596065',
'0132596569',
'0132597259',
'0132598266',
'0132604592',
'0132605378',
'0132609098',
'0132612828',
'0132620701',
'0132624243',
'0132627798',
'0132632832',
'0132633344',
'0132635587')
and a.STATUS_CD = 'Active'
and a.PROD_ID = p.row_id
and p.type = 'Service'
and p.name not like '%Wi%'
order by serial_num;
