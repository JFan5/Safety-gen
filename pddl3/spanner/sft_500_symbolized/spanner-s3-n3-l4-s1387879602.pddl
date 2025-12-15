; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1387879602 --problem-name spanner-s3-n3-l4-s1387879602
(define (problem spanner-s3-n3-l4-s1387879602)
 (:domain spanner)
 (:objects 
     obj_10 - type_2
     obj_04 obj_13 obj_01 - type_5
     obj_08 obj_03 obj_12 - type_4
     obj_11 obj_07 obj_05 obj_06 - type_3
     obj_02 obj_09 - type_3
    )
 (:init 
    (pred_6 obj_10 obj_02)
    (pred_6 obj_04 obj_05)
    (pred_1 obj_04)
    (pred_6 obj_13 obj_06)
    (pred_1 obj_13)
    (pred_6 obj_01 obj_11)
    (pred_1 obj_01)
    (pred_5 obj_08)
    (pred_6 obj_08 obj_09)
    (pred_5 obj_03)
    (pred_6 obj_03 obj_09)
    (pred_5 obj_12)
    (pred_6 obj_12 obj_09)
    (pred_3 obj_02 obj_11)
    (pred_3 obj_06 obj_09)
    (pred_3 obj_11 obj_07)
    (pred_3 obj_07 obj_05)
    (pred_3 obj_05 obj_06)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_03)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_12))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
