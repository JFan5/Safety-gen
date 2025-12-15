; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1282984999 --problem-name spanner-s3-n2-l4-s1282984999
(define (problem spanner-s3-n2-l4-s1282984999)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_07 obj_03 obj_11 - type_2
     obj_06 obj_05 - type_4
     obj_02 obj_09 obj_01 obj_08 - type_5
     obj_12 obj_04 - type_5
    )
 (:init 
    (pred_4 obj_10 obj_12)
    (pred_4 obj_07 obj_08)
    (pred_3 obj_07)
    (pred_4 obj_03 obj_01)
    (pred_3 obj_03)
    (pred_4 obj_11 obj_08)
    (pred_3 obj_11)
    (pred_5 obj_06)
    (pred_4 obj_06 obj_04)
    (pred_5 obj_05)
    (pred_4 obj_05 obj_04)
    (pred_2 obj_12 obj_02)
    (pred_2 obj_08 obj_04)
    (pred_2 obj_02 obj_09)
    (pred_2 obj_09 obj_01)
    (pred_2 obj_01 obj_08)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_06)) (not (pred_6 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
