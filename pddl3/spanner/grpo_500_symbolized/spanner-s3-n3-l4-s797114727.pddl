; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 797114727 --problem-name spanner-s3-n3-l4-s797114727
(define (problem spanner-s3-n3-l4-s797114727)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_11 obj_10 obj_04 - type_5
     obj_01 obj_07 obj_02 - type_1
     obj_06 obj_12 obj_13 obj_05 - type_3
     obj_03 obj_08 - type_3
    )
 (:init 
    (pred_3 obj_09 obj_03)
    (pred_3 obj_11 obj_05)
    (pred_1 obj_11)
    (pred_3 obj_10 obj_05)
    (pred_1 obj_10)
    (pred_3 obj_04 obj_05)
    (pred_1 obj_04)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_08)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_08)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_08)
    (pred_4 obj_03 obj_06)
    (pred_4 obj_05 obj_08)
    (pred_4 obj_06 obj_12)
    (pred_4 obj_12 obj_13)
    (pred_4 obj_13 obj_05)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_07)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
