; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1504888655 --problem-name spanner-s3-n3-l4-s1504888655
(define (problem spanner-s3-n3-l4-s1504888655)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_06 obj_08 obj_09 - type_2
     obj_01 obj_07 obj_03 - type_1
     obj_02 obj_12 obj_04 obj_05 - type_5
     obj_10 obj_13 - type_5
    )
 (:init 
    (pred_1 obj_11 obj_10)
    (pred_1 obj_06 obj_04)
    (pred_4 obj_06)
    (pred_1 obj_08 obj_05)
    (pred_4 obj_08)
    (pred_1 obj_09 obj_04)
    (pred_4 obj_09)
    (pred_3 obj_01)
    (pred_1 obj_01 obj_13)
    (pred_3 obj_07)
    (pred_1 obj_07 obj_13)
    (pred_3 obj_03)
    (pred_1 obj_03 obj_13)
    (pred_5 obj_10 obj_02)
    (pred_5 obj_05 obj_13)
    (pred_5 obj_02 obj_12)
    (pred_5 obj_12 obj_04)
    (pred_5 obj_04 obj_05)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_07)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_10)))
  )
)
)
