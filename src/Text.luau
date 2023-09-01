local LOREM_IPSUM =
	"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et sollicitudin ac orci phasellus. Eleifend donec pretium vulputate sapien nec sagittis aliquam malesuada. Mi ipsum faucibus vitae aliquet. Vestibulum sed arcu non odio euismod lacinia. Risus quis varius quam quisque id. Non arcu risus quis varius. Nullam vehicula ipsum a arcu cursus vitae. Parturient montes nascetur ridiculus mus. Semper risus in hendrerit gravida. Dignissim enim sit amet venenatis urna cursus eget nunc scelerisque. Est velit egestas dui id ornare arcu odio. Diam quam nulla porttitor massa. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Eget velit aliquet sagittis id consectetur."
local LOREM_IPSUM_SENTENCES = LOREM_IPSUM:split(". ")

--- @class Text
local Text = {}

--- @param sentenceCount? number -- The amount of sentences in the Lorem ipsum
--- @return string
--- Gets a segment of Lorem ipsum.
function Text.getLoremIpsum(sentenceCount: number?): string
	sentenceCount = sentenceCount or 1

	if sentenceCount > #LOREM_IPSUM_SENTENCES then
		error(`sentenceCount cannot be higher than {#LOREM_IPSUM_SENTENCES}`)
	elseif sentenceCount < 0 then
		error("sentenceCount cannot be lower than 0")
	end

	local sentences: { string } = {}

	for i = 1, sentenceCount :: number do
		table.insert(sentences, LOREM_IPSUM_SENTENCES[i])
	end

	return table.concat(sentences, ". ") .. "."
end

return Text
