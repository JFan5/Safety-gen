; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1786719357 --problem-name spanner-s2-n2-l3-s1786719357
(define (problem spanner-s2-n2-l3-s1786719357)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_03 obj_08 - type_4
     obj_02 obj_06 - type_5
     obj_01 obj_09 obj_07 - type_1
     obj_10 obj_04 - type_1
    )
 (:init 
    (pred_2 obj_05 obj_10)
    (pred_2 obj_03 obj_01)
    (pred_4 obj_03)
    (pred_2 obj_08 obj_01)
    (pred_4 obj_08)
    (pred_1 obj_02)
    (pred_2 obj_02 obj_04)
    (pred_1 obj_06)
    (pred_2 obj_06 obj_04)
    (pred_3 obj_10 obj_01)
    (pred_3 obj_07 obj_04)
    (pred_3 obj_01 obj_09)
    (pred_3 obj_09 obj_07)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
