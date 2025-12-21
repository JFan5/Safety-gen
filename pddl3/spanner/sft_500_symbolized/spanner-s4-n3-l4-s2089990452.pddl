; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2089990452 --problem-name spanner-s4-n3-l4-s2089990452
(define (problem spanner-s4-n3-l4-s2089990452)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_01 obj_10 obj_09 obj_04 - type_5
     obj_05 obj_13 obj_02 - type_4
     obj_07 obj_12 obj_03 obj_14 - type_2
     obj_06 obj_08 - type_2
    )
 (:init 
    (pred_2 obj_11 obj_06)
    (pred_2 obj_01 obj_07)
    (pred_1 obj_01)
    (pred_2 obj_10 obj_14)
    (pred_1 obj_10)
    (pred_2 obj_09 obj_07)
    (pred_1 obj_09)
    (pred_2 obj_04 obj_03)
    (pred_1 obj_04)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_08)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_08)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_08)
    (pred_6 obj_06 obj_07)
    (pred_6 obj_14 obj_08)
    (pred_6 obj_07 obj_12)
    (pred_6 obj_12 obj_03)
    (pred_6 obj_03 obj_14)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_13)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_13))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
