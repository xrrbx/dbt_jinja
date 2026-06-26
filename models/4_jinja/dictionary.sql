-- curly braces to ignore
{

{% set renzos_dictionary = {
    'word' : 'data',
    'part_of_speech' : 'noun',
    'definition' : 'the building block of life'
    } %}

{{ renzos_dictionary['word']}} is a {{ renzos_dictionary['part_of_speech']}} that means {{ renzos_dictionary['definition']}}

}