; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 2050868966 --problem-name spanner-s2-n2-l3-s2050868966
(define (problem spanner-s2-n2-l3-s2050868966)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_08 obj_05 - type_4
     obj_06 obj_01 - type_2
     obj_03 obj_07 obj_04 - type_5
     obj_10 obj_09 - type_5
    )
 (:init 
    (pred_3 obj_02 obj_10)
    (pred_3 obj_08 obj_07)
    (pred_6 obj_08)
    (pred_3 obj_05 obj_07)
    (pred_6 obj_05)
    (pred_4 obj_06)
    (pred_3 obj_06 obj_09)
    (pred_4 obj_01)
    (pred_3 obj_01 obj_09)
    (pred_2 obj_10 obj_03)
    (pred_2 obj_04 obj_09)
    (pred_2 obj_03 obj_07)
    (pred_2 obj_07 obj_04)
)
 (:goal
  (and
   (pred_5 obj_06)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_06)) (not (pred_5 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
