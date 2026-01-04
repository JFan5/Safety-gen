; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 554989795 --problem-name spanner-s4-n3-l4-s554989795
(define (problem spanner-s4-n3-l4-s554989795)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_07 obj_13 obj_12 obj_11 - type_3
     obj_14 obj_02 obj_04 - type_1
     obj_10 obj_08 obj_05 obj_03 - type_2
     obj_09 obj_06 - type_2
    )
 (:init 
    (pred_6 obj_01 obj_09)
    (pred_6 obj_07 obj_08)
    (pred_5 obj_07)
    (pred_6 obj_13 obj_03)
    (pred_5 obj_13)
    (pred_6 obj_12 obj_08)
    (pred_5 obj_12)
    (pred_6 obj_11 obj_10)
    (pred_5 obj_11)
    (pred_4 obj_14)
    (pred_6 obj_14 obj_06)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_06)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_06)
    (pred_2 obj_09 obj_10)
    (pred_2 obj_03 obj_06)
    (pred_2 obj_10 obj_08)
    (pred_2 obj_08 obj_05)
    (pred_2 obj_05 obj_03)
)
 (:goal
  (and
   (pred_3 obj_14)
   (pred_3 obj_02)
   (pred_3 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_14)) (not (pred_3 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_09)))
  )
)
)
