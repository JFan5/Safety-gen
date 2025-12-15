; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1811737322 --problem-name spanner-s3-n3-l4-s1811737322
(define (problem spanner-s3-n3-l4-s1811737322)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_01 obj_04 obj_09 - type_4
     obj_07 obj_03 obj_12 - type_2
     obj_08 obj_13 obj_06 obj_02 - type_3
     obj_10 obj_11 - type_3
    )
 (:init 
    (pred_4 obj_05 obj_10)
    (pred_4 obj_01 obj_02)
    (pred_1 obj_01)
    (pred_4 obj_04 obj_02)
    (pred_1 obj_04)
    (pred_4 obj_09 obj_02)
    (pred_1 obj_09)
    (pred_6 obj_07)
    (pred_4 obj_07 obj_11)
    (pred_6 obj_03)
    (pred_4 obj_03 obj_11)
    (pred_6 obj_12)
    (pred_4 obj_12 obj_11)
    (pred_5 obj_10 obj_08)
    (pred_5 obj_02 obj_11)
    (pred_5 obj_08 obj_13)
    (pred_5 obj_13 obj_06)
    (pred_5 obj_06 obj_02)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_03)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_10)))
  )
)
)
