; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1252678125 --problem-name spanner-s2-n2-l3-s1252678125
(define (problem spanner-s2-n2-l3-s1252678125)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_10 obj_08 - type_5
     obj_06 obj_03 - type_4
     obj_02 obj_07 obj_09 - type_2
     obj_01 obj_05 - type_2
    )
 (:init 
    (pred_2 obj_04 obj_01)
    (pred_2 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_2 obj_08 obj_02)
    (pred_1 obj_08)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_05)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_05)
    (pred_6 obj_01 obj_02)
    (pred_6 obj_09 obj_05)
    (pred_6 obj_02 obj_07)
    (pred_6 obj_07 obj_09)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
