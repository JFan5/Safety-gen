; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1927451474 --problem-name spanner-s3-n3-l4-s1927451474
(define (problem spanner-s3-n3-l4-s1927451474)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_07 obj_09 obj_06 - type_5
     obj_02 obj_11 obj_12 - type_4
     obj_01 obj_10 obj_13 obj_04 - type_2
     obj_08 obj_03 - type_2
    )
 (:init 
    (pred_5 obj_05 obj_08)
    (pred_5 obj_07 obj_01)
    (pred_3 obj_07)
    (pred_5 obj_09 obj_10)
    (pred_3 obj_09)
    (pred_5 obj_06 obj_01)
    (pred_3 obj_06)
    (pred_6 obj_02)
    (pred_5 obj_02 obj_03)
    (pred_6 obj_11)
    (pred_5 obj_11 obj_03)
    (pred_6 obj_12)
    (pred_5 obj_12 obj_03)
    (pred_1 obj_08 obj_01)
    (pred_1 obj_04 obj_03)
    (pred_1 obj_01 obj_10)
    (pred_1 obj_10 obj_13)
    (pred_1 obj_13 obj_04)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_11)
   (pred_4 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_08)))
  )
)
)
