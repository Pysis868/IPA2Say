#!/usr/bin/ruby -w

map =   {       'æ' => 'AE',
                'eɪ' => 'EY',
                'ɑ' => 'AO',
                'əˈ' => 'AX',
                'i' => 'IY',
                'ɛ' => 'EH',
                'ɪ' => 'IH',
                'aɪ' => 'AY',
                'ɪ' => 'IX',
                'ɑ' => 'AA',
                'u' => 'UW',
                'ʊ' => 'UH',
                'ʌ' => 'UX',
                'oʊ' => 'OW',
                'aʊ' => 'AW',
                'ɔɪ' => 'OY',
                'b' => 'b',
                'ʧ' => 'C',
                'd' => 'd',
                'ð' => 'D',
                'f' => 'f',
                'g' => 'g',
                'h' => 'h',
                'ʤ' => 'J',
                'k' => 'k',
                'l' => 'l',
                'm' => 'm',
                'n' => 'n',
                'ŋ' => 'N',
                'p' => 'p',
                'r' => 'r',
                's' => 's',
                'ʃ' => 'S',
                't' => 't',
                'θ' => 'T',
                'v' => 'v',
                'w' => 'w',
                'j' => 'y',
                'z' => 'z',
                'ʒ' => 'Z',
                'ɜ' => '',
                ' ' => ' ',
                'ˈ' => ''
        }

text = ARGF.read

substring = ''

text.split("").each do |c|

    substring << c

    if substring.length == 2
        if map.has_key? substring
            print map[ substring ]
        else
            front = substring[0]
            if map.has_key? front
                print map[ front ]
            end
            back = substring[1]
            if map.has_key? back
                print map[ back ]
            end
        end

        substring = ''
    end
end
