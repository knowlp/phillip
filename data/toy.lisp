; KNOWLEDGE BASE
(B (name killing_is_criminal)
   (=> (^ (kill-vb *e1) (nsubj *e1 x))
       (^ (criminal-jj *e2) (nsubj *e2 x))))
(B (name criminal_is_arrested)
   (=> (^ (criminal-jj *e1) (nsubj *e1 x))
       (^ (arrest-vb *e2) (dobj *e2 x))))

(B (unipp (nsubj * .)))
(B (unipp (dobj * .)))

(B (xor (nsubj e x) (dobj e x)))

; OBSERVATIONS
(O (name toy)
   (^ (john-nn X) (tom-nn Y)
      (kill-vb E1) (nsubj E1 X) (dobj E1 Y)
      (arrest-vb E2) (dobj E2 X)))