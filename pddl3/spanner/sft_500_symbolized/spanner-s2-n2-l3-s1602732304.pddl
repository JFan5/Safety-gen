; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1602732304 --problem-name spanner-s2-n2-l3-s1602732304
(define (problem spanner-s2-n2-l3-s1602732304)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_09 obj_02 - type_4
     obj_07 obj_05 - type_5
     obj_01 obj_03 obj_04 - type_3
     obj_06 obj_08 - type_3
    )
 (:init 
    (pred_4 obj_10 obj_06)
    (pred_4 obj_09 obj_03)
    (pred_3 obj_09)
    (pred_4 obj_02 obj_01)
    (pred_3 obj_02)
    (pred_6 obj_07)
    (pred_4 obj_07 obj_08)
    (pred_6 obj_05)
    (pred_4 obj_05 obj_08)
    (pred_1 obj_06 obj_01)
    (pred_1 obj_04 obj_08)
    (pred_1 obj_01 obj_03)
    (pred_1 obj_03 obj_04)
)
 (:goal
  (and
   (pred_5 obj_07)
   (pred_5 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_07)) (not (pred_5 obj_05))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_06)))
  )
)
)
