; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 82601995 --problem-name spanner-s3-n3-l4-s82601995
(define (problem spanner-s3-n3-l4-s82601995)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_05 obj_06 obj_01 - type_3
     obj_13 obj_12 obj_08 - type_1
     obj_03 obj_07 obj_11 obj_09 - type_2
     obj_10 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_02 obj_10)
    (pred_6 obj_05 obj_03)
    (pred_5 obj_05)
    (pred_6 obj_06 obj_09)
    (pred_5 obj_06)
    (pred_6 obj_01 obj_11)
    (pred_5 obj_01)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_04)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_04)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_04)
    (pred_3 obj_10 obj_03)
    (pred_3 obj_09 obj_04)
    (pred_3 obj_03 obj_07)
    (pred_3 obj_07 obj_11)
    (pred_3 obj_11 obj_09)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_12)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_10)))
  )
)
)
