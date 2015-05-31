INSERT INTO game(title, release_year, developers, publishers, boxart_front, boxart_spine)
SELECT 
    'Leisure Suit Larry in the Land of the Lounge Lizards',
    '1987',
    'Sierra On-Line',
    'Sierra On-Line',
    'lsl1_front.jpg',
    'lsl1_spine.jpg'
WHERE
    NOT EXISTS (
        SELECT id FROM game WHERE title = 'Leisure Suit Larry in the Land of the Lounge Lizards'
    );

INSERT INTO game(title, release_year, developers, publishers, boxart_front, boxart_spine)
SELECT 
    'Leisure Suit Larry Goes Looking for Love (in Several Wrong Places)',
    '1988',
    'Sierra On-Line',
    'Sierra On-Line',
    'lsl2_front.jpg',
    'lsl2_spine.jpg'
WHERE
    NOT EXISTS (
        SELECT id FROM game WHERE title = 'Leisure Suit Larry Goes Looking for Love (in Several Wrong Places)'
    );

INSERT INTO game(title, release_year, developers, publishers, boxart_front, boxart_spine)
SELECT  
    'Maniac Mansion',
    '1987',
    'Lucasfilm Games',
    'Lucasfilm Games',
    'mm_front.jpg',
    'mm_spine.jpg'
WHERE
    NOT EXISTS (
        SELECT id FROM game WHERE title = 'Maniac Mansion'
    );