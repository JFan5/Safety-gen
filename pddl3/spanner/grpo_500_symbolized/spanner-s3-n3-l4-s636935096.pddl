; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 636935096 --problem-name spanner-s3-n3-l4-s636935096
(define (problem spanner-s3-n3-l4-s636935096)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_03 obj_13 obj_02 - type_5
     obj_12 obj_11 obj_06 - type_1
     obj_01 obj_10 obj_05 obj_08 - type_3
     obj_04 obj_07 - type_3
    )
 (:init 
    (pred_3 obj_09 obj_04)
    (pred_3 obj_03 obj_08)
    (pred_1 obj_03)
    (pred_3 obj_13 obj_08)
    (pred_1 obj_13)
    (pred_3 obj_02 obj_08)
    (pred_1 obj_02)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_07)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_07)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_07)
    (pred_4 obj_04 obj_01)
    (pred_4 obj_08 obj_07)
    (pred_4 obj_01 obj_10)
    (pred_4 obj_10 obj_05)
    (pred_4 obj_05 obj_08)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_11)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
