books = [9780007117307,9780007382161,9780060850524,9780061120084,9780061122415,9780062068422,	
9780062073488,	
9780062073556,	
9780062073587,	
9780062073617,	
9780062073693,	
9780062073778,	
9780062693662,	
9780064471046,	
9780099546776,	
9780099546790,	
9780123456789,	
9780140233773,	
9780140439120,	
9780140440119,	
9780140440393,	
9780141439518,	
9780199291151,	
9780199672776,	
9780224094153,	
9780226458083,	
9780307269751,	
9780307948687,	
9780307960474,	
9780307960498,	
9780312367541,	
9780316769488,	
9780345409461,	
9780345807090,	
9780345807151,	
9780374332662,	
9780375708114,	
9780375869020,	
9780385495318,	
9780385504201,	
9780399563126,	
9780435123653,	
9780439023481,	
9780440418320,	
9780451524935,	
9780451526342,	
9780486278070,	
9780521004794,	
9780525432322,	
9780525432483,	
9780525478812,	
9780544336261,	
9780547928227,	
9780553380163,	
9780571207045,	
9780571229214,	
9780571321708,	
9780571321715,	
9780590406712,	
9780684169964,	
9780684803355,	
9780684825546,	
9780684834951,	
9780684841263,	
9780743273565,	
9780747532743,	
9780753820254,	
9780786838653,	
9781234567890,	
9781250062185,	
9781408855652,	
9781416561111,	
9781423106977,	
9781451697728,	
9781480437678,	
9781577316493,	
9781609450786,	
9781771642484,	
9781771643016,	
9781781855869,	
9781844675639,	
9781846689953,	
9781849048134,	
9781904955768,	
9781933372600,	
9782070360024,	
9782070360420,	
9782070361878,	
9782070401834,	
9782070409274,	
9782070612758,	
9782253002381,	
9782253004224,	
9782345678901,	
9783456789012,	
9784567890123,	
9785678901234,	
9786789012345,	
9787890123456,	
9788901234567,	
9789012345678,	
9789600415584,	
9789600419247,	
9789600432437,	
9789600432895,	
9789601425009,	
9789601660105,	
9789601662741,	
9789601663069,	
9789603103397,	
9789603991473,	
9789603995044,	
9789604062389,	
9789604587546]
images =[]

f = open('inserts.txt', 'w')
for i in range(0, len(books)):
    query = ('UPDATE books SET filepath=%s WHERE ISBN=%s', images[i], books[i])
    f.write(query)
    f.write('\n')
    