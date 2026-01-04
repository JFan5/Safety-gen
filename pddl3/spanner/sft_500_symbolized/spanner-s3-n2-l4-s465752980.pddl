; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 465752980 --problem-name spanner-s3-n2-l4-s465752980
(define (problem spanner-s3-n2-l4-s465752980)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_10 obj_03 obj_08 - type_4
     obj_12 obj_07 - type_2
     obj_05 obj_06 obj_11 obj_02 - type_1
     obj_01 obj_04 - type_1
    )
 (:init 
    (pred_2 obj_09 obj_01)
    (pred_2 obj_10 obj_06)
    (pred_3 obj_10)
    (pred_2 obj_03 obj_06)
    (pred_3 obj_03)
    (pred_2 obj_08 obj_06)
    (pred_3 obj_08)
    (pred_4 obj_12)
    (pred_2 obj_12 obj_04)
    (pred_4 obj_07)
    (pred_2 obj_07 obj_04)
    (pred_5 obj_01 obj_05)
    (pred_5 obj_02 obj_04)
    (pred_5 obj_05 obj_06)
    (pred_5 obj_06 obj_11)
    (pred_5 obj_11 obj_02)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
