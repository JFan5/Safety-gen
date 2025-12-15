; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1515323846 --problem-name spanner-s3-n3-l4-s1515323846
(define (problem spanner-s3-n3-l4-s1515323846)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_12 obj_08 obj_02 - type_5
     obj_11 obj_06 obj_10 - type_1
     obj_07 obj_13 obj_03 obj_05 - type_3
     obj_01 obj_09 - type_3
    )
 (:init 
    (pred_3 obj_04 obj_01)
    (pred_3 obj_12 obj_13)
    (pred_1 obj_12)
    (pred_3 obj_08 obj_13)
    (pred_1 obj_08)
    (pred_3 obj_02 obj_13)
    (pred_1 obj_02)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_09)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_09)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_09)
    (pred_4 obj_01 obj_07)
    (pred_4 obj_05 obj_09)
    (pred_4 obj_07 obj_13)
    (pred_4 obj_13 obj_03)
    (pred_4 obj_03 obj_05)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_06)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
