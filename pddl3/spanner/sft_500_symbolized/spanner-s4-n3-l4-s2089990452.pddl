; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2089990452 --problem-name spanner-s4-n3-l4-s2089990452
(define (problem spanner-s4-n3-l4-s2089990452)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_09 obj_04 obj_11 obj_06 - type_2
     obj_10 obj_01 obj_07 - type_1
     obj_14 obj_08 obj_05 obj_12 - type_5
     obj_03 obj_13 - type_5
    )
 (:init 
    (pred_3 obj_02 obj_03)
    (pred_3 obj_09 obj_14)
    (pred_2 obj_09)
    (pred_3 obj_04 obj_12)
    (pred_2 obj_04)
    (pred_3 obj_11 obj_14)
    (pred_2 obj_11)
    (pred_3 obj_06 obj_05)
    (pred_2 obj_06)
    (pred_4 obj_10)
    (pred_3 obj_10 obj_13)
    (pred_4 obj_01)
    (pred_3 obj_01 obj_13)
    (pred_4 obj_07)
    (pred_3 obj_07 obj_13)
    (pred_5 obj_03 obj_14)
    (pred_5 obj_12 obj_13)
    (pred_5 obj_14 obj_08)
    (pred_5 obj_08 obj_05)
    (pred_5 obj_05 obj_12)
)
 (:goal
  (and
   (pred_6 obj_10)
   (pred_6 obj_01)
   (pred_6 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_10)) (not (pred_6 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
