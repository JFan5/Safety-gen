; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1555775795 --problem-name spanner-s2-n2-l3-s1555775795
(define (problem spanner-s2-n2-l3-s1555775795)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_04 obj_05 - type_1
     obj_02 obj_01 - type_4
     obj_03 obj_10 obj_06 - type_3
     obj_08 obj_09 - type_3
    )
 (:init 
    (pred_2 obj_07 obj_08)
    (pred_2 obj_04 obj_03)
    (pred_1 obj_04)
    (pred_2 obj_05 obj_10)
    (pred_1 obj_05)
    (pred_4 obj_02)
    (pred_2 obj_02 obj_09)
    (pred_4 obj_01)
    (pred_2 obj_01 obj_09)
    (pred_6 obj_08 obj_03)
    (pred_6 obj_06 obj_09)
    (pred_6 obj_03 obj_10)
    (pred_6 obj_10 obj_06)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
