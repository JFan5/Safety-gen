; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1931651293 --problem-name spanner-s3-n2-l4-s1931651293
(define (problem spanner-s3-n2-l4-s1931651293)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_11 obj_09 obj_04 - type_3
     obj_10 obj_07 - type_1
     obj_03 obj_05 obj_12 obj_06 - type_5
     obj_02 obj_08 - type_5
    )
 (:init 
    (pred_2 obj_01 obj_02)
    (pred_2 obj_11 obj_05)
    (pred_3 obj_11)
    (pred_2 obj_09 obj_12)
    (pred_3 obj_09)
    (pred_2 obj_04 obj_05)
    (pred_3 obj_04)
    (pred_1 obj_10)
    (pred_2 obj_10 obj_08)
    (pred_1 obj_07)
    (pred_2 obj_07 obj_08)
    (pred_5 obj_02 obj_03)
    (pred_5 obj_06 obj_08)
    (pred_5 obj_03 obj_05)
    (pred_5 obj_05 obj_12)
    (pred_5 obj_12 obj_06)
)
 (:goal
  (and
   (pred_4 obj_10)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
