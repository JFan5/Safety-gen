; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2091458466 --problem-name spanner-s3-n3-l4-s2091458466
(define (problem spanner-s3-n3-l4-s2091458466)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_12 obj_09 obj_13 - type_3
     obj_11 obj_04 obj_02 - type_4
     obj_03 obj_01 obj_07 obj_10 - type_5
     obj_05 obj_08 - type_5
    )
 (:init 
    (pred_1 obj_06 obj_05)
    (pred_1 obj_12 obj_03)
    (pred_6 obj_12)
    (pred_1 obj_09 obj_01)
    (pred_6 obj_09)
    (pred_1 obj_13 obj_07)
    (pred_6 obj_13)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_08)
    (pred_4 obj_04)
    (pred_1 obj_04 obj_08)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_08)
    (pred_3 obj_05 obj_03)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_03 obj_01)
    (pred_3 obj_01 obj_07)
    (pred_3 obj_07 obj_10)
)
 (:goal
  (and
   (pred_5 obj_11)
   (pred_5 obj_04)
   (pred_5 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_11)) (not (pred_5 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
