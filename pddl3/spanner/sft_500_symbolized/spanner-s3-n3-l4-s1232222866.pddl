; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1232222866 --problem-name spanner-s3-n3-l4-s1232222866
(define (problem spanner-s3-n3-l4-s1232222866)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_11 obj_12 obj_04 - type_2
     obj_10 obj_02 obj_09 - type_1
     obj_08 obj_03 obj_13 obj_07 - type_5
     obj_01 obj_05 - type_5
    )
 (:init 
    (pred_6 obj_06 obj_01)
    (pred_6 obj_11 obj_13)
    (pred_4 obj_11)
    (pred_6 obj_12 obj_07)
    (pred_4 obj_12)
    (pred_6 obj_04 obj_03)
    (pred_4 obj_04)
    (pred_3 obj_10)
    (pred_6 obj_10 obj_05)
    (pred_3 obj_02)
    (pred_6 obj_02 obj_05)
    (pred_3 obj_09)
    (pred_6 obj_09 obj_05)
    (pred_5 obj_01 obj_08)
    (pred_5 obj_07 obj_05)
    (pred_5 obj_08 obj_03)
    (pred_5 obj_03 obj_13)
    (pred_5 obj_13 obj_07)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_02)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
