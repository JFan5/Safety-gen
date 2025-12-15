; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1679548145 --problem-name spanner-s3-n3-l4-s1679548145
(define (problem spanner-s3-n3-l4-s1679548145)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_04 obj_02 obj_13 - type_4
     obj_10 obj_01 obj_03 - type_1
     obj_07 obj_09 obj_11 obj_06 - type_3
     obj_12 obj_08 - type_3
    )
 (:init 
    (pred_1 obj_05 obj_12)
    (pred_1 obj_04 obj_07)
    (pred_6 obj_04)
    (pred_1 obj_02 obj_06)
    (pred_6 obj_02)
    (pred_1 obj_13 obj_07)
    (pred_6 obj_13)
    (pred_5 obj_10)
    (pred_1 obj_10 obj_08)
    (pred_5 obj_01)
    (pred_1 obj_01 obj_08)
    (pred_5 obj_03)
    (pred_1 obj_03 obj_08)
    (pred_4 obj_12 obj_07)
    (pred_4 obj_06 obj_08)
    (pred_4 obj_07 obj_09)
    (pred_4 obj_09 obj_11)
    (pred_4 obj_11 obj_06)
)
 (:goal
  (and
   (pred_2 obj_10)
   (pred_2 obj_01)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
