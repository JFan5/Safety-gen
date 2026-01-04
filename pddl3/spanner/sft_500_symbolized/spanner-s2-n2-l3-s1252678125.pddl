; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1252678125 --problem-name spanner-s2-n2-l3-s1252678125
(define (problem spanner-s2-n2-l3-s1252678125)
 (:domain spanner)
 (:objects 
     obj_08 - type_2
     obj_02 obj_01 - type_4
     obj_10 obj_09 - type_3
     obj_04 obj_05 obj_06 - type_5
     obj_07 obj_03 - type_5
    )
 (:init 
    (pred_3 obj_08 obj_07)
    (pred_3 obj_02 obj_04)
    (pred_1 obj_02)
    (pred_3 obj_01 obj_04)
    (pred_1 obj_01)
    (pred_6 obj_10)
    (pred_3 obj_10 obj_03)
    (pred_6 obj_09)
    (pred_3 obj_09 obj_03)
    (pred_2 obj_07 obj_04)
    (pred_2 obj_06 obj_03)
    (pred_2 obj_04 obj_05)
    (pred_2 obj_05 obj_06)
)
 (:goal
  (and
   (pred_4 obj_10)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
