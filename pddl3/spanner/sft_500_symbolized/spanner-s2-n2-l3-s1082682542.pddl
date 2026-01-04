; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1082682542 --problem-name spanner-s2-n2-l3-s1082682542
(define (problem spanner-s2-n2-l3-s1082682542)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_04 obj_07 - type_3
     obj_09 obj_05 - type_4
     obj_03 obj_02 obj_08 - type_1
     obj_10 obj_06 - type_1
    )
 (:init 
    (pred_5 obj_01 obj_10)
    (pred_5 obj_04 obj_03)
    (pred_1 obj_04)
    (pred_5 obj_07 obj_02)
    (pred_1 obj_07)
    (pred_4 obj_09)
    (pred_5 obj_09 obj_06)
    (pred_4 obj_05)
    (pred_5 obj_05 obj_06)
    (pred_3 obj_10 obj_03)
    (pred_3 obj_08 obj_06)
    (pred_3 obj_03 obj_02)
    (pred_3 obj_02 obj_08)
)
 (:goal
  (and
   (pred_6 obj_09)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_09)) (not (pred_6 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
