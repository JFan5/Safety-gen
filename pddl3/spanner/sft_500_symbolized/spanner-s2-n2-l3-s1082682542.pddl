; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1082682542 --problem-name spanner-s2-n2-l3-s1082682542
(define (problem spanner-s2-n2-l3-s1082682542)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_01 obj_10 - type_3
     obj_04 obj_03 - type_1
     obj_02 obj_08 obj_06 - type_2
     obj_07 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_05 obj_07)
    (pred_6 obj_01 obj_02)
    (pred_3 obj_01)
    (pred_6 obj_10 obj_08)
    (pred_3 obj_10)
    (pred_2 obj_04)
    (pred_6 obj_04 obj_09)
    (pred_2 obj_03)
    (pred_6 obj_03 obj_09)
    (pred_4 obj_07 obj_02)
    (pred_4 obj_06 obj_09)
    (pred_4 obj_02 obj_08)
    (pred_4 obj_08 obj_06)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
