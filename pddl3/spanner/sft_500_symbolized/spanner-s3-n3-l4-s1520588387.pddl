; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1520588387 --problem-name spanner-s3-n3-l4-s1520588387
(define (problem spanner-s3-n3-l4-s1520588387)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_07 obj_04 obj_01 - type_3
     obj_11 obj_09 obj_12 - type_4
     obj_08 obj_02 obj_03 obj_06 - type_2
     obj_13 obj_10 - type_2
    )
 (:init 
    (pred_3 obj_05 obj_13)
    (pred_3 obj_07 obj_08)
    (pred_5 obj_07)
    (pred_3 obj_04 obj_02)
    (pred_5 obj_04)
    (pred_3 obj_01 obj_03)
    (pred_5 obj_01)
    (pred_4 obj_11)
    (pred_3 obj_11 obj_10)
    (pred_4 obj_09)
    (pred_3 obj_09 obj_10)
    (pred_4 obj_12)
    (pred_3 obj_12 obj_10)
    (pred_2 obj_13 obj_08)
    (pred_2 obj_06 obj_10)
    (pred_2 obj_08 obj_02)
    (pred_2 obj_02 obj_03)
    (pred_2 obj_03 obj_06)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_09)
   (pred_1 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_13)))
  )
)
)
