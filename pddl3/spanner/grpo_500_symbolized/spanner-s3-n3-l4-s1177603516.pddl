; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1177603516 --problem-name spanner-s3-n3-l4-s1177603516
(define (problem spanner-s3-n3-l4-s1177603516)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_01 obj_05 obj_06 - type_3
     obj_07 obj_09 obj_02 - type_1
     obj_10 obj_13 obj_11 obj_12 - type_2
     obj_03 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_08 obj_03)
    (pred_6 obj_01 obj_11)
    (pred_5 obj_01)
    (pred_6 obj_05 obj_12)
    (pred_5 obj_05)
    (pred_6 obj_06 obj_10)
    (pred_5 obj_06)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_04)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_04)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_04)
    (pred_3 obj_03 obj_10)
    (pred_3 obj_12 obj_04)
    (pred_3 obj_10 obj_13)
    (pred_3 obj_13 obj_11)
    (pred_3 obj_11 obj_12)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_09)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
