#!/usr/bin/ruby -w

map =   {       'æ' => 'AE',  #Example: b[a]t
                'eɪ' => 'EY', #Example: b[ai]t
                'ɑ' => 'AO',  #Example: c[au]ght
                'əˈ' => 'AX', #Example: [a]bout
                'i' => 'IY',  #Example: b[ee]t
                'ɛ' => 'EH',  #Example: b[e]t
                'ɪ' => 'IH',  #Example: b[i]t
                'aɪ' => 'AY', #Example: b[i]te
                'ɪ' => 'IX',  #Example: ros[e]
                'ɑ' => 'AA',  #Example: f[a]ther
                'u' => 'UW',  #Example: b[oo]t
                'ʊ' => 'UH',  #Example: b[oo]k
                'ʌ' => 'UX',  #Example: b[u]d
                'oʊ' => 'OW', #Example: b[oa]t
                'aʊ' => 'AW', #Example: b[ou]t
                'ɔɪ' => 'OY', #Example: b[o]y
                'b' => 'b',   #Example: [b]in
                'ʧ' => 'C',   #Example: [ch]in
                'd' => 'd',   #Example: [d]in
                'ð' => 'D',   #Example: [th]em
                'f' => 'f',   #Example: [f]in
                'g' => 'g',   #Example: [g]ain
                'h' => 'h',   #Example: [h]at
                'ʤ' => 'J',   #Example: [j]ump
                'k' => 'k',   #Example: [k]in
                'l' => 'l',   #Example: [l]imb
                'm' => 'm',   #Example: [m]at
                'n' => 'n',   #Example: [n]ap
                'ŋ' => 'N',   #Example: ta[ng]
                'p' => 'p',   #Example: [p]in
                'r' => 'r',   #Example: [r]an
                's' => 's',   #Example: [s]in
                'ʃ' => 'S',   #Example: [sh]in
                't' => 't',   #Example: [t]in
                'θ' => 'T',   #Example: [th]in
                'v' => 'v',   #Example: [v]an
                'w' => 'w',   #Example: [w]et
                'j' => 'y',   #Example: [y]et
                'z' => 'z',   #Example: [z]oo
                'ʒ' => 'Z',   #Example: mea[s]ure
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
