(B (name dog_is_animal) (=> (dog x) (animal x) :hypernym))
(B (name cat_is_animal) (=> (cat x) (animal x) :hypernym))
(B (name human_is_animal) (=> (human x) (animal x) :hypernym))
(B (name dog_bark) (=> (dog x) (^ (bark e) (agt e x)) :preference))
(B (name dog_has_tail) (=> (dog x) (^ (have e) (tail y) (agt e x) (obj e y)) :presuppose))
(B (name cat_has_tail) (=> (cat x) (^ (have e) (tail y) (agt e x) (obj e y)) :presuppose))

(B (name xor_cat_dog) (xor (cat x) (dog x)))
(B (name xor_human_cat) (xor (cat x) (human x)))
(B (name xor_human_dog) (xor (human x) (dog x)))