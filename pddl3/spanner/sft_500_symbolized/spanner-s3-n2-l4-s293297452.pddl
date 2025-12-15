; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 293297452 --problem-name spanner-s3-n2-l4-s293297452
(define (problem spanner-s3-n2-l4-s293297452)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_06 obj_10 obj_01 - type_1
     obj_09 obj_11 - type_4
     obj_08 obj_04 obj_07 obj_05 - type_5
     obj_03 obj_02 - type_5
    )
 (:init 
    (pred_1 obj_12 obj_03)
    (pred_1 obj_06 obj_08)
    (pred_2 obj_06)
    (pred_1 obj_10 obj_08)
    (pred_2 obj_10)
    (pred_1 obj_01 obj_08)
    (pred_2 obj_01)
    (pred_6 obj_09)
    (pred_1 obj_09 obj_02)
    (pred_6 obj_11)
    (pred_1 obj_11 obj_02)
    (pred_3 obj_03 obj_08)
    (pred_3 obj_05 obj_02)
    (pred_3 obj_08 obj_04)
    (pred_3 obj_04 obj_07)
    (pred_3 obj_07 obj_05)
)
 (:goal
  (and
   (pred_4 obj_09)
   (pred_4 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_09)) (not (pred_4 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_03)))
  )
)
)
