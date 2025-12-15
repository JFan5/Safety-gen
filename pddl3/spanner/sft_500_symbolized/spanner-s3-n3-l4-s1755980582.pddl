; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1755980582 --problem-name spanner-s3-n3-l4-s1755980582
(define (problem spanner-s3-n3-l4-s1755980582)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_12 obj_08 obj_13 - type_3
     obj_06 obj_05 obj_11 - type_4
     obj_09 obj_04 obj_02 obj_03 - type_2
     obj_10 obj_07 - type_2
    )
 (:init 
    (pred_6 obj_01 obj_10)
    (pred_6 obj_12 obj_09)
    (pred_5 obj_12)
    (pred_6 obj_08 obj_04)
    (pred_5 obj_08)
    (pred_6 obj_13 obj_09)
    (pred_5 obj_13)
    (pred_1 obj_06)
    (pred_6 obj_06 obj_07)
    (pred_1 obj_05)
    (pred_6 obj_05 obj_07)
    (pred_1 obj_11)
    (pred_6 obj_11 obj_07)
    (pred_4 obj_10 obj_09)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_09 obj_04)
    (pred_4 obj_04 obj_02)
    (pred_4 obj_02 obj_03)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_05)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_10)))
  )
)
)
