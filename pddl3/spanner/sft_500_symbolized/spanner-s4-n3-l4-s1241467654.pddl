; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1241467654 --problem-name spanner-s4-n3-l4-s1241467654
(define (problem spanner-s4-n3-l4-s1241467654)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_14 obj_12 obj_13 obj_04 - type_4
     obj_02 obj_08 obj_05 - type_2
     obj_11 obj_07 obj_09 obj_10 - type_1
     obj_01 obj_03 - type_1
    )
 (:init 
    (pred_3 obj_06 obj_01)
    (pred_3 obj_14 obj_11)
    (pred_2 obj_14)
    (pred_3 obj_12 obj_09)
    (pred_2 obj_12)
    (pred_3 obj_13 obj_09)
    (pred_2 obj_13)
    (pred_3 obj_04 obj_07)
    (pred_2 obj_04)
    (pred_4 obj_02)
    (pred_3 obj_02 obj_03)
    (pred_4 obj_08)
    (pred_3 obj_08 obj_03)
    (pred_4 obj_05)
    (pred_3 obj_05 obj_03)
    (pred_1 obj_01 obj_11)
    (pred_1 obj_10 obj_03)
    (pred_1 obj_11 obj_07)
    (pred_1 obj_07 obj_09)
    (pred_1 obj_09 obj_10)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_08)
   (pred_5 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
