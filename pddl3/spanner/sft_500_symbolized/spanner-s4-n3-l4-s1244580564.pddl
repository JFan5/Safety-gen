; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1244580564 --problem-name spanner-s4-n3-l4-s1244580564
(define (problem spanner-s4-n3-l4-s1244580564)
 (:domain spanner)
 (:objects 
     obj_13 - type_4
     obj_05 obj_03 obj_01 obj_04 - type_5
     obj_12 obj_06 obj_14 - type_3
     obj_02 obj_11 obj_08 obj_07 - type_2
     obj_10 obj_09 - type_2
    )
 (:init 
    (pred_2 obj_13 obj_10)
    (pred_2 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_2 obj_03 obj_07)
    (pred_1 obj_03)
    (pred_2 obj_01 obj_02)
    (pred_1 obj_01)
    (pred_2 obj_04 obj_02)
    (pred_1 obj_04)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_09)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_09)
    (pred_5 obj_14)
    (pred_2 obj_14 obj_09)
    (pred_4 obj_10 obj_02)
    (pred_4 obj_07 obj_09)
    (pred_4 obj_02 obj_11)
    (pred_4 obj_11 obj_08)
    (pred_4 obj_08 obj_07)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_06)
   (pred_6 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
