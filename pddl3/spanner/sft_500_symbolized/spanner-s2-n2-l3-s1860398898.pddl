; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1860398898 --problem-name spanner-s2-n2-l3-s1860398898
(define (problem spanner-s2-n2-l3-s1860398898)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_05 obj_06 - type_1
     obj_09 obj_10 - type_2
     obj_01 obj_04 obj_02 - type_3
     obj_08 obj_03 - type_3
    )
 (:init 
    (pred_2 obj_07 obj_08)
    (pred_2 obj_05 obj_04)
    (pred_5 obj_05)
    (pred_2 obj_06 obj_02)
    (pred_5 obj_06)
    (pred_4 obj_09)
    (pred_2 obj_09 obj_03)
    (pred_4 obj_10)
    (pred_2 obj_10 obj_03)
    (pred_1 obj_08 obj_01)
    (pred_1 obj_02 obj_03)
    (pred_1 obj_01 obj_04)
    (pred_1 obj_04 obj_02)
)
 (:goal
  (and
   (pred_6 obj_09)
   (pred_6 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_09)) (not (pred_6 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
