; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1602732304 --problem-name spanner-s2-n2-l3-s1602732304
(define (problem spanner-s2-n2-l3-s1602732304)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_02 obj_01 - type_4
     obj_03 obj_07 - type_2
     obj_08 obj_04 obj_10 - type_5
     obj_09 obj_06 - type_5
    )
 (:init 
    (pred_3 obj_05 obj_09)
    (pred_3 obj_02 obj_04)
    (pred_1 obj_02)
    (pred_3 obj_01 obj_08)
    (pred_1 obj_01)
    (pred_2 obj_03)
    (pred_3 obj_03 obj_06)
    (pred_2 obj_07)
    (pred_3 obj_07 obj_06)
    (pred_5 obj_09 obj_08)
    (pred_5 obj_10 obj_06)
    (pred_5 obj_08 obj_04)
    (pred_5 obj_04 obj_10)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_03)) (not (pred_4 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
