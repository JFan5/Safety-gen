; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1290291895 --problem-name spanner-s3-n3-l4-s1290291895
(define (problem spanner-s3-n3-l4-s1290291895)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_12 obj_03 obj_07 - type_3
     obj_06 obj_11 obj_10 - type_1
     obj_13 obj_08 obj_02 obj_09 - type_2
     obj_05 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_01 obj_05)
    (pred_6 obj_12 obj_08)
    (pred_5 obj_12)
    (pred_6 obj_03 obj_09)
    (pred_5 obj_03)
    (pred_6 obj_07 obj_08)
    (pred_5 obj_07)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_04)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_04)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_3 obj_05 obj_13)
    (pred_3 obj_09 obj_04)
    (pred_3 obj_13 obj_08)
    (pred_3 obj_08 obj_02)
    (pred_3 obj_02 obj_09)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_11)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
