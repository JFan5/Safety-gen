; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1615591405 --problem-name spanner-s3-n3-l4-s1615591405
(define (problem spanner-s3-n3-l4-s1615591405)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_11 obj_06 obj_13 - type_1
     obj_04 obj_07 obj_03 - type_2
     obj_01 obj_08 obj_12 obj_02 - type_4
     obj_05 obj_10 - type_4
    )
 (:init 
    (pred_1 obj_09 obj_05)
    (pred_1 obj_11 obj_08)
    (pred_5 obj_11)
    (pred_1 obj_06 obj_12)
    (pred_5 obj_06)
    (pred_1 obj_13 obj_12)
    (pred_5 obj_13)
    (pred_2 obj_04)
    (pred_1 obj_04 obj_10)
    (pred_2 obj_07)
    (pred_1 obj_07 obj_10)
    (pred_2 obj_03)
    (pred_1 obj_03 obj_10)
    (pred_6 obj_05 obj_01)
    (pred_6 obj_02 obj_10)
    (pred_6 obj_01 obj_08)
    (pred_6 obj_08 obj_12)
    (pred_6 obj_12 obj_02)
)
 (:goal
  (and
   (pred_4 obj_04)
   (pred_4 obj_07)
   (pred_4 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_04)) (not (pred_4 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
