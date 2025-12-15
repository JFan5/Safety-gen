; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 345517502 --problem-name spanner-s2-n2-l3-s345517502
(define (problem spanner-s2-n2-l3-s345517502)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_07 obj_01 - type_1
     obj_10 obj_03 - type_5
     obj_09 obj_02 obj_05 - type_3
     obj_08 obj_06 - type_3
    )
 (:init 
    (pred_6 obj_04 obj_08)
    (pred_6 obj_07 obj_02)
    (pred_4 obj_07)
    (pred_6 obj_01 obj_02)
    (pred_4 obj_01)
    (pred_2 obj_10)
    (pred_6 obj_10 obj_06)
    (pred_2 obj_03)
    (pred_6 obj_03 obj_06)
    (pred_5 obj_08 obj_09)
    (pred_5 obj_05 obj_06)
    (pred_5 obj_09 obj_02)
    (pred_5 obj_02 obj_05)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_10)) (not (pred_1 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
