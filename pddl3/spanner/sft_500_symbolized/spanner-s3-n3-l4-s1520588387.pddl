; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1520588387 --problem-name spanner-s3-n3-l4-s1520588387
(define (problem spanner-s3-n3-l4-s1520588387)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_01 obj_03 obj_11 - type_3
     obj_12 obj_08 obj_02 - type_4
     obj_07 obj_09 obj_05 obj_10 - type_1
     obj_13 obj_04 - type_1
    )
 (:init 
    (pred_3 obj_06 obj_13)
    (pred_3 obj_01 obj_07)
    (pred_6 obj_01)
    (pred_3 obj_03 obj_09)
    (pred_6 obj_03)
    (pred_3 obj_11 obj_05)
    (pred_6 obj_11)
    (pred_4 obj_12)
    (pred_3 obj_12 obj_04)
    (pred_4 obj_08)
    (pred_3 obj_08 obj_04)
    (pred_4 obj_02)
    (pred_3 obj_02 obj_04)
    (pred_1 obj_13 obj_07)
    (pred_1 obj_10 obj_04)
    (pred_1 obj_07 obj_09)
    (pred_1 obj_09 obj_05)
    (pred_1 obj_05 obj_10)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_08)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_12)) (not (pred_2 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_13)))
  )
)
)
