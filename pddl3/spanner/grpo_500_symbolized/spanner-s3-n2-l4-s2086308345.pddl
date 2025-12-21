; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 2086308345 --problem-name spanner-s3-n2-l4-s2086308345
(define (problem spanner-s3-n2-l4-s2086308345)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_06 obj_10 obj_05 - type_3
     obj_07 obj_02 - type_1
     obj_08 obj_04 obj_09 obj_01 - type_2
     obj_03 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_12 obj_03)
    (pred_6 obj_06 obj_01)
    (pred_5 obj_06)
    (pred_6 obj_10 obj_04)
    (pred_5 obj_10)
    (pred_6 obj_05 obj_08)
    (pred_5 obj_05)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_11)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_11)
    (pred_3 obj_03 obj_08)
    (pred_3 obj_01 obj_11)
    (pred_3 obj_08 obj_04)
    (pred_3 obj_04 obj_09)
    (pred_3 obj_09 obj_01)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
