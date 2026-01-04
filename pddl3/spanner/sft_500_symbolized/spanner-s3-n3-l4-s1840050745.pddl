; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1840050745 --problem-name spanner-s3-n3-l4-s1840050745
(define (problem spanner-s3-n3-l4-s1840050745)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_08 obj_03 obj_01 - type_4
     obj_05 obj_12 obj_02 - type_5
     obj_10 obj_09 obj_13 obj_06 - type_3
     obj_11 obj_07 - type_3
    )
 (:init 
    (pred_1 obj_04 obj_11)
    (pred_1 obj_08 obj_13)
    (pred_2 obj_08)
    (pred_1 obj_03 obj_10)
    (pred_2 obj_03)
    (pred_1 obj_01 obj_10)
    (pred_2 obj_01)
    (pred_3 obj_05)
    (pred_1 obj_05 obj_07)
    (pred_3 obj_12)
    (pred_1 obj_12 obj_07)
    (pred_3 obj_02)
    (pred_1 obj_02 obj_07)
    (pred_5 obj_11 obj_10)
    (pred_5 obj_06 obj_07)
    (pred_5 obj_10 obj_09)
    (pred_5 obj_09 obj_13)
    (pred_5 obj_13 obj_06)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_12)
   (pred_6 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
