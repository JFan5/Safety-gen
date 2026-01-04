; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1058075248 --problem-name spanner-s3-n2-l4-s1058075248
(define (problem spanner-s3-n2-l4-s1058075248)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_03 obj_12 obj_05 - type_2
     obj_08 obj_10 - type_3
     obj_02 obj_06 obj_09 obj_04 - type_5
     obj_07 obj_11 - type_5
    )
 (:init 
    (pred_2 obj_01 obj_07)
    (pred_2 obj_03 obj_06)
    (pred_4 obj_03)
    (pred_2 obj_12 obj_06)
    (pred_4 obj_12)
    (pred_2 obj_05 obj_06)
    (pred_4 obj_05)
    (pred_1 obj_08)
    (pred_2 obj_08 obj_11)
    (pred_1 obj_10)
    (pred_2 obj_10 obj_11)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_04 obj_11)
    (pred_6 obj_02 obj_06)
    (pred_6 obj_06 obj_09)
    (pred_6 obj_09 obj_04)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_08)) (not (pred_3 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_07)))
  )
)
)
