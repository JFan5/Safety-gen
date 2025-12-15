; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1710045517 --problem-name spanner-s4-n3-l4-s1710045517
(define (problem spanner-s4-n3-l4-s1710045517)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_05 obj_01 obj_13 obj_12 - type_5
     obj_06 obj_08 obj_11 - type_1
     obj_03 obj_04 obj_09 obj_14 - type_3
     obj_07 obj_10 - type_3
    )
 (:init 
    (pred_3 obj_02 obj_07)
    (pred_3 obj_05 obj_03)
    (pred_1 obj_05)
    (pred_3 obj_01 obj_14)
    (pred_1 obj_01)
    (pred_3 obj_13 obj_04)
    (pred_1 obj_13)
    (pred_3 obj_12 obj_03)
    (pred_1 obj_12)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_10)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_10)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_10)
    (pred_4 obj_07 obj_03)
    (pred_4 obj_14 obj_10)
    (pred_4 obj_03 obj_04)
    (pred_4 obj_04 obj_09)
    (pred_4 obj_09 obj_14)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_08)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
