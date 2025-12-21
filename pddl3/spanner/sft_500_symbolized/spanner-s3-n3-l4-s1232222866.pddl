; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1232222866 --problem-name spanner-s3-n3-l4-s1232222866
(define (problem spanner-s3-n3-l4-s1232222866)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_06 obj_08 obj_05 - type_5
     obj_12 obj_07 obj_10 - type_4
     obj_02 obj_09 obj_03 obj_11 - type_2
     obj_13 obj_01 - type_2
    )
 (:init 
    (pred_2 obj_04 obj_13)
    (pred_2 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_2 obj_08 obj_11)
    (pred_1 obj_08)
    (pred_2 obj_05 obj_09)
    (pred_1 obj_05)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_01)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_01)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_01)
    (pred_6 obj_13 obj_02)
    (pred_6 obj_11 obj_01)
    (pred_6 obj_02 obj_09)
    (pred_6 obj_09 obj_03)
    (pred_6 obj_03 obj_11)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_07)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_10))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_13)))
  )
)
)
