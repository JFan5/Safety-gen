; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1615591405 --problem-name spanner-s3-n3-l4-s1615591405
(define (problem spanner-s3-n3-l4-s1615591405)
 (:domain spanner)
 (:objects 
     obj_10 - type_2
     obj_12 obj_05 obj_13 - type_3
     obj_02 obj_03 obj_11 - type_1
     obj_01 obj_07 obj_09 obj_06 - type_4
     obj_04 obj_08 - type_4
    )
 (:init 
    (pred_4 obj_10 obj_04)
    (pred_4 obj_12 obj_07)
    (pred_3 obj_12)
    (pred_4 obj_05 obj_09)
    (pred_3 obj_05)
    (pred_4 obj_13 obj_09)
    (pred_3 obj_13)
    (pred_2 obj_02)
    (pred_4 obj_02 obj_08)
    (pred_2 obj_03)
    (pred_4 obj_03 obj_08)
    (pred_2 obj_11)
    (pred_4 obj_11 obj_08)
    (pred_5 obj_04 obj_01)
    (pred_5 obj_06 obj_08)
    (pred_5 obj_01 obj_07)
    (pred_5 obj_07 obj_09)
    (pred_5 obj_09 obj_06)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_03)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_04)))
  )
)
)
