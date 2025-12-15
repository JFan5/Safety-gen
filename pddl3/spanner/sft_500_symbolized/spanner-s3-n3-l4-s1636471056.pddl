; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1636471056 --problem-name spanner-s3-n3-l4-s1636471056
(define (problem spanner-s3-n3-l4-s1636471056)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_11 obj_05 obj_03 - type_4
     obj_12 obj_10 obj_07 - type_3
     obj_13 obj_04 obj_09 obj_02 - type_5
     obj_06 obj_08 - type_5
    )
 (:init 
    (pred_2 obj_01 obj_06)
    (pred_2 obj_11 obj_09)
    (pred_6 obj_11)
    (pred_2 obj_05 obj_13)
    (pred_6 obj_05)
    (pred_2 obj_03 obj_04)
    (pred_6 obj_03)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_08)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_08)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_08)
    (pred_3 obj_06 obj_13)
    (pred_3 obj_02 obj_08)
    (pred_3 obj_13 obj_04)
    (pred_3 obj_04 obj_09)
    (pred_3 obj_09 obj_02)
)
 (:goal
  (and
   (pred_4 obj_12)
   (pred_4 obj_10)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
