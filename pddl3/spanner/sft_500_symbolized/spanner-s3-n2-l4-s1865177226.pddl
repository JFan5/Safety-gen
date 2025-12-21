; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1865177226 --problem-name spanner-s3-n2-l4-s1865177226
(define (problem spanner-s3-n2-l4-s1865177226)
 (:domain spanner)
 (:objects 
     obj_03 - type_3
     obj_05 obj_08 obj_10 - type_5
     obj_11 obj_06 - type_4
     obj_01 obj_09 obj_07 obj_12 - type_2
     obj_02 obj_04 - type_2
    )
 (:init 
    (pred_2 obj_03 obj_02)
    (pred_2 obj_05 obj_09)
    (pred_1 obj_05)
    (pred_2 obj_08 obj_01)
    (pred_1 obj_08)
    (pred_2 obj_10 obj_07)
    (pred_1 obj_10)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_04)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_04)
    (pred_6 obj_02 obj_01)
    (pred_6 obj_12 obj_04)
    (pred_6 obj_01 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_6 obj_07 obj_12)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
