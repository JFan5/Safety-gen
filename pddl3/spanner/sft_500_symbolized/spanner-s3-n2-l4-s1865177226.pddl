; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1865177226 --problem-name spanner-s3-n2-l4-s1865177226
(define (problem spanner-s3-n2-l4-s1865177226)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_07 obj_11 obj_04 - type_5
     obj_09 obj_03 - type_1
     obj_10 obj_06 obj_02 obj_08 - type_4
     obj_05 obj_01 - type_4
    )
 (:init 
    (pred_1 obj_12 obj_05)
    (pred_1 obj_07 obj_06)
    (pred_6 obj_07)
    (pred_1 obj_11 obj_10)
    (pred_6 obj_11)
    (pred_1 obj_04 obj_02)
    (pred_6 obj_04)
    (pred_4 obj_09)
    (pred_1 obj_09 obj_01)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_01)
    (pred_3 obj_05 obj_10)
    (pred_3 obj_08 obj_01)
    (pred_3 obj_10 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_3 obj_02 obj_08)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
