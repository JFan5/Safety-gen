; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1741628889 --problem-name spanner-s3-n3-l4-s1741628889
(define (problem spanner-s3-n3-l4-s1741628889)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_11 obj_05 obj_10 - type_4
     obj_01 obj_07 obj_08 - type_2
     obj_02 obj_09 obj_06 obj_03 - type_5
     obj_04 obj_12 - type_5
    )
 (:init 
    (pred_1 obj_13 obj_04)
    (pred_1 obj_11 obj_06)
    (pred_3 obj_11)
    (pred_1 obj_05 obj_09)
    (pred_3 obj_05)
    (pred_1 obj_10 obj_06)
    (pred_3 obj_10)
    (pred_2 obj_01)
    (pred_1 obj_01 obj_12)
    (pred_2 obj_07)
    (pred_1 obj_07 obj_12)
    (pred_2 obj_08)
    (pred_1 obj_08 obj_12)
    (pred_4 obj_04 obj_02)
    (pred_4 obj_03 obj_12)
    (pred_4 obj_02 obj_09)
    (pred_4 obj_09 obj_06)
    (pred_4 obj_06 obj_03)
)
 (:goal
  (and
   (pred_6 obj_01)
   (pred_6 obj_07)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_07)) (not (pred_6 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
