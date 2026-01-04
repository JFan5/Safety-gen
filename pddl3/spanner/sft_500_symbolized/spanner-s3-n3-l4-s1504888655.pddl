; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1504888655 --problem-name spanner-s3-n3-l4-s1504888655
(define (problem spanner-s3-n3-l4-s1504888655)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_07 obj_05 obj_02 - type_3
     obj_03 obj_10 obj_04 - type_1
     obj_06 obj_08 obj_11 obj_13 - type_4
     obj_01 obj_12 - type_4
    )
 (:init 
    (pred_4 obj_09 obj_01)
    (pred_4 obj_07 obj_11)
    (pred_5 obj_07)
    (pred_4 obj_05 obj_13)
    (pred_5 obj_05)
    (pred_4 obj_02 obj_11)
    (pred_5 obj_02)
    (pred_3 obj_03)
    (pred_4 obj_03 obj_12)
    (pred_3 obj_10)
    (pred_4 obj_10 obj_12)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_12)
    (pred_1 obj_01 obj_06)
    (pred_1 obj_13 obj_12)
    (pred_1 obj_06 obj_08)
    (pred_1 obj_08 obj_11)
    (pred_1 obj_11 obj_13)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_10)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_01)))
  )
)
)
