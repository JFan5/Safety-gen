; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2093683336 --problem-name spanner-s3-n3-l4-s2093683336
(define (problem spanner-s3-n3-l4-s2093683336)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_01 obj_05 obj_10 - type_5
     obj_03 obj_04 obj_13 - type_3
     obj_12 obj_08 obj_02 obj_09 - type_2
     obj_11 obj_06 - type_2
    )
 (:init 
    (pred_2 obj_07 obj_11)
    (pred_2 obj_01 obj_12)
    (pred_5 obj_01)
    (pred_2 obj_05 obj_02)
    (pred_5 obj_05)
    (pred_2 obj_10 obj_02)
    (pred_5 obj_10)
    (pred_6 obj_03)
    (pred_2 obj_03 obj_06)
    (pred_6 obj_04)
    (pred_2 obj_04 obj_06)
    (pred_6 obj_13)
    (pred_2 obj_13 obj_06)
    (pred_3 obj_11 obj_12)
    (pred_3 obj_09 obj_06)
    (pred_3 obj_12 obj_08)
    (pred_3 obj_08 obj_02)
    (pred_3 obj_02 obj_09)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_04)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_03)) (not (pred_4 obj_04))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_11)))
  )
)
)
