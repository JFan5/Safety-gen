; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1357775342 --problem-name spanner-s3-n3-l4-s1357775342
(define (problem spanner-s3-n3-l4-s1357775342)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_10 obj_04 obj_13 - type_3
     obj_12 obj_02 obj_07 - type_1
     obj_03 obj_08 obj_05 obj_06 - type_5
     obj_11 obj_01 - type_5
    )
 (:init 
    (pred_4 obj_09 obj_11)
    (pred_4 obj_10 obj_05)
    (pred_2 obj_10)
    (pred_4 obj_04 obj_03)
    (pred_2 obj_04)
    (pred_4 obj_13 obj_08)
    (pred_2 obj_13)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_01)
    (pred_3 obj_02)
    (pred_4 obj_02 obj_01)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_01)
    (pred_1 obj_11 obj_03)
    (pred_1 obj_06 obj_01)
    (pred_1 obj_03 obj_08)
    (pred_1 obj_08 obj_05)
    (pred_1 obj_05 obj_06)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_02)
   (pred_6 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
