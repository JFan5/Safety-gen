; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1244580564 --problem-name spanner-s4-n3-l4-s1244580564
(define (problem spanner-s4-n3-l4-s1244580564)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_10 obj_02 obj_05 obj_14 - type_2
     obj_12 obj_06 obj_07 - type_3
     obj_01 obj_04 obj_09 obj_13 - type_5
     obj_11 obj_03 - type_5
    )
 (:init 
    (pred_3 obj_08 obj_11)
    (pred_3 obj_10 obj_01)
    (pred_4 obj_10)
    (pred_3 obj_02 obj_13)
    (pred_4 obj_02)
    (pred_3 obj_05 obj_01)
    (pred_4 obj_05)
    (pred_3 obj_14 obj_01)
    (pred_4 obj_14)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_03)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_03)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_03)
    (pred_6 obj_11 obj_01)
    (pred_6 obj_13 obj_03)
    (pred_6 obj_01 obj_04)
    (pred_6 obj_04 obj_09)
    (pred_6 obj_09 obj_13)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_06)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_12)) (not (pred_2 obj_06))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
