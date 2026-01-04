; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1293082985 --problem-name spanner-s3-n3-l4-s1293082985
(define (problem spanner-s3-n3-l4-s1293082985)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_08 obj_12 obj_10 - type_2
     obj_04 obj_01 obj_02 - type_5
     obj_05 obj_03 obj_07 obj_11 - type_4
     obj_06 obj_13 - type_4
    )
 (:init 
    (pred_3 obj_09 obj_06)
    (pred_3 obj_08 obj_05)
    (pred_6 obj_08)
    (pred_3 obj_12 obj_07)
    (pred_6 obj_12)
    (pred_3 obj_10 obj_07)
    (pred_6 obj_10)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_13)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_13)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_13)
    (pred_4 obj_06 obj_05)
    (pred_4 obj_11 obj_13)
    (pred_4 obj_05 obj_03)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_07 obj_11)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_01)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
