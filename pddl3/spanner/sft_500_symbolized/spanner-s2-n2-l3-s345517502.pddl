; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 345517502 --problem-name spanner-s2-n2-l3-s345517502
(define (problem spanner-s2-n2-l3-s345517502)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_02 obj_05 - type_3
     obj_03 obj_06 - type_5
     obj_07 obj_10 obj_08 - type_4
     obj_01 obj_04 - type_4
    )
 (:init 
    (pred_5 obj_09 obj_01)
    (pred_5 obj_02 obj_10)
    (pred_4 obj_02)
    (pred_5 obj_05 obj_10)
    (pred_4 obj_05)
    (pred_6 obj_03)
    (pred_5 obj_03 obj_04)
    (pred_6 obj_06)
    (pred_5 obj_06 obj_04)
    (pred_1 obj_01 obj_07)
    (pred_1 obj_08 obj_04)
    (pred_1 obj_07 obj_10)
    (pred_1 obj_10 obj_08)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_06))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
