; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1426812124 --problem-name spanner-s4-n3-l4-s1426812124
(define (problem spanner-s4-n3-l4-s1426812124)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_11 obj_01 obj_14 obj_10 - type_1
     obj_13 obj_04 obj_05 - type_2
     obj_08 obj_07 obj_03 obj_06 - type_4
     obj_09 obj_02 - type_4
    )
 (:init 
    (pred_1 obj_12 obj_09)
    (pred_1 obj_11 obj_08)
    (pred_3 obj_11)
    (pred_1 obj_01 obj_07)
    (pred_3 obj_01)
    (pred_1 obj_14 obj_08)
    (pred_3 obj_14)
    (pred_1 obj_10 obj_03)
    (pred_3 obj_10)
    (pred_5 obj_13)
    (pred_1 obj_13 obj_02)
    (pred_5 obj_04)
    (pred_1 obj_04 obj_02)
    (pred_5 obj_05)
    (pred_1 obj_05 obj_02)
    (pred_2 obj_09 obj_08)
    (pred_2 obj_06 obj_02)
    (pred_2 obj_08 obj_07)
    (pred_2 obj_07 obj_03)
    (pred_2 obj_03 obj_06)
)
 (:goal
  (and
   (pred_4 obj_13)
   (pred_4 obj_04)
   (pred_4 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_13)) (not (pred_4 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
