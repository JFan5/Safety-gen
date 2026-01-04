; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1555775795 --problem-name spanner-s2-n2-l3-s1555775795
(define (problem spanner-s2-n2-l3-s1555775795)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_04 obj_03 - type_5
     obj_01 obj_10 - type_1
     obj_02 obj_09 obj_05 - type_3
     obj_08 obj_06 - type_3
    )
 (:init 
    (pred_3 obj_07 obj_08)
    (pred_3 obj_04 obj_02)
    (pred_5 obj_04)
    (pred_3 obj_03 obj_09)
    (pred_5 obj_03)
    (pred_1 obj_01)
    (pred_3 obj_01 obj_06)
    (pred_1 obj_10)
    (pred_3 obj_10 obj_06)
    (pred_6 obj_08 obj_02)
    (pred_6 obj_05 obj_06)
    (pred_6 obj_02 obj_09)
    (pred_6 obj_09 obj_05)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_08)))
  )
)
)
