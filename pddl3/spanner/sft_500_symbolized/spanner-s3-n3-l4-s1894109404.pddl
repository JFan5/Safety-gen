; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1894109404 --problem-name spanner-s3-n3-l4-s1894109404
(define (problem spanner-s3-n3-l4-s1894109404)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_04 obj_01 obj_08 - type_5
     obj_06 obj_13 obj_10 - type_4
     obj_09 obj_02 obj_03 obj_07 - type_2
     obj_12 obj_05 - type_2
    )
 (:init 
    (pred_2 obj_11 obj_12)
    (pred_2 obj_04 obj_03)
    (pred_1 obj_04)
    (pred_2 obj_01 obj_09)
    (pred_1 obj_01)
    (pred_2 obj_08 obj_02)
    (pred_1 obj_08)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_05)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_05)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_05)
    (pred_6 obj_12 obj_09)
    (pred_6 obj_07 obj_05)
    (pred_6 obj_09 obj_02)
    (pred_6 obj_02 obj_03)
    (pred_6 obj_03 obj_07)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_13)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_10))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_12)))
  )
)
)
