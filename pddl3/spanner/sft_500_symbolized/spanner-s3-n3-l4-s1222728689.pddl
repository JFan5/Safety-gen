; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1222728689 --problem-name spanner-s3-n3-l4-s1222728689
(define (problem spanner-s3-n3-l4-s1222728689)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_06 obj_09 obj_02 - type_1
     obj_07 obj_13 obj_10 - type_4
     obj_01 obj_08 obj_05 obj_11 - type_5
     obj_03 obj_12 - type_5
    )
 (:init 
    (pred_4 obj_04 obj_03)
    (pred_4 obj_06 obj_05)
    (pred_1 obj_06)
    (pred_4 obj_09 obj_11)
    (pred_1 obj_09)
    (pred_4 obj_02 obj_08)
    (pred_1 obj_02)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_12)
    (pred_3 obj_13)
    (pred_4 obj_13 obj_12)
    (pred_3 obj_10)
    (pred_4 obj_10 obj_12)
    (pred_5 obj_03 obj_01)
    (pred_5 obj_11 obj_12)
    (pred_5 obj_01 obj_08)
    (pred_5 obj_08 obj_05)
    (pred_5 obj_05 obj_11)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_13)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_03)))
  )
)
)
