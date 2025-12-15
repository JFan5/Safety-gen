; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1232222866 --problem-name spanner-s3-n3-l4-s1232222866
(define (problem spanner-s3-n3-l4-s1232222866)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_06 obj_10 obj_03 - type_4
     obj_01 obj_04 obj_09 - type_3
     obj_02 obj_07 obj_08 obj_13 - type_1
     obj_05 obj_12 - type_1
    )
 (:init 
    (pred_4 obj_11 obj_05)
    (pred_4 obj_06 obj_08)
    (pred_3 obj_06)
    (pred_4 obj_10 obj_13)
    (pred_3 obj_10)
    (pred_4 obj_03 obj_07)
    (pred_3 obj_03)
    (pred_2 obj_01)
    (pred_4 obj_01 obj_12)
    (pred_2 obj_04)
    (pred_4 obj_04 obj_12)
    (pred_2 obj_09)
    (pred_4 obj_09 obj_12)
    (pred_1 obj_05 obj_02)
    (pred_1 obj_13 obj_12)
    (pred_1 obj_02 obj_07)
    (pred_1 obj_07 obj_08)
    (pred_1 obj_08 obj_13)
)
 (:goal
  (and
   (pred_6 obj_01)
   (pred_6 obj_04)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_04)) (not (pred_6 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
