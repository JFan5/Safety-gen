; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2089990452 --problem-name spanner-s4-n3-l4-s2089990452
(define (problem spanner-s4-n3-l4-s2089990452)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_01 obj_13 obj_05 obj_09 - type_3
     obj_14 obj_02 obj_03 - type_1
     obj_07 obj_10 obj_12 obj_11 - type_4
     obj_06 obj_08 - type_4
    )
 (:init 
    (pred_6 obj_04 obj_06)
    (pred_6 obj_01 obj_07)
    (pred_4 obj_01)
    (pred_6 obj_13 obj_11)
    (pred_4 obj_13)
    (pred_6 obj_05 obj_07)
    (pred_4 obj_05)
    (pred_6 obj_09 obj_12)
    (pred_4 obj_09)
    (pred_1 obj_14)
    (pred_6 obj_14 obj_08)
    (pred_1 obj_02)
    (pred_6 obj_02 obj_08)
    (pred_1 obj_03)
    (pred_6 obj_03 obj_08)
    (pred_5 obj_06 obj_07)
    (pred_5 obj_11 obj_08)
    (pred_5 obj_07 obj_10)
    (pred_5 obj_10 obj_12)
    (pred_5 obj_12 obj_11)
)
 (:goal
  (and
   (pred_3 obj_14)
   (pred_3 obj_02)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_14)) (not (pred_3 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
