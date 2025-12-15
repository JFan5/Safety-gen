; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1357775342 --problem-name spanner-s3-n3-l4-s1357775342
(define (problem spanner-s3-n3-l4-s1357775342)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_05 obj_04 obj_02 - type_4
     obj_03 obj_08 obj_06 - type_2
     obj_13 obj_10 obj_01 obj_09 - type_1
     obj_12 obj_11 - type_1
    )
 (:init 
    (pred_2 obj_07 obj_12)
    (pred_2 obj_05 obj_01)
    (pred_3 obj_05)
    (pred_2 obj_04 obj_13)
    (pred_3 obj_04)
    (pred_2 obj_02 obj_10)
    (pred_3 obj_02)
    (pred_4 obj_03)
    (pred_2 obj_03 obj_11)
    (pred_4 obj_08)
    (pred_2 obj_08 obj_11)
    (pred_4 obj_06)
    (pred_2 obj_06 obj_11)
    (pred_1 obj_12 obj_13)
    (pred_1 obj_09 obj_11)
    (pred_1 obj_13 obj_10)
    (pred_1 obj_10 obj_01)
    (pred_1 obj_01 obj_09)
)
 (:goal
  (and
   (pred_6 obj_03)
   (pred_6 obj_08)
   (pred_6 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_08)) (not (pred_6 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_12)))
  )
)
)
