; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1457027772 --problem-name spanner-s2-n2-l3-s1457027772
(define (problem spanner-s2-n2-l3-s1457027772)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_10 obj_06 - type_5
     obj_07 obj_08 - type_4
     obj_03 obj_01 obj_02 - type_2
     obj_05 obj_09 - type_2
    )
 (:init 
    (pred_4 obj_04 obj_05)
    (pred_4 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_4 obj_06 obj_01)
    (pred_1 obj_06)
    (pred_2 obj_07)
    (pred_4 obj_07 obj_09)
    (pred_2 obj_08)
    (pred_4 obj_08 obj_09)
    (pred_5 obj_05 obj_03)
    (pred_5 obj_02 obj_09)
    (pred_5 obj_03 obj_01)
    (pred_5 obj_01 obj_02)
)
 (:goal
  (and
   (pred_6 obj_07)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_07)) (not (pred_6 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
