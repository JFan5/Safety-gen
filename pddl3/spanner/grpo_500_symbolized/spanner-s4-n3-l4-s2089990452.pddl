; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2089990452 --problem-name spanner-s4-n3-l4-s2089990452
(define (problem spanner-s4-n3-l4-s2089990452)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_08 obj_03 obj_10 obj_14 - type_3
     obj_04 obj_02 obj_09 - type_1
     obj_06 obj_01 obj_05 obj_12 - type_2
     obj_07 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_13 obj_07)
    (pred_6 obj_08 obj_06)
    (pred_5 obj_08)
    (pred_6 obj_03 obj_12)
    (pred_5 obj_03)
    (pred_6 obj_10 obj_06)
    (pred_5 obj_10)
    (pred_6 obj_14 obj_05)
    (pred_5 obj_14)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_11)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_11)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_11)
    (pred_3 obj_07 obj_06)
    (pred_3 obj_12 obj_11)
    (pred_3 obj_06 obj_01)
    (pred_3 obj_01 obj_05)
    (pred_3 obj_05 obj_12)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_02)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
