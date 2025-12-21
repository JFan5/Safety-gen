; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1058075248 --problem-name spanner-s3-n2-l4-s1058075248
(define (problem spanner-s3-n2-l4-s1058075248)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_12 obj_01 obj_03 - type_5
     obj_08 obj_07 - type_4
     obj_02 obj_11 obj_09 obj_06 - type_2
     obj_04 obj_10 - type_2
    )
 (:init 
    (pred_2 obj_05 obj_04)
    (pred_2 obj_12 obj_11)
    (pred_1 obj_12)
    (pred_2 obj_01 obj_11)
    (pred_1 obj_01)
    (pred_2 obj_03 obj_11)
    (pred_1 obj_03)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_10)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_10)
    (pred_6 obj_04 obj_02)
    (pred_6 obj_06 obj_10)
    (pred_6 obj_02 obj_11)
    (pred_6 obj_11 obj_09)
    (pred_6 obj_09 obj_06)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_08)) (not (pred_3 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
