; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1679548145 --problem-name spanner-s3-n3-l4-s1679548145
(define (problem spanner-s3-n3-l4-s1679548145)
 (:domain spanner)
 (:objects 
     obj_02 - type_1
     obj_10 obj_09 obj_03 - type_2
     obj_13 obj_11 obj_08 - type_5
     obj_07 obj_12 obj_04 obj_01 - type_3
     obj_06 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_02 obj_06)
    (pred_3 obj_10 obj_07)
    (pred_5 obj_10)
    (pred_3 obj_09 obj_01)
    (pred_5 obj_09)
    (pred_3 obj_03 obj_07)
    (pred_5 obj_03)
    (pred_2 obj_13)
    (pred_3 obj_13 obj_05)
    (pred_2 obj_11)
    (pred_3 obj_11 obj_05)
    (pred_2 obj_08)
    (pred_3 obj_08 obj_05)
    (pred_4 obj_06 obj_07)
    (pred_4 obj_01 obj_05)
    (pred_4 obj_07 obj_12)
    (pred_4 obj_12 obj_04)
    (pred_4 obj_04 obj_01)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_11)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_11))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
