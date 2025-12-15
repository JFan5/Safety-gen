; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 291076371 --problem-name spanner-s3-n2-l4-s291076371
(define (problem spanner-s3-n2-l4-s291076371)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_05 obj_04 obj_11 - type_3
     obj_02 obj_09 - type_5
     obj_07 obj_03 obj_06 obj_12 - type_1
     obj_01 obj_08 - type_1
    )
 (:init 
    (pred_5 obj_10 obj_01)
    (pred_5 obj_05 obj_12)
    (pred_2 obj_05)
    (pred_5 obj_04 obj_07)
    (pred_2 obj_04)
    (pred_5 obj_11 obj_12)
    (pred_2 obj_11)
    (pred_1 obj_02)
    (pred_5 obj_02 obj_08)
    (pred_1 obj_09)
    (pred_5 obj_09 obj_08)
    (pred_4 obj_01 obj_07)
    (pred_4 obj_12 obj_08)
    (pred_4 obj_07 obj_03)
    (pred_4 obj_03 obj_06)
    (pred_4 obj_06 obj_12)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
