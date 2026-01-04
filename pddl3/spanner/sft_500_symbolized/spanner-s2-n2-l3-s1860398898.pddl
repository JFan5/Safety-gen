; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1860398898 --problem-name spanner-s2-n2-l3-s1860398898
(define (problem spanner-s2-n2-l3-s1860398898)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_02 obj_09 - type_5
     obj_07 obj_01 - type_3
     obj_04 obj_05 obj_10 - type_1
     obj_08 obj_06 - type_1
    )
 (:init 
    (pred_4 obj_03 obj_08)
    (pred_4 obj_02 obj_05)
    (pred_1 obj_02)
    (pred_4 obj_09 obj_10)
    (pred_1 obj_09)
    (pred_2 obj_07)
    (pred_4 obj_07 obj_06)
    (pred_2 obj_01)
    (pred_4 obj_01 obj_06)
    (pred_3 obj_08 obj_04)
    (pred_3 obj_10 obj_06)
    (pred_3 obj_04 obj_05)
    (pred_3 obj_05 obj_10)
)
 (:goal
  (and
   (pred_6 obj_07)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_07)) (not (pred_6 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_08)))
  )
)
)
